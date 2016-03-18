# Clear Environment ---------------------------------------------
rm(list=ls())
library (dplyr)


lims <- read.csv("VITP04_D.csv", as.is=TRUE, header=TRUE)

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
        filter(REPORTED_NAME == "Protein (TN x 6.38)")
