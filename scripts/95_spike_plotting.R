#### Clean Up environment -----------------------------
#rm(list=ls())

#### Packages -----------------------------
library(readxl)
library(tidyverse)
library(here)
library(psych)


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
setwd(here())

data <- read_csv("spikedata.csv")


#### Data Cleaning -----------------------------

data1 <- data %>%
        mutate(ENTRY = outliers(ENTRY)) %>% 
        filter(!is.na(ENTRY))

#### Visualising Data -----------------------------

plot_ba <- ggplot(data1, aes(x=ENTRY)) +
        geom_histogram(binwidth=2, col="darkgreen", fill="cornflowerblue") +
        labs(title = "Spike Recovery\n", x = "Percent Recovery", y = "Occurances")+
        scale_y_continuous(breaks=seq(0, 13, 1)) +
        theme_bw() + theme(panel.grid.major = element_line(size = 0.5, color = "grey"), 
        axis.line = element_line(size = 0.7, color = "black"), 
        text = element_text(size = 14))
plot_ba

ggsave("Spikes.png", width = 10, height = 6, dpi = 100)

describe(data1$ENTRY)

shapiro.test(data1$ENTRY)
