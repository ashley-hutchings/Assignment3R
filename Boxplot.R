#Start by installing required packages

#install.packages("ggplot2")
library(ggplot2)
library(readr)
library(tidyr)

#Read data

Data <- read.csv("TextMessages.csv")

#Convert data for plotting

text_long <- Data %>%
  pivot_longer(cols = c(Baseline, Six_months),
               names_to = "Time",
               values_to = "TextMessages")

#We do this because it works well when converting data to a boxplot.

#Creating actual boxplot

ggplot(text_long, aes(x = Time, y = TextMessages)) +
  geom_boxplot() +
  labs(
    title = "Text Messages Over Time",
    x = "Time Point",
    y = "Number of Text Messages")

#The boxplot compares the number of text messages sent at baseline and six
#months, helping us see how the message activity changed over time. The boxplot
#shows that the number of text messages decreased from baseline to six
#months, as the median and overall distribution of messages are lower at the
#six month mark.