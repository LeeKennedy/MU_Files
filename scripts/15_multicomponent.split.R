# Clean Up environment ---------------------------------------------------
rm(list=ls())

# Packages ---------------------------------------------------------------
library(readxl)
library(readr)
library(dplyr)





# Data Cleaning ----------------------------------------------------------
list_lims <- unique(lims$REPORTED_NAME)

n <- length(list_lims)

for (i in 1:n) {
  lims_split <- lims %>% 
    filter(REPORTED_NAME == list_lims[i])
  
    write.csv(lims_split, paste(list_lims[i],".csv", sep=""))
}

