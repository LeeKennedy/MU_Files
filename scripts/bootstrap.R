
library(dplyr)

# Enter data as csv file: Item/Result 1/Result 2 -------------------------
data.in <- read.csv("ASHS040493.csv", as.is=TRUE, header=TRUE)


# Bootstrapping ----------------------------------------------------------
bootstrap <- function(x, A="A", B="B") {
        
bucket <- rep(NA,1000)
n=nrow(x)
        
for(i in 1:200){

samp <- sample(n, n, replace=TRUE)
set <- data.in[samp,]

temp <- set %>%
        mutate(Diff2 = (A-B)^2) %>%
        summarise (std = sqrt(sum(Diff2)/(2*n)))

bucket[i] = temp
}

bucket_2 <- as.data.frame(unlist(bucket))
colnames(bucket_2)[1] <- "Number"

hranges <- quantile(bucket_2$Number, c(0.05, 0.95), na.rm=TRUE)

return(hranges)
}

part_data <- data.in %>%
        filter(Product == "FISH")
bootstrap(part_data)


hranges <- bootstrap(data.in)

low_sd <- hranges[1]
low_sd
high_sd <- hranges[2]
high_sd
