

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "MEQ_CAC3_L")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "PHOS020495")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Silica (Total)")

# Filter on Two Reported Names -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "BOD" | REPORTED_NAME == "BOD @ 19 - 21°C")

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "Total Suspended Solids"

# Select customer----------------------------------------------------------
lims <- select(lims, everything())%>%
        filter(CUSTOMER=="MG60")