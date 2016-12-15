

colnames(lims)[1] <- 'SAMPLE_NUMBER'

units <- lims$UNITS[1]
hv <- 6

#Export file -----------------------------------------------------------------------------
write.csv(lims, file = "clean.units.csv", row.names = FALSE)

