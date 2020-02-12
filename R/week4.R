# R Studio API Code
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import
library(tidyverse)
week4_df <- read_delim(file = "../data/week4.dat", quote = "\"", delim = "-", col_names = c("casenum","parnum","stimver","datadate","qs"))
glimpse(week4_df)
week4_df <- separate(week4_df, qs, c("q1","q2","q3","q4","q5"))
week4_df[5:9] <- sapply(X = week4_df[5:9], FUN = as.numeric)
