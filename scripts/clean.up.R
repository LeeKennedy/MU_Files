# Clear Environment ---------------------------------------------------
rm(list=ls())

# Packages ------------------------------------------------------------
library (dplyr)


# Functions -----------------------------------------------------------
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

# Program -------------------------------------------------------------

lims <- read.csv("VITE05.csv", as.is=TRUE, header=TRUE)
summary_data(lims)

