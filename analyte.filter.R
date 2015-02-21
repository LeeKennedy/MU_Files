data <- read.csv("SUGA01.csv", as.is=TRUE, header=TRUE)
library(dplyr)

data.F <- data %>%
        filter(grepl("Emp",REPORTED_NAME)==FALSE)%>%
        filter(grepl("m/v", REPORTED_NAME)==FALSE)%>%
        filter(REPORTED_NAME=="Total Sugars")
write.csv(data.F, "total.csv", row.names=FALSE)
