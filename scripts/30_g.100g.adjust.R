

# Tidy Column 1 if not already done -------------------------------------------------------
colnames(lims)[1] <- 'SAMPLE_NUMBER'

# Packages ---------------------------------------------------------------------
library(dplyr)


#Converts all units to g/100g--------------------------------------------------------------
units <- "G_P_100G"

unit <- which((lims$UNITS=="MG_P_100G"))
lims$UNITS[unit] <- "G_P_100G"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.001

unit <- which((lims$UNITS=="MG_P_KG"))
lims$UNITS[unit] <- "G_P_100G"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.0001

unit <- which((lims$UNITS=="PCT_M-M"))
lims$UNITS[unit] <- "G_P_100G"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 1

unit <- which((lims$UNITS=="PERCENT"))
lims$UNITS[unit] <- "G_P_100G"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 1

unit <- which((lims$UNITS=="UG_P_100G"))
lims$UNITS[unit] <- "G_P_100G"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.000001

#Omits any remaining items with irregular units.---------------------------------------------
lims2 <- lims[which(lims$UNITS %in% "G_P_100G"),]

# Set Horwitz value -------------------------------------------------------------------------
hv <- 2

#Exports file -------------------------------------------------------------------------------
write.csv(lims2, file = "clean.units.csv", row.names = FALSE)

