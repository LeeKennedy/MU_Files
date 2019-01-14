

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "G_P_100ML")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "PROT010201")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Vitamin A")

# Filter on Two Reported Names -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Pantothenic Acid" | REPORTED_NAME == "Pantothenic Acid [m/m]")

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "Vitamin C"

# Select customer----------------------------------------------------------
lims <- select(lims, everything())%>%
        filter(CUSTOMER=="MG60")

lims$REPORTED_NAME[lims$REPORTED_NAME == "Sodium Chloride"] <- "Salt"

# Filter on Result Range -------------------------------------------------
lims <- lims %>%
        filter(between(ENTRY, 3,4))




