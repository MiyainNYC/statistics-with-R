## Use conjugagte priors and credible intervals to examine some categorical and count data 

library(statsr)
data(brfss)
library(shiny)


credible_interval_app()

## Suppose the posterior distribution of ???? follows a Normal distribution 
## with mean 10 and variance 5. 
##  Which of the following are the bounds of a 95% credible interval for ?????
qnorm(c(0.025, 0.975), mean = 10, sd = 2.236)

## Suppose the posterior distribution of pp follows a Beta distribution with ??=2??=2 and ??=5??=5. Which of the following are the bounds of a 90% credible interval for pp?
qbeta(c(0.05, 0.95), shape1 = 2, shape2 = 5)

## Suppose the posterior distribution of ???? follows a Gamma distribution with ??=4??=4 and ??=8??=8. Which of the following are the bounds of a 99% credible interval for ????? 
qgamma(c(0.005,0.995), shape = 4, rate = 8)

## Beta-binomial
# the beta distribution is conjugate to the binomial distribution -meaning that if we use a beta prior to the parameter p of the
## binomial distribution then the posterior distribution of p after observing data will be another beta distribution

## Our goal with inference in general is to take specific observations(data) and use them to make useful statements about unkown population parameters of interest
# The Beta-Binomial is a Bayesian approach for inference about a single population proportion pp. Whereas with the frequentist approach we used p^=x/np^=x/n we will now just use xx and nn directly with xx being the number of successes obtained from nn identical Bernoulli trials. As such, we can view xx as a Binomial random variable with nn trials and pp probability of success.



## To complete our Bayesian specification,  all that is left is to define our prior beliefs for the value of pp by defining a prior distribution. Our choice of the prior hyperparameters (aa and bb) should reflect our prior beliefs about our parameter of interest.

# Perform sex ratio of respondents to the BRFSS

table(brfss$sex)

n = length(brfss$sex)
x = sum(brfss == 'female')

# Beta(??=1+2586, ??=1+2414)
qbeta(c(0.025, 0.975),shape1 =  2587, shape2 = 2425)

## a good prior helps, however a bad prior can hurt your results.

table(brfss$exercise)
mean(brfss$exercise, na.rm = T)

## Since the Poisson distribution describes counts in a given interval, we will use this distribution as a model for the fruit_per_day variable which records the servings of fruit the respondents consume per day. The Poisson distribution has a single parameter, ????, which is the expected number of counts per time period. The Gamma-Poisson is another example of a conjugate family where using the Gamma distribution as a prior for the rate parameter ???? from the Poisson distribution results in a Gamma posterior for ????.
## Once again, our choice of the prior parameters (aa and bb) should reflect our prior beliefs about our parameter of interest (????), and in the case of the Gamma-Poisson we can view aa as the number of total counts and bb as the number of time periods observed.
qgamma(c(0.025, 0.975), shape = 22, rate = 6)