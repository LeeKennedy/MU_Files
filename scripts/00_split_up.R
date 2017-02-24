#### Clean Up environment ---------------------------------------------------
rm(list=ls())

# Packages ---------------------------------------------------------------
library(readxl)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(dts.quality)
library(lubridate)

#### Functions --------------------------------------------------------------


#### Data Input -------------------------------------------------------------

data_all <- read_excel("W:/lab/CHEMISTRY/Technical Support Projects/- MU Data -/2017 MU Data/SUGA03/SUGA03_All.xlsx")

#### Data Cleaning ----------------------------------------------------------

analytes <- unique(data_all$REPORTED_NAME)
analytes
analytes <- analytes[1:9]
n <- length(analytes)

#### Data Export ------------------------------------------------------------

for (i in 1:n) 
{
        sub <- data_all %>% 
        filter(REPORTED_NAME == analytes[i])
write.csv(sub, paste(analytes[i],".csv", sep=""))
}
