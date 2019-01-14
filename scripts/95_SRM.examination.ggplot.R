# Libraries ----------------------------------------------------------------------------------
library(psych)
library(tidyverse)
library(lubridate)

#### Functions -------------------------------------------------------------------------------

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

# Read data ----------------------------------------------------------------------------------


data.in4 <- read.csv("srmdata.csv", as.is=TRUE, header=TRUE)
Method.code <- str_sub(data.in4$ANALYSIS[1], 1,6)
units <- tolower(data.in4$UNIT[1])
analyte <- data.in4$REPORTED_NAME[1]


        
        data.in4 <- data.in4[order(data.in4$SAMPLE_NUMBER),]
        
        data.in.srm <- strsplit(data.in4$TEXT_ID, split="-")
        
        IRM <- sapply(data.in.srm,function(x) x[2])
        IRM <- as.data.frame(IRM)
        data.in4 <- cbind(data.in4, IRM)
        data.in4 <- data.in4[,c(1,2,19,9)]
        data.in4$LOGIN_DATE <- dmy_hms(data.in4$LOGIN_DATE)


####  SRM Boxplot ------------------------------------------------------------------------
        
        srm_boxplot <- ggplot(data.in4, aes(x=IRM, y = ENTRY))+
                geom_boxplot(fill =  "cornflowerblue", outlier.shape = 21, outlier.colour = "black", outlier.fill = "red", outlier.size = 3) +
                labs(title = paste(Method.code, analyte, sep="_"), y = units, x="") +
                theme_bw() +
                theme(panel.grid.major = element_line(size = 0.5, color = "grey"), 
                axis.line = element_line(size = 0.7, color = "black"), 
                text = element_text(size = 14))
        
        ggsave(paste(Method.code,"_", analyte,"_boxplot.png", sep=""), width = 6, height = 6, dpi=100)
        
        

# Individual SRM charting --------------------------------------------------------
        
        aa <- length(unique(data.in4$IRM))
        srms <- as.character(unique(data.in4$IRM))
        data.in4$IRM <- as.character(data.in4$IRM)
        
        for (i in 1:aa) {        
                srm.in <- i
       
                
 # Select individual SRM data ---------------------------------------------
        
        data_all <- data.in4 %>% 
                filter(IRM == srms[i])
                
        data.in3 <- data.in4 %>% 
                filter(IRM == srms[i]) %>% 
                mutate(ENTRY = outliers(ENTRY)) %>% 
                na.omit()
        
        summary_data <- data.in3 %>% 
                summarise(Mean = mean(ENTRY), 
                          UCL = Mean + 3*sd(ENTRY),
                          LCL = Mean - 3*sd(ENTRY),
                          UWL = Mean + 2*sd(ENTRY),
                          LWL = Mean - 2*sd(ENTRY)
                          )
        summary_data
        
        srm_plot <- ggplot() +
                geom_point(data = data_all, aes(x = LOGIN_DATE, y = ENTRY), size = 4, shape = 21, fill = "red", col= "black") +
                geom_point(data = data.in3, aes(x = LOGIN_DATE, y = ENTRY), size = 4, shape = 21, fill = "cornflowerblue", col= "black") +
                geom_line(data = data.in3, aes(x = LOGIN_DATE, y = ENTRY), lty=1)+
                geom_hline(yintercept = summary_data$Mean, col = "blue", lty = 2) +
                geom_hline(yintercept = summary_data$LCL, col = "red", lty = 2) +
                geom_hline(yintercept = summary_data$UCL, col = "red", lty = 2) +
                geom_hline(yintercept = summary_data$LWL, col = "darkgreen", lty = 2) +
                geom_hline(yintercept = summary_data$UWL, col = "darkgreen", lty = 2) +
                labs(title = paste(Method.code, analyte, sep="_"), y = units, x="") +
                scale_y_continuous(limits = c(0.5*summary_data$LCL, 1.25*summary_data$UCL))+
                theme_bw() +
                theme(panel.grid.major = element_line(size = 0.5, color = "grey"), 
                axis.line = element_line(size = 0.7, color = "black"), 
                text = element_text(size = 14))
                
        ggsave(paste(Method.code,"_", analyte,"_",srms[i],".png", sep=""), width = 12, height = 6, dpi=100)

        
        }
