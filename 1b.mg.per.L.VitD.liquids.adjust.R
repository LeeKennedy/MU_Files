### CHANGE ###: file name 
#lims <- read.csv("VITD01-Vitamin D.csv", as.is=TRUE,header = TRUE)

colnames(lims)[1] <- 'SAMPLE_NUMBER'

#Converts all units to mg/kg
units <- "UG_P_L"



unit <- which((lims$UNITS=="MG_P_100ML"))
lims$UNITS[unit] <- "UG_P_L"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 10000

unit <- which((lims$UNITS=="UG_P_100ML"))
lims$UNITS[unit] <- "UG_P_L"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 10

unit <- which((lims$UNITS=="IU_P_100ML"))
lims$UNITS[unit] <- "UG_P_L"
lims$ENTRY[unit] <- as.numeric(lims$ENTRY[unit]) * 0.25

lims2 <- lims[which(lims$UNITS %in% "UG_P_L"),]

#Omits any remaining items with irregular units.

# Set Horwitz value -------------------------------------------------------------------------
hv <- 9

write.csv(lims2, file = "clean.units.csv", row.names = FALSE)

