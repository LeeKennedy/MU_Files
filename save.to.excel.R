
library(xlsx) #load the package

df <- read.csv(paste(file.name, ".csv", sep=""), header = TRUE, as.is = TRUE)

df2 <- loadWorkbook("CODExx-analyte-Filterable.xlsx") 

df_s <- getSheets(df2)

addDataFrame(df, sheet = df_s$Data, row.names = FALSE, col.names = FALSE, startRow=11, startColumn = 1) 

# write data to sheet starting on line 1, column 4
saveWorkbook(df2, paste(Method.code, "-Filterable.xlsx")) # and of course you need to save it.

#----------------------

