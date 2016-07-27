library(statsr)
library(dplyr)
library(ggplot2)

data(nycflights)

names(nycflights)

str(nycflights)

ggplot(data = nycflights, aes(x = dep_delay)) + geom_histogram(binwidth = 15)

rdu_flights = nycflights %>% filter(dest == 'RDU')
ggplot(data = rdu_flights, aes(x = dep_delay)) + geom_histogram()

rdu_flights %>% summarise(mean_dd = mean(dep_delay), sd_dd = sd(dep_delay), n = n())

sfo_feb_flights= nycflights %>% filter(dest == 'SFO', month ==2)

rdu_flights%>% group_by(origin) %>% summarise(mean_dd = mean(dep_delay), sd_dd = sd(dep_delay), n = n())

nycflights %>% group_by(month) %>% summarise(mean_dd = mean(dep_delay))%>%arrange(desc(mean_dd))

ggplot(nycflights, aes(x = factor(month), y = dep_delay)) + geom_boxplot()

nycflights <- nycflights %>%mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))

nycflights %>%group_by(origin) %>%summarise(ot_dep_rate = sum(dep_type == "on time") / n()) %>%arrange(desc(ot_dep_rate))

ggplot(data = nycflights, aes(x = origin, fill = dep_type))+geom_bar()
