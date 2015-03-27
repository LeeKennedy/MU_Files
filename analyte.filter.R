# Clear Environment -----------------------------------------------------------------------
rm(list=ls())

<<<<<<< HEAD
data <- read.csv("MOIS22.csv", as.is=TRUE, header=TRUE)
=======
data <- read.csv("MICP06-Zinc.csv", as.is=TRUE, header=TRUE)
>>>>>>> origin/master
colnames(data)[1] <- "SAMPLE_NUMBER"
library(dplyr)

table(data$REPORTED_NAME)
unique(data$UNITS)


data$REPORTED_NAME <- "Lactic Acid"

# Split & recalculate --------------------------------------------------------------------
data.A <- data %>%
        filter(REPORTED_NAME == "L Lactic Acid")

data.B <- data %>%
        filter(REPORTED_NAME == "Moisture")%>%
        mutate(ENTRY = 100-ENTRY)%>%
        mutate(REPORTED_NAME = "Total Solids")

data.c <- rbind(data.A, data.B)
write.csv(data.A, "LACA-L/LACA02L.csv", row.names=FALSE)

# Filtering -----------------------------------------------------------------------------
data.F <- data %>%
<<<<<<< HEAD
        filter(grepl("VERICAL LOW",DESCRIPTION)==FALSE)%>%
        filter(grepl("Palmitate", REPORTED_NAME)==FALSE)%>%
        #filter(REPORTED_NAME=="Sorbic Acid")
        filter(grepl("SO2", REPORTED_NAME)==TRUE)
data.F$REPORTED_NAME <- data.F$REPORTED_NAME[1]
write.csv(data.F, "Verical/MOIS22.csv", row.names=FALSE)
=======
        #filter(grepl("Acetate",REPORTED_NAME)==FALSE)%>%
        filter(grepl("Zinc", REPORTED_NAME)==TRUE)
data.F$REPORTED_NAME <- data.F$REPORTED_NAME[1]
write.csv(data.F, "Zinc_a.csv", row.names=FALSE)
>>>>>>> origin/master
