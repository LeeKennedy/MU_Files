# Clean Up environment ---------------------------------------------------
rm(list=ls())

# Packages ---------------------------------------------------------------
library(tidyverse)
library(readxl)
library(lubridate)

###  Functions -----------------------------------------------------------
outliers <- function (x, b = FALSE) {
xx <- sapply(x, as.numeric)

#xx <- sort(xx)

remove_outliers <- function(x, na.rm = TRUE, ...) {
 qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
 H <- 1.5 * IQR(x, na.rm = na.rm)
 y <- x
 y[x < (qnt[1] - H)] <- NA
 y[x > (qnt[2] + H)] <- NA
 y
}

yy <- remove_outliers(xx)
ww <- remove_outliers(yy)
zz <- remove_outliers(ww)

diff.out <- data.frame(xx, yy, ww, zz)

if(b == TRUE){
boxplot(diff.out)
}

return(zz)
}

# Data Input -------------------------------------------------------------

bias <- read_excel("W:/Quality Documents Controlled - General Access/Chemistry/MU/Bias Data Compilation.xlsx", 
           col_types = c("text", "text", "date", 
                         "text", "text", "text", "text", "numeric", 
                         "numeric", "numeric", "numeric", 
                         "numeric", "numeric", "numeric", 
                         "numeric", "numeric", "text"))

bias <- bias[-c(1:9),1:14]

colnames(bias) <- c("Type", "Reference", "Date", "Test_Code", "Analyte", "Unit", "Matrix","Reference_Mean", "sd","no","Lab_Result","pct_sd", "Bias", "pct_Bias")


# Data Cleaning ----------------------------------------------------------

bias$year <- year(bias$Date)
bias <- bias %>%
        filter(year > 2017)
bias <- bias[,-15]


# Bias--------------------------------------------------------------------


summary_bias <- bias %>% 
        group_by(Test_Code, Analyte, Matrix) %>% 
        mutate(pct_Bias = outliers(pct_Bias)) %>% 
        summarize(n = sum(!is.na(pct_Bias)), u_ref = mean(pct_sd, na.rm = TRUE)/sqrt(mean(no, na.rm = TRUE)), av_bias = mean(pct_Bias, na.rm = TRUE), sd_bias = sd(pct_Bias, na.rm = TRUE),UoB = sqrt(u_ref^2 + sd_bias^2))


summary_bias <- summary_bias %>% 
        filter(n >1)
summary_bias <- summary_bias[,c(1,2,3,4,6,8)]

summary_bias

#write.csv(summary_bias, "MU_Bias_Summary2.csv")
