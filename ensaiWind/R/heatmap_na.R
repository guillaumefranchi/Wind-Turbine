heatmap_na <- function(turbine){
  ggplot(data_heatmap %>%
           dplyr::filter(Turbine == turbine), aes(Feature, Year_Month, fill = Na_pct )) +
    geom_tile() +
    scale_fill_viridis(discrete=FALSE) +
    theme_minimal() +
    labs(title = "Percentage of missing values per month",
         x = "Feature",
         y = "Month")  +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
}
