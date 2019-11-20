library(dplyr)
library(ggplot2)

data1 <- read.csv(paste("bootstrap_",file.name, ".csv", sep=""), header = TRUE, as.is = TRUE)

# Functions --------------------------------------------------------------
MU <- function (x) {
        2*sqrt(sum(x^2)/(2*N))
}

bs <- rep(0,10000)
units_A <- data1$Unit[1]

#-------------------------------------------------------------------------

Prod <- unique(data1$Product)
Prod_len <- length(Prod)

# Create Data Frame with NA's
Bootstrap=data.frame(matrix(NA, nrow=Prod_len, ncol=7))

# Change Variable Names
names(Bootstrap) <- c("Product", "n", "Units", "level", "Lower", "MU", "Upper")
Bootstrap$level <- as.numeric(Bootstrap$level)


j <- 1

for (j in 1:Prod_len) {

        Prod_n <- Prod[j]
        data2 <- data1 %>%
                filter(Product == Prod_n)
        N <- nrow(data2)
        
        level_A <- mean(data2$A)


        for(i in 1:10000) {
                y <- sample(data2$diff, N, replace=T)
                bs[i] = MU(y)
        }

        mean_bs <- mean(bs)
        sd_bs <- sd(bs)
        Upper_bs <- mean_bs + 2*sd_bs
        Lower_bs <- mean_bs - 2*sd_bs

        Bootstrap$Product[j] <- Prod[j]
        Bootstrap$n[j] <- N
        Bootstrap$Units[j] <- units_A
        Bootstrap$level[j] <- level_A
        Bootstrap$MU[j] <- mean_bs
        Bootstrap$Lower[j] <- Lower_bs
        Bootstrap$Upper[j] <- Upper_bs
}

Bootstrap
write.csv(Bootstrap, paste(file.name,"_Bootstrap_MU.csv", sep=""), row.names = FALSE)

