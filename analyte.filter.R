data <- read.csv("VITB01.csv", as.is=TRUE, header=TRUE)
library(dplyr)

data.F <- data %>%
        filter(grepl("Emp",REPORTED_NAME)==FALSE)%>%
        filter(grepl("m/v", REPORTED_NAME)==FALSE)%>%
        #filter(REPORTED_NAME=="Sorbic Acid")
        filter(grepl("B6", REPORTED_NAME)==TRUE)
write.csv(data.F, "VitB6/totalB6.csv", row.names=FALSE)
