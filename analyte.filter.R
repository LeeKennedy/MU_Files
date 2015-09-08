# Clear Environment ---------------------------------------------
rm(list=ls())


lims <- read.csv("MOIS01a.csv", as.is=TRUE, header=TRUE)


colnames(lims)[1] <- "SAMPLE_NUMBER"
library(dplyr)


table(lims$REPORTED_NAME)
unique(lims$UNITS)
table(lims$UNITS)
unique(lims$ANALYSIS)



#-----------------


lims <- lims %>%
        filter(ANALYSIS == "MICP010406")

