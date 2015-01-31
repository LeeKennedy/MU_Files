### CHANGE ###: file name 
lims <- read.csv("CODW02.csv", stringsAsFactors = FALSE, header = TRUE)
colnames(lims)[1] <- 'SAMPLE_NUMBER'

units <- lims$UNITS[1]

write.csv(lims, file = "clean.units.csv", row.names = FALSE)

