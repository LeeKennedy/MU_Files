# Clear Environment ---------------------------------------------
rm(list=ls())
library (dplyr)
library(readr)


lims <- read.csv("INSI01.csv", as.is=TRUE, header=TRUE)

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

<<<<<<< HEAD:scripts/10_clean.up.R
# Program -------------------------------------------------------------

lims <- read_csv("~/Documents/GitHub/MU_Files/data/ASHS04.csv")
=======
>>>>>>> origin/master:scripts/clean.up.R
summary_data(lims)

#---Duplicates---------------------------------------------------------

table(lims$ANALYSIS)
table(lims$UNITS)

# Selection -----------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "UEQ_P_ML")

lims <- lims %>%
        filter(ANALYSIS == "PROT010201")

lims <- lims %>%
        filter(REPORTED_NAME == "Glucose")

lims$REPORTED_NAME <- "Benzoic Acid"
