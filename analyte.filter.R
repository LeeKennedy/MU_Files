# Clear Environment -----------------------------------------------------------------------
rm(list=ls())


data <- read.csv("FOLA04.csv", as.is=TRUE, header=TRUE)

colnames(data)[1] <- "SAMPLE_NUMBER"
library(dplyr)

table(data$REPORTED_NAME)
unique(data$UNITS)
unique(data$ANALYSIS)

data$REPORTED_NAME <- "Folic Acid"

# Split & recalculate --------------------------------------------------------------------
data.A <- data %>%
        filter(REPORTED_NAME == "Titratable Acidity ( as Lactic Acid )")

data.B <- data %>%
        filter(REPORTED_NAME == "Moisture")%>%
        mutate(ENTRY = 100-ENTRY)%>%
        mutate(REPORTED_NAME = "Total Solids")

data.c <- rbind(data.A, data.B)
write.csv(data.A, "LACA-L/LACA02L.csv", row.names=FALSE)

# Filtering -----------------------------------------------------------------------------

analysis <- "FOLA04A"
data.F <- data %>%
        filter(grepl(analysis,ANALYSIS)==TRUE)
        #filter(grepl("Palmitate", REPORTED_NAME)==FALSE)%>%
        #filter(REPORTED_NAME=="Sorbic Acid")
        #filter(grepl("SO2", REPORTED_NAME)==TRUE)
#data.F$REPORTED_NAME <- data.F$REPORTED_NAME[1]
write.csv(data, paste(analysis, ".csv", sep=""), row.names=FALSE)

