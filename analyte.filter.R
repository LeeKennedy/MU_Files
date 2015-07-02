# Clear Environment -----------------------------------------------------------------------
rm(list=ls())


data <- read.csv("ASHS04.csv", as.is=TRUE, header=TRUE)

colnames(data)[1] <- "SAMPLE_NUMBER"
library(dplyr)

table(data$REPORTED_NAME)
unique(data$UNITS)
unique(data$ANALYSIS)



