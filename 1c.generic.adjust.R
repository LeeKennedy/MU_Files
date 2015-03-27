
# Clear Environment -----------------------------------------------------------------------
rm(list=ls())

# Import File ----------------------------------------------------------------------------- 
<<<<<<< HEAD
lims <- read.csv("DENS03.csv", stringsAsFactors = FALSE, header = TRUE)
=======
lims <- read.csv("MOIS23.csv", as.is=TRUE, header = TRUE)
>>>>>>> origin/master
colnames(lims)[1] <- 'SAMPLE_NUMBER'

units <- lims$UNITS[1]

#Export file -----------------------------------------------------------------------------
write.csv(lims, file = "clean.units.csv", row.names = FALSE)

