library(ggplot2)
library(deeptime)
# Create title slide
title <- data.frame(max_ma = 0, mid_ma = -2.5, min_ma = -5.0, cols = "blue")

# Create gradient colours
# Get stages
data("stages")
# Set values for sequence
min <- 0
max <- 540
by <- 0.01
# Assign values
max_ma <- seq(from = min + by, to = max, by = by)
min_ma <- seq(from = min, to = max - by, by = by)
mid_ma <- (max_ma + min_ma) / 2
# Get color ramp
pal <- colorRampPalette(stages$color, space = "Lab")
# Get colors
cols <- pal(length(max_ma))
# Bind data
max_ma <- stages$max_age
mid_ma <- (stages$max_age + stages$min_age) / 2
min_ma <- stages$min_age
cols <- stages$color
df <- data.frame(max_ma, mid_ma, min_ma, cols)
df <- rbind(title, df)

gradient <- ggplot(df) +
  scale_y_reverse(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) +
  geom_rect(aes(xmin = 0, xmax = 100, ymin = min_ma, ymax = max_ma), colour = df$cols, fill = df$cols) +
  theme_void() +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank()
  )
ggsave("./gradient.png", dpi = 100, height = 50, width = 10, units = "px", limitsize = FALSE)
