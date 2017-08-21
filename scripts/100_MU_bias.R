# Clean Up environment ---------------------------------------------------
rm(list=ls())

# Packages ---------------------------------------------------------------
library(tidyverse)
library(readxl)

# Functions --------------------------------------------------------------

remove_outliers <- function(x, na.rm = TRUE, ...) {
        qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
        H <- 1.5 * IQR(x, na.rm = na.rm)
        y <- x
        y[x < (qnt[1] - H)] <- NA
        y[x > (qnt[2] + H)] <- NA
        y
}

# Data Input -------------------------------------------------------------

bias <- read_excel("~/Desktop/Bias Data Compilation.xlsx", 
                   col_types = c("text", "text", "date", 
                                 "text", "text", "text", "text", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "text"))
bias <- bias[-c(1:9),1:14]

colnames(bias) <- c("Type", "Reference", "Date", "Test_Code", "Analyte", "Unit", "Matrix","Reference_Mean", "sd","no","Lab_Result","pct_sd", "Bias", "pct_Bias")

# Bias-----------------------------------------------------------


summary_bias <- bias %>% 
        group_by(Test_Code, Analyte, Matrix) %>% 
        summarize(n = n(), u_ref = mean(pct_sd)/sqrt(mean(no)), av_bias = mean(pct_Bias), sd_bias = sd(pct_Bias),UoB = sqrt(u_ref^2 + sd_bias^2))


summary_bias <- summary_bias %>% 
        filter(n >1)
summary_bias <- summary_bias[,c(1,2,3,4,6,8)]

summary_bias

write.csv(summary_bias, "MU_Bias_Summary.csv")
