## This data is modified version of data from the New Zealand Election Survey

load('selected_nzes2011.Rdata') ## Rdata can be read through load
library(dplyr)

## reading in data
## dealing with blanks
## dealing with factors

## explore the relationship between the party the person vote for, the party that was their favourite, and if
## they believed that their vote makes a difference

## str() and looking data by view() is inefficient
## we can subset the columns of interest and take a closer look at them

## dplyr() chain to select the variables of interest and investigate only their structure by adding
## str() at the end of the chain.
names(selected_nzes2011)
selected_nzes2011 %>% select(jpartyvote, jdiffvoting,X_singlefav) %>% str()


## when we have hundreds of column names, a useful tip is to just search out only possible names.
## We can search the names for a fragment of the name by using the grep

grep("singlefav", names(selected_nzes2011), ignore.case = FALSE)
names(selected_nzes2011)[107]

##These are all categorical data, however they are recorded as characters as opposed to factors
selected_nzes2011%>%group_by(jpartyvote)%>%summarise(count = n())

selected_nzes2011%>% filter(jpartyvote !="Don't know")%>%group_by(jpartyvote)%>%summarise(count = n())

## add the filter also got rid of the NA entries
selected_nzes2011%>%group_by(X_singlefav) %>% summarise(count = n())

selected_nzes2011 %>% filter(!is.na(X_singlefav), jpartyvote != "Don't know")%>%group_by(X_singlefav)%>% summarise(count = n())

selected_nzes2011 = selected_nzes2011 %>% mutate(sameparty = ifelse(jpartyvote == X_singlefav, "same"," different"))

selected_nzes2011 %>% group_by(jpartyvote, X_singlefav, sameparty)%>%summarise(count = n())

selected_nzes2011 %>% group_by(jpartyvote, X_singlefav, sameparty) %>% summarise(count = n())%>%filter(sameparty == 'same')
selected_nzes2011 %>% group_by(jpartyvote, X_singlefav, sameparty) %>% summarise(count = n())%>%filter(sameparty == 'different')
selected_nzes2011 %>% group_by(jpartyvote, X_singlefav, sameparty) %>% summarise(count = n())%>%filter(is.na(sameparty))


str(selected_nzes2011$jnzflike)
str(selected_nzes2011$jage)

selected_nzes2011 %>% group_by(jnzflike) %>% summarise(count = n()) %>% arrange(desc(count))

## obtain numerical summaries requires that we exclude the NAs from the calculation
selected_nzes2011 %>% filter(!is.na(jage)) %>%  summarise(agemean = mean(jage), agemedian = median(jage), agesd = sd(jage), agemin = min(jage), agemax = max(jage))

selected_nzes2011 %>% mutate(retireage = ifelse(jage >= 65, "retired age","working age"))%>%group_by(retireage)%>%summarise(count = n())

## change the type of data with functions of the form as.thingtochangeto()
selected_nzes2011 = selected_nzes2011%>%mutate(numlikenzf = as.numeric(jnzflike))
## to check 
selected_nzes2011 %>% group_by(jnzflike,numlikenzf)%>%summarise(count = n())

## when we say "turn" this into a number, R uses the numeric order in which it stores the value to do that conversion, as opposed to the names of the 
## the levels of that categorical variable.
## factor entries have two parts: the text we see on the screen, and a numeric order.

selected_nzes2011 = selected_nzes2011%>%mutate(numlikenzf = as.numeric(as.character(jnzflike)))
selected_nzes2011 %>% group_by(jnzflike, numlikenzf)%>%summarise(count = n())

## converting the factor to a charactor first ensures that the numerical values used in the labels of the levels of the categorical variable are used
