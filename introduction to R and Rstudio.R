library(dplyr)
library(ggplot2)
library(statsr)



data(arbuthnot)

dim(arbuthnot)

names(arbuthnot)

arbuthnot$boys

ggplot(data = arbuthnot, aes(x = year, y = girls)) + geom_point()

arbuthnot$boys + arbuthnot$ girls 

arbuthnot <- arbuthnot %>% mutate(total = boys + girls)

ggplot(data = arbuthnot, aes(x = year, y = total)) + geom_line()

ggplot(data = arbuthnot, aes(x= year, y= total)) + geom_line() + geom_point()

arbuthnot = arbuthnot %>% mutate(more_boys = boys>girls)


data(present)
