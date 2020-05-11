

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "PCT_M-V" | UNITS == "G_P_100ML")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "PROT010201")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Vitamin A")

# Filter on Two Reported Names -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Choline (Free)" | REPORTED_NAME == "Choline")


# Filter on Two Reported Names [m/m] ---------------------------------------------

analyte <- "Fat"
lims <- lims %>%
        filter(REPORTED_NAME == analyte | REPORTED_NAME == paste(analyte, "[m/m]", sep = " "))
lims$REPORTED_NAME <- analyte

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "Reducing Sugars"

# Select customer----------------------------------------------------------
lims <- select(lims, everything())%>%
        filter(CUSTOMER=="MG60")

lims$REPORTED_NAME[lims$REPORTED_NAME == "Sodium Chloride"] <- "Salt"

# Filter on Result Range -------------------------------------------------
lims <- lims %>%
        filter(between(ENTRY, 3,4))

# Filter on Three Reported Names -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Thiamin" | REPORTED_NAME == "Vitamin B1"| REPORTED_NAME == "Vitamin B1 (Thiamine)")



