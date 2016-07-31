library(statsr)
library(dplyr)
library(ggplot2)

data(mlb11)
str(mlb11)

str(mlb11$runs)

plot(x = mlb11$runs, y = mlb11$at_bats)

mlb11 %>% summarise(cor(runs, at_bats))

m1 = lm(runs ~ at_bats, data = mlb11)

summary(m1)

ggplot(data = mlb11, aes(x = at_bats, y = runs)) + geom_point() + stat_smooth(method = 'lm', se = FALSE)

mlb11 %>% filter(at_bats == 5579) %>% select(runs)
  

## Model diagonostics
ggplot(data = m1, aes(x = .fitted, y =.resid)) + geom_point()+geom_hline(yintercept = 0, linetype = 'dashed')+xlab('Fitted values')+ylab('Residuals')

ggplot(data = m1, aes(x = .resid))+geom_histogram(binwidth = 25) + xlab('Residuals')

ggplot(data =m1, aes(sample = .resid)) + stat_qq()
