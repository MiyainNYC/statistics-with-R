library(dplyr)
library(statsr)

data("kobe_basket")

kobe_streak = calc_streak(kobe_basket$shot)

ggplot(data = kobe_streak, aes(x = length)) + geom_histogram(binwidth = 1)


## Simulations in R

## In a simulation, you set the ground rules of a random process and then the comupter 
## uses random numbers to generate an outcome that adheres to those rules.

coin_outcomes = c('heads', 'tails') ## combine values into a vector or a list
sample(coin_outcomes, size = 1, replace = TRUE)


sim_fair_coin = sample(coin_outcomes, size = 100, replace = TRUE)

table(sim_fair_coin)

sim_unfair_coin = sample(coin_outcomes, size = 100, replace = TRUE, prob = c(0.2,0.8))

## Simulating the independent shooter

shot_outcomes = c('H','M')
sim_basket = sample(shot_outcomes, size = 133, replace = TRUE, prob = c(0.45,0.55))
basket_streak = calc_streak(sim_basket)
ggplot(data = basket_streak, aes(x = length)) + geom_histogram(binwidth = 1)
