# Rename incoming data file:
data.in <- read.csv("srmdata.csv", as.is=TRUE, header=TRUE)
colnames(data.in)[1] <- "SAMPLE_NUMBER"
library(dplyr)
library(psych)
library(dts.quality)

# Clean the data
data.in <- select(data.in, everything())%>%
        arrange(SAMPLE_NUMBER)

name_srm <- strsplit(data.in[1,13],"-")
srm <- name_srm[[1]][2]

boxplot(data.in$ENTRY)

data.in <- data.in[,c(1,9)]

clean <- outliers(data.in$ENTRY)


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

plot(data.in$ENTRY, type="p", pch= 19, cex=0.6, col ="red",ylim = c(LCL*0.75,UCL*1.1), ylab = "", xlab=srm)
par(new=T)
plot(clean, type="o", pch=19, cex=0.75, col="grey40",ylim = c(LCL*0.75,UCL*1.1), ylab = "", xlab=srm)

abline(h=Centre, col = "blue", lty=2, lwd=2)
abline(h=UCL, col = "red", lty=2, lwd=2)
abline(h=UWL, col = "darkgreen", lty=3, lwd=2)
abline(h=LWL, col = "darkgreen", lty=3, lwd=2)
abline(h=LCL, col = "red", lty=2, lwd=2)

hist(clean, breaks=20, xlab="")

print(srm)
print(describe(clean))
print (Clines)


