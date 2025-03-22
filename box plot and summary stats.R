setwd("/Users/ashleyhutchings/Desktop/R Class/Assignment 3 GitHub/Assignment3R")
txt_df<-read.csv("TextMessages.csv", header=TRUE)
head(txt_df)
sapply(txt_df,class)

txt_df$Group<-as.factor(txt_df$Group)

library(tidyverse)
library(ggplot2)

library(tidyr)

txt_long <- txt_df %>% pivot_longer(cols = c(Baseline, Six_months),
               names_to = "Time",
               values_to = "Texts")
head(txt_long)

ggplot(txt_long, aes(x = Time, y = Texts)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  facet_wrap(~ Group) +
  labs(title = "Text Messages by Group and Time Period",
       x = "Time Period",
       y = "Number of Messages") +
  theme_minimal()



txt_long %>%
  group_by(Group, Time) %>%
  summarise(
    count = n(),
    mean = mean(Texts),
    median = median(Texts),
    sd = sd(Texts),
    min = min(Texts),
    max = max(Texts),
    .groups = "drop"
  )
