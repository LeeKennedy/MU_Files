#### Clean Up environment -----------------------------
rm(list=ls())

#### Packages -----------------------------
library(readxl)
library(tidyverse)
library(here)


#### Functions -----------------------------
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

#### Data Input -----------------------------
here()

srm_data <- read_csv("srmdata.csv")

#### Data Cleaning -----------------------------

srm_data2 <- srm_data[,c(1,9)]

srm_data3 <- srm_data2 %>%
        mutate(Diff = ENTRY - lag(ENTRY)) %>% 
        na.omit() %>% 
        mutate(Diff = outliers(Diff)) %>% 
        na.omit()


mean_diff <- mean(srm_data3$Diff)
sd_diff <- sd(srm_data3$Diff)

Actual_sd <- sd_diff/sqrt(2)
MU <- 2*Actual_sd

#### Visualising Data -----------------------------

srm_diff_plot <- ggplot(srm_data3, aes(x=SAMPLE_NUMBER, y = Diff)) +
        geom_point(size = 4, shape = 21, fill = "cornflowerblue")
srm_diff_plot
