

# Filter on Units ---------------------------------------------------------
lims <- lims %>%
        filter(UNITS == "NONE")

# Filter on Analysis ------------------------------------------------------
lims <- lims %>%
        filter(ANALYSIS == "PROT010201")

# Filter on Reported Name -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Tyramine")

# Filter on Two Reported Names -------------------------------------------------
lims <- lims %>%
        filter(REPORTED_NAME == "Riboflavin" | REPORTED_NAME == "Vitamin B2")

# Change Reported Name ----------------------------------------------------
lims$REPORTED_NAME <- "Iodine"

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



