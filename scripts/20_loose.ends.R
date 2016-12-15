

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "MG_P_L")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "SUGA040493")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Caffeine")

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "dl-alpha-Tocopherol"

# Select customer----------------------------------------------------------
lims <- select(lims, everything())%>%
        filter(CUSTOMER=="MG60")