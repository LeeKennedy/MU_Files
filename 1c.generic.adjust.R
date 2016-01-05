
# Clear Environment -----------------------------------------------------------------------
#rm(list=ls())

# Import File ----------------------------------------------------------------------------- 

#lims <- read.csv("FURO01.csv", as.is=TRUE, header = TRUE)

colnames(lims)[1] <- 'SAMPLE_NUMBER'

units <- lims$REPORTED_UNITS[1]
hv <- 2

#Export file -----------------------------------------------------------------------------
write.csv(lims, file = "clean.units.csv", row.names = FALSE)

