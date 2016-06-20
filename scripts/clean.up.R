# Clear Environment ---------------------------------------------
rm(list=ls())
library (dplyr)


lims <- read.csv("ASHS11.csv", as.is=TRUE, header=TRUE)

summary_data <- function(x) {
colnames(x)[1] <- "SAMPLE_NUMBER"

#----------------------------------------------------------------------
testcodes <- length(unique(x$ANALYSIS))
if (testcodes > 1) {
        message("More than one test code present")
        stop()
}
#----------------------------------------------------------------------


reported_names <- unique(x$REPORTED_NAME)
names <- as.data.frame(reported_names)
print (names)

#----------------------------------------------------------------------
print("------------------------------")

units_1 <- table(x$UNITS)
units_2 <- as.data.frame(units_1)
print(units_2)

}

summary_data(lims)

#---selection---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "MG_P_L")

lims <- lims %>%
        filter(ANALYSIS == "SUGA040493")

lims <- lims %>%
        filter(REPORTED_NAME == "Caffeine")

lims$REPORTED_NAME <- "Vitamin D"
