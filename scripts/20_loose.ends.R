

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "MG_P_L")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "VITD050115")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Vitamin D3")

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "Vitamin D3"

# Select customer----------------------------------------------------------
lims <- select(lims, everything())%>%
        filter(CUSTOMER=="MG60")