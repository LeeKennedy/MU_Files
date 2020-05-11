#### Clean Up environment -----------------------------
rm(list=ls())

#### Packages -----------------------------
library(readxl)
library(tidyverse)
library(LK.Toolbox)
library(lubridate)
library(here)


#### Functions -----------------------------


#### Data Input -----------------------------
here::here()

vita_data <- read_excel("data/VITA12_MU.xlsx", 
                   col_types = c("numeric", "date", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "numeric", "date", "numeric", 
                                 "numeric", "text", "text", "text", 
                                 "text", "text", "text"))

vita_data$year <- year(vita_data$LOGIN_DATE)
#### Data Cleaning -----------------------------

n <- unique(vita_data$year)

for (i in 1:n){
  
  sub_year <- vita_data %>% 
    filter(year == n[i])
  
  destination <- paste("data/VITA12/", n[i],"/",n[i],"_data.csv", sep = "")
  
  write.csv(sub_year, destination )
  
}

#### Visualising Data -----------------------------