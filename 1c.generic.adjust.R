
# Clear Environment -----------------------------------------------------------------------
rm(list=ls())

# Import File ----------------------------------------------------------------------------- 
lims <- read.csv("WH.csv", stringsAsFactors = FALSE, header = TRUE)
colnames(lims)[1] <- 'SAMPLE_NUMBER'

units <- lims$UNITS[1]

#Export file -----------------------------------------------------------------------------
write.csv(lims, file = "clean.units.csv", row.names = FALSE)

