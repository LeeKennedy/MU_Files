
### Import data -----------------------

plot_data <- read.csv(paste(file.name, ".csv", sep=""), header = TRUE, as.is = TRUE)

plot_data$Diff <- plot_data$B-plot_data$A
plot_data$Type2 <- paste(plot_data$Type, plot_data$Product, sep="_")

plot_data <- plot_data[,c(4,10,13,14)]

product_list <- unique(plot_data$Product)

### Insert product number from list ----------------

product <- product_list[c(1,5)]

### ------------------------------------------------

plot_data_R <- plot_data %>% 
        filter(Product %in% product) %>% 
        filter(Type == "Interim Precision") %>% 
        group_by(Product) %>%
        mutate(Diff = outliers(Diff)) %>% 
        na.omit() %>% 
        mutate(Diff = 100*Diff/max(abs(Diff))) %>% 
        arrange(Diff) %>% 
        mutate(row_n = row_number())



plot_data_r <- plot_data %>% 
        filter(Product %in% product) %>% 
        filter(Type == "Repeatability") %>% 
        group_by(Product) %>%
        mutate(Diff = outliers(Diff)) %>% 
        na.omit() %>% 
        mutate(Diff = 100*Diff/max(abs(Diff))) %>% 
        arrange(Diff)%>% 
        mutate(row_n = row_number())

full_data <- rbind(plot_data_r, plot_data_R)



diff_plot <- ggplot(full_data, aes(x=row_n,y = Diff)) +
        geom_bar(fill = "cornflowerblue",  stat="identity") +
        facet_wrap(~Type2, ncol = 2)+
        theme_bw()+
        theme(panel.grid.major = element_line(size = 0.5, color = "grey"), 
              axis.line = element_line(size = 0.7, color = "black"), 
              text = element_text(size = 14), axis.text.x = element_text(angle = 0, hjust = 1))

        
diff_plot
prod_list
