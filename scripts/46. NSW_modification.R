lims$PRODUCT_GRADE[lims$DESCRIPTION == "Duplicate"] <- "DUPLICATE"

nsw <- nrow(lims)

for(i in 1:nsw){

if(grepl("QC", lims$TEXT_ID[i]) ==  FALSE) {
        lims$ORIGINAL_SAMPLE[i] = lims$SAMPLE_NUMBER[i]
}


}

write.csv(lims, "abc.csv")
