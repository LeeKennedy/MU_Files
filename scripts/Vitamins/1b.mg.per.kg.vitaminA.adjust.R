
colnames(lims)[1] <- 'SAMPLE_NUMBER'

#Converts all units to mg/kg
units <- "MG_P_KG"

hv <- 6

unit <- which((lims$UNITS=="MG_P_100G"))
lims$UNITS[unit] <- "MG_P_KG"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 10

unit <- which((lims$UNITS=="UG_P_100G"))
lims$UNITS[unit] <- "MG_P_KG"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.01

unit <- which((lims$UNITS=="IU_P_100G"))
lims$UNITS[unit] <- "MG_P_KG"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.003

unit <- which((lims$UNITS=="UG_P_KG"))
lims$UNITS[unit] <- "MG_P_KG"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.0003

unit <- which((lims$UNITS=="MG_P_G"))
lims$UNITS[unit] <- "MG_P_KG"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 1000

unit <- which((lims$UNITS=="IU_P_KG"))
lims$UNITS[unit] <- "MG_P_KG"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.03

lims2 <- lims[which(lims$UNITS %in% "MG_P_KG"),]

#Omits any remaining items with irregular units.
write.csv(lims2, file = "clean.units.csv", row.names = FALSE)

