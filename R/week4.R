# R Studio API Code
library(rstudioapi)
setwd(dirname(getActiveDocumentContext()$path))

# Data Import
library(tidyverse)
week4_df <- read_delim(file = "../data/week4.dat", delim = "-", col_names = c("casenum","parnum","stimver","datadate","qs"))
glimpse(week4_df)
week4_df <- separate(week4_df, qs, c("q1","q2","q3","q4","q5"))
week4_df[5:9] <- sapply(X = week4_df[5:9], FUN = as.numeric)
week4_df[,5:9][(week4_df[5:9] == 0)] <- NA




library(lubridate)
week4_df$datadate <- mdy_hms(week4_df$datadate)

# Data Analysis
q2_over_time_df <- spread(week4_df[,c(2,3,6)], stimver, q2)
sum(complete.cases(q2_over_time_df)) / nrow(q2_over_time_df)