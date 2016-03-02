# Clear Environment ---------------------------------------------
rm(list=ls())
library (ProjectTemplate)
load.project()

lims <- read.csv("TITA14.csv", as.is=TRUE, header=TRUE)


summary_data(lims)

#---selection---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "MG_P_L")

lims <- lims %>%
        filter(REPORTED_NAME == "Titratable Acidity ºT")

lims <- lims %>%
        filter(grepl("pH", REPORTED_NAME))