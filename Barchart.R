#Load libraries

library(readr)
library(tidyr)
library(ggplot2)

#Load Data

Data <- read_csv("TextMessages.csv")

#Change format

text_long <- pivot_longer(
  Data,
  cols = c(Baseline, Six_months),
  names_to = "Time",
  values_to = "TextMessages")

#Creating actual Bar Chart

ggplot(text_long, aes(x = Time, y = TextMessages)) +
  stat_summary(fun = mean, geom = "bar") +
  facet_wrap(~ Group) +
  labs(
    title = "Text Messages Over Time",
    x = "Time",
    y = "Number of Text Messages"
  )

# The bar chart compares the average number of text messages sent at baseline 
# and six months for each group. It shows that the average number of messages 
# decreased from baseline to six months, indicating a drop in message activity 
# over time across both groups.
