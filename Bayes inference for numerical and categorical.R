library(statsr)
library(dplyr)
library(ggplot2)

data(nc)

## The first step in the analysis, we should take a look at the variables in the dataset
## and how R has encoded them.

str(nc)

## which variables are categorical and which are numerical. For numerical variables, are there outliers?

ggplot(data = nc, aes(x = nc$weight))+geom_histogram(bins = 40)

## bayes_function allows us construct credible intervals and calculate bayes factors for a 
## variety of different circumstances

bayes_inference(y = weight, data = nc, statistic = "mean", type = "ci")
bayes_inference(y = weight, data = nc, statistic = 'mean', type = 'ht', null = 7, alternative = 'twosided')

bayes_inference(y = weight, data =  nc, statistic = 'mean', type = 'ht', null = 5.5, alternative = 'twosided')

## a visualization is a good place to start and will give us a better understanding of the data
str(nc$habit)

ggplot(data = nc, aes(x = nc$habit,y = nc$weight)) +geom_boxplot()

bayes_inference(y = weight, x = habit, data = nc, statistic = 'mean', type = 'ci')

bayes_inference(y= weight, x = habit, data =nc, statistic = 'mean', type = 'ht', null = 0, alternative = 'twosided')

## Inference for proportions
## we can also conduct bayeian inference when our outcome variable of interest is categorical


str(nc$lowbirthweight)


## To test if ony 7.5% of biths in NC are considered low birth weight we can calculate bayes factor using the following code
bayes_inference(y = lowbirthweight, data = nc, success = "low",statistic = 'proportion', type = 'ht', null = 0.075, alternative = 'twosided')
