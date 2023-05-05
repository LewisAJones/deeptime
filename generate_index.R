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
  cat('::: {.columns}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Add name column
  cat('::: {.column width="30%"}', file = "index.qmd", append = TRUE)
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

  # Add empty space column
  cat('::: {.column width="5%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close empty space column
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Create image col 1
  cat('::: {.column width="30%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add content
  cat(paste0('![A test image.](./assets/images/test.png)'), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close image col 1
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Add empty space column
  cat('::: {.column width="5%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close empty space column
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Create image col 2
  cat('::: {.column width="30%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add content
  cat(paste0('![A test image.](./assets/images/test.png)'), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close image col 2
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Create image col 3
  cat('::: {.column width="30%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add content
  cat(paste0('![A test image.](./assets/images/test.png)'), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close image col 3
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Add empty space column
  cat('::: {.column width="5%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close empty space column
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Create image col 4
  cat('::: {.column width="30%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add content
  cat(paste0('![A test image.](./assets/images/test.png)'), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close image col 4
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Add empty space column
  cat('::: {.column width="5%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close empty space column
  cat(':::', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)

  # Create image col 5
  cat('::: {.column width="30%"}', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Add content
  cat(paste0('![A test image.](./assets/images/test.png)'), file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
  # Close image col 5
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
