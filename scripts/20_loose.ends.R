

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "MG_P_L")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "VITD050115")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Vitamin A")

# Filter on Two Reported Names -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "dl-alpha-Tocopherol" | REPORTED_NAME == "Vit E (as dl-alpha-Tocopherol)")

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "Vitamin E"

# Select customer----------------------------------------------------------
lims <- select(lims, everything())%>%
        filter(CUSTOMER=="MG60")