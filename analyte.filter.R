# Clear Environment -----------------------------------------------------------------------
rm(list=ls())


data <- read.csv("ICPM04.csv", as.is=TRUE, header=TRUE)

colnames(data)[1] <- "SAMPLE_NUMBER"
library(dplyr)

data <- data %>%
        filter(!grepl("ICPM", REPORTED_NAME))

table(data$REPORTED_NAME)
unique(data$UNITS)
unique(data$ANALYSIS)


#-----------------

lims <- data %>%
        filter(REPORTED_NAME == "Zinc")
