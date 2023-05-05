library(quarto)
library(deeptime)

data("stages")
df <- stages

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
    parallax-background-size: "28px 6000px"
    self-contained: true
---
    ', file = "index.qmd", sep = "\n")

cat(paste0('# Origins {background-color="white"}\n\n'), file = "index.qmd", append = TRUE)
cat(paste0('Lewis A. Jones & Miranta Kouvari\n\n'), file = "index.qmd", append = TRUE)


for (i in 1:nrow(df)) {
  # Create slide
  cat(paste0('## {background-color="',df$color[i], '"}\n\n'), file = "index.qmd", append = TRUE)
  # Set up grid
  cat('::: {.grid}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Create 3 x 2 grid
  # Add name column
  cat('::: {.g-col-4}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add emphasis
  cat(paste0('::: {.emphasized}'), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add name
  cat(paste0(df$name[i]), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close emphasis
  cat(paste0(':::'), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add age
  cat(paste0(df$min_age[i], "--", df$max_age[i], " Ma\n\n"), file = "index.qmd", append = TRUE)
  # Close name column
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close grid
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
}

#quarto_render(input = "index.qmd")
#quarto_preview(file = "index.qmd")
