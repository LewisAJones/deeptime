library(ggplot2)
library(deeptime)

gradient <- ggplot() +
  scale_y_reverse() +
  coord_geo(pos = "left",
            dat = "stages",
            ylim = c(540, 0), xlim = c(0, 1),
            height = unit(100, "line"),
            lab = FALSE,
            color = "transparent") +
  theme_classic()
ggsave("./gradient.png", dpi = 300, height = 300, width = 100, units = "px", limitsize = FALSE)

data("stages")
stages$mid_ma <- (stages$max_age + stages$min_age) / 2
df <- data.frame(xmin = 0, xmax = 1000, ymin = stages$min_age, ymax = stages$max_age, fill = stages$mid_ma)

data("stages")
min <- 0
max <- 540
by <- 0.01
max_ma <- seq(from = min + by, to = max + by, by = by)
min_ma <- seq(from = min, to = max, by = by)
mid_ma <- (max_ma + min_ma) / 2
pal <- colorRampPalette(stages$color, space = "Lab")
cols <- pal(length(max_ma))
df <- data.frame(max_ma, mid_ma, min_ma, cols)
gradient <- ggplot(df) +
  scale_y_reverse() +
  geom_rect(aes(xmin = 0, xmax = 100, ymin = min_ma, ymax = max_ma), colour = df$cols, fill = df$cols) +
  theme_void()
ggsave("./gradient.png", dpi = 300, height = 5000, width = 2000, units = "px", limitsize = FALSE)
