library(quarto)
library(deeptime)
data("stages")
min <- 0
max <- 540
by <- 10
max_ma <- seq(from = min + by, to = max + by, by = by)
min_ma <- seq(from = min, to = max, by = by)
mid_ma <- (max_ma + min_ma) / 2
pal <- colorRampPalette(stages$color, space = "Lab")
cols <- pal(length(max_ma))
df <- data.frame(max_ma, mid_ma, min_ma, cols)

df <- stages
df$cols <- df$color
df$max_ma <- df$max_age

file.create("index.qmd")
cat('---
format:
  revealjs:
    menu: true
    progress: true
    width: 1300
    controls: true
    transition: slide
    theme: [default, style.scss]
    parallax-background-image: gradient.png
    parallax-background-size: "28px 6000px"
    self-contained: true
---
    ', file = "index.qmd", sep = "\n")

cat(paste0('# Deep Time {background-color="white"}\n\n'), file = "index.qmd", append = TRUE)
cat(paste0('Lewis A. Jones & Miranta Kouvari\n\n'), file = "index.qmd", append = TRUE)


for (i in 1:nrow(df)) {
   cat(paste0('## ', df$name[i], ' {background-color="',
             df$cols[i], '"}','\n'),
      file = "index.qmd", append = TRUE)
   cat(paste0('\n'), file = "index.qmd", append = TRUE)
   cat(paste0(df$min_age[i], "--", df$max_age[i], " Ma\n\n"), file = "index.qmd", append = TRUE)
}

quarto_render(input = "index.qmd")
quarto_preview(file = "index.qmd")
