# Clear Environment ---------------------------------------------
rm(list=ls())


lims <- read.csv("B6.csv", as.is=TRUE, header=TRUE)


colnames(lims)[1] <- "SAMPLE_NUMBER"
library(dplyr)


table(lims$REPORTED_NAME)
unique(lims$UNITS)
table(lims$UNITS)
unique(lims$ANALYSIS)

lims$REPORTED_NAME <- "Vitamin B6"

#-----------------

lims$REPORTED_NAME <- "Vitamin B2"

lims <- lims %>%
        filter(UNITS == "MG_P_L")

