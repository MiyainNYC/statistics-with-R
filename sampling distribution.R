library(statsr)
library(dplyr)
library(ggplot2)

data("ames")
dim(ames)

## restrict our attention to just two of the variables: the above ground
## living area of the house in square feet and the sale price.


## first explore the distribution of home sales visually
ggplot(data = ames, aes(x = area)) + geom_histogram(binwidth = 250)

ames %>% summarise(mu = mean(area), pop_med = median(area),
                   sigma = sd(area), pop_iqr = IQR(area),
                   pop_min = min(area), pop_max = max(area),
                   pop_q1 = quantile(area, 0.25),
                   pop_q3= quantile(area, 0.75))

## take a sample
samp1 = ames %>% sample_n(size = 50)
ggplot(data = samp1, aes(x = area)) + geom_histogram(binwidth = 300)
samp1 %>% summarise(mu = mean(area), pop_med = median(area),
                   sigma = sd(area), pop_iqr = IQR(area),
                   pop_min = min(area), pop_max = max(area),
                   pop_q1 = quantile(area, 0.25),
                   pop_q3= quantile(area, 0.75))

samp1 %>% summarise(x_bar = mean(area))

## take one more sample
ames %>% sample_n(size = 50)%>% summarise(x_bar = mean(area))

## take many samples
sample_means50 = ames%>%rep_sample_n(size = 50, reps = 15000, replace = TRUE) %>% summarise(x_bar = mean(area))
ggplot(data = sample_means50, aes(x = x_bar)) + geom_histogram(binwidth = 20)

mean(sample_means50$x_bar)
dim(sample_means50)
