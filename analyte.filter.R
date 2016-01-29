# Clear Environment ---------------------------------------------
rm(list=ls())
library (dplyr)



lims <- read.csv("MOIS08.csv", as.is=TRUE, header=TRUE)


colnames(lims)[1] <- "SAMPLE_NUMBER"

table(lims$REPORTED_NAME)
unique(lims$UNITS)
table(lims$UNITS)
unique(lims$ANALYSIS)



#-----------------

lims <- lims %>%
        filter(grepl("Moisture",REPORTED_NAME))


lims$REPORTED_NAME <- "Vitamin B6 (Pyridoxine)"
#-------------------


lims$REPORTED_NAME <- "Vitamin B2"

lims <- lims %>%
        filter(UNITS == "MG_P_L")


filter(PRODUCT_GRADE == "EAP00701" |
               PRODUCT_GRADE == "EAP00702" |
               PRODUCT_GRADE == "EAP00703" |
               PRODUCT_GRADE == "EAP00700" |
               PRODUCT_GRADE == "EAP00717")
