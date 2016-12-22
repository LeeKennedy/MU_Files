

# Packages ---------------------------------------------------------------
library(readxl)
library(readr)
library(dplyr)


colnames(lims)[1] <- "SAMPLE_NUMBER"


# Data Cleaning ----------------------------------------------------------
list_lims <- unique(lims$ANALYSIS)

n <- length(list_lims)

for (i in 1:n) {
  lims_split <- lims %>% 
    filter(ANALYSIS == list_lims[i])
  
    write.csv(lims_split, paste(list_lims[i],".csv", sep=""))
}

