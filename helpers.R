#helpers

plotTheme <- function(text_color = 1, strip_color = 1, title_color = 1, map = FALSE) {
  #create a palette later
  if (map) {
    base <- theme_void() 
  } else {
    base <- theme_minimal()
  }
  base +
    theme(
      plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm"),
      text = element_text(
        color = "black",
        size = 10),
      plot.title = element_text(
        hjust = 0, 
        face = "bold", 
        margin = margin(b = 3),
        size = 11,
        color = "black"),
      plot.subtitle = element_text(
        hjust = 0, 
        face = "italic",
        margin = margin(b = 10),
        color = "black"),
      legend.direction = "vertical", 
      legend.position = "right", 
      legend.key.height = unit(1, "cm"), 
      legend.key.width = unit(0.2, "cm"),
      legend.title = element_text(
        size = 8,
        face = "italic",
        vjust = 0),
      plot.caption = element_text(
        size = 8,
        hjust = 0,
        face = "italic"),
      #strip.background = element_rect(
      # color = "black"),
      axis.title = element_text(
        hjust = 1,
        face = "italic"
      )
    )
}
