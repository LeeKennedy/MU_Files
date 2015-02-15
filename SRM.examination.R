# Libraries ----------------------------------------------------------------------------------
library(psych)

# Read data ----------------------------------------------------------------------------------
data.in4 <- read.csv("srmdata.csv", as.is=TRUE, header=TRUE)
analyte <- data.in4$ANALYSIS[1]
units <- tolower(data.in4$UNIT[1])

if(nrow(data.in4) >0) { 
        
        data.in4 <- data.in4[order(data.in4$SAMPLE_NUMBER),]
        
        data.in.srm <- strsplit(data.in4$TEXT_ID, split="-")
        
        dis <- sapply(data.in.srm,function(x) x[2])
        dis <- as.data.frame(dis)
        data.in4 <- cbind(data.in4, dis)
        
        data.in2 <- split(data.in4[,9],data.in4[,19])
        
        # Boxplot of SRMs in play --------------------------------------------------------
        boxplot(data.in2,
                col = "burlywood1",
                outpch = 16,
                outcol = "red",
                main = paste("SRMs relating to ", Method.code),
                ylab = units)
        
        # Individual SRM charting --------------------------------------------------------
        aa <- length(data.in2)
        
        for (i in 1:aa) {        
                srm.in <- i
                Method.code <- substr(data.in4$ANALYSIS[1],1,6)
                Method.units <- data.in4$UNITS[1]
                
                # FUNCTION - Outliers ---------------------------------------------------
                remove.outliers <- function(x, na.rm = TRUE, ...) {
                        qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
                        H <- 1.5 * IQR(x, na.rm = na.rm)
                        y <- x
                        y[x < (qnt[1] - H)] <- NA
                        y[x > (qnt[2] + H)] <- NA
                        y
                }
                
                # Selct individual SRM data ---------------------------------------------
                data.in3 <- data.in2[srm.in]
                srm.name <- names(data.in3)[1]
                
                names(data.in3) <- c("A")
                
                trimmed <- remove.outliers(data.in3$A)
                clean <- na.omit(trimmed)
                
                # Create control lines --------------------------------------------------
                xx <- describe(clean)
                
                UCL <- xx$mean + 3*xx$sd
                UWL <- xx$mean + 2*xx$sd
                Centre <- xx$mean 
                LWL <- xx$mean - 2*xx$sd
                LCL <- xx$mean - 3*xx$sd
                MU <- 2*xx$sd
                
                CC <- c(UCL, UWL, Centre, LWL, LCL ,MU)
                Labels <- c("UCL", "UWL", "Centre", "LWL", "LCL", "MU +/-")
                Clines <- cbind(Labels, round(CC,3))
                Clines <- as.data.frame(Clines)
                
                # Plot Control Chart ----------------------------------------------------
                if(length(clean)<2){ 
                        plot(clean, type="o",
                             ylab = units,
                             main = paste("SRM for ", Method.code, "(", srm.name, ")", sep=""))
                } else { 
                        plot(clean, type="o", 
                             ylim = c(LCL*0.95,UCL*1.05), 
                             xlim = c(0, length(clean)),
                             ylab = units,
                             main = paste("SRM for ", Method.code, "(", srm.name, ")", sep=""))
                }
                abline(h=Centre, col = "blue", lty=2, lwd=2)
                abline(h=UCL, col = "red", lty=2, lwd=2)
                abline(h=UWL, col = "darkgreen", lty=3, lwd=2)
                abline(h=LWL, col = "darkgreen", lty=3, lwd=2)
                abline(h=LCL, col = "red", lty=2, lwd=2)
                
                # Plot histogram of the SRM data -----------------------------------------
                hist(clean, 
                     breaks=20,
                     main = paste("Histogram of ",srm.name, " (", Method.code, ")", sep=""),
                     col = "burlywood1")
                
                
                describe(clean)
                
                # Print Control line data -----------------------------------------------
                print(srm.name)
                print(Clines)
                
        }
}