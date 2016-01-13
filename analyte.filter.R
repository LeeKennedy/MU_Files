# Clear Environment ---------------------------------------------
rm(list=ls())
library (dplyr)



lims <- read.csv("CFOS_Lactose_071215.csv", as.is=TRUE, header=TRUE)


colnames(lims)[1] <- "SAMPLE_NUMBER"

table(lims$REPORTED_NAME)
unique(lims$UNITS)
table(lims$UNITS)
unique(lims$ANALYSIS)



#-----------------

lims$REPORTED_NAME <- "Vitamin B2"

lims <- lims %>%

        filter(REPORTED_UNITS == "PCT_M-V")


        filter(PRODUCT_GRADE == "EAP00701" |
                       PRODUCT_GRADE == "EAP00702" |
                       PRODUCT_GRADE == "EAP00703" |
                       PRODUCT_GRADE == "EAP00700" |
                       PRODUCT_GRADE == "EAP00717")


lims <- lims %>%
        #filter(grepl("6.38",REPORTED_NAME)
        filter(REPORTED_NAME == "Total Solids")