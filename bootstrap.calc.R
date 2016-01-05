library(dplyr)
library(ggplot2)

data1 <- read.csv("bootstrap_VITB011208.csv", header = TRUE, as.is = TRUE)

# Functions --------------------------------------------------------------
MU <- function (x) {
        2*sqrt(sum(x^2)/(2*N))
}

bs <- rep(0,10000)

#-------------------------------------------------------------------------

Prod <- unique(data1$Product)
Prod_len <- length(Prod)

# Create Data Frame with NA's
Bootstrap=data.frame(matrix(NA, nrow=Prod_len, ncol=5))

# Confirm Size of Data Frame
dim(Bootstrap)

# Change Variable Names
names(Bootstrap) <- c("Product","n", "Lower", "MU", "Upper")


j <- 1

for (j in 1:Prod_len) {

        Prod_n <- Prod[j]
        data2 <- data1 %>%
                filter(Product == Prod_n)
        N <- nrow(data2)


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
        Bootstrap$MU[j] <- mean_bs
        Bootstrap$Lower[j] <- Lower_bs
        Bootstrap$Upper[j] <- Upper_bs
}

Bootstrap
write.csv(Bootstrap, "MU_by_Bootstrap.csv", row.names = FALSE)
#-------------------------------------------------------------------------

bs2 <- as.data.frame(bs)
plotbs <- ggplot(bs2, aes(x=bs)) +
        geom_histogram(binwidth = 0.02, colour = "darkgreen", fill = "beige") +
        geom_vline(xintercept = Upper_bs, lty = 2, color = "red") +
        geom_vline(xintercept = Lower_bs, lty = 2, color = "red")
plotbs
