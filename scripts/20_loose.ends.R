

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "MEQ_CAC3_L")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "PHOS020495")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Peroxide Value")

# Filter on Two Reported Names -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "BOD" | REPORTED_NAME == "BOD @ 19 - 21°C")

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "Vitamin C"

# Select customer----------------------------------------------------------
lims <- select(lims, everything())%>%
        filter(CUSTOMER=="MG60")

# Change Chloride to Salt ----------------------------------------------------

lims$ENTRY[lims$REPORTED_NAME == "Chloride"] <- lims$ENTRY*58.5/35.5
lims$REPORTED_NAME[lims$REPORTED_NAME == "Chloride"] <- "Salt"
lims$REPORTED_NAME[lims$REPORTED_NAME == "Sodium Chloride"] <- "Salt"




