# Clear Environment ---------------------------------------------------
rm(list=ls())

# packages ------------------------------------------------------------
library (tidyverse)
library(LK.Toolbox)
library(readxl)


# Function ------------------------------------------------------------

summary_data <- function(x) {
colnames(x)[1] <- "SAMPLE_NUMBER"

#----------------------------------------------------------------------
testcodes <- length(unique(x$ANALYSIS))
if (testcodes > 1) {
        message("More than one test code present")
       
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

#lims <- read_csv("FATS01.csv")

lims <- read_excel("PROT01_all.xlsx", 
              col_types = c("numeric", "date", "text", 
              "text", "text", "text", "text", "text", 
              "numeric", "date", "numeric", "numeric", 
              "text", "text", "text", "text", "text", 
              "text"))
lims <- strip_mm(lims)

summary_data(lims)
table(lims$REPORTED_NAME)



