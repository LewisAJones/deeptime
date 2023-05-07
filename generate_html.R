library(quarto)
library(palaeoverse)
library(googlesheets4)

# Get data and merge
stages <- time_bins()
colnames(stages)[which(colnames(stages) == "interval_name")] <- "interval"
df <- read_sheet("https://docs.google.com/spreadsheets/d/1lPn72Zc40iH6mqjmkhGZdqt1RBm5ESmwO0xndNUsI_I/edit?usp=sharing")
df <- merge(x = stages, y = df, by = "interval", all.x = TRUE)
df <- df[order(df$min_ma), ]

# Function for generating divs
create_div <- function(cols, height){
  open <- paste0('<div style="background-image:linear-gradient(')
  cols <- toString(cols)
  height <- paste0('); height:', height, 'vh">')
  cat(paste0(open, cols, height), file = "index.qmd", append = TRUE)
}

# Create file
file.create("index.qmd")
cat('---
format:
  html:
    page-layout: custom
    css: style.scss
---', file = "index.qmd", sep = "\n")

cat('<div style="background-image:linear-gradient(white, white); height:100vh">
  <h1>
  Origins
  </h1>
  <h3>
  Lewis A. Jones & Miranta Kouvari
  </h3>
</div>
    ', file = "index.qmd", append = TRUE, sep = "\n")

# Set height of div
height <- 100
for (i in 1:nrow(df)) {
  # create cols
  if (i == nrow(df)) {
    # Create last divs
    cols <- c(df$colour[i], df$colour[i], df$colour[i])
    # Create div
    create_div(cols = cols, height = height)
    # Add space
    cat(paste0('\n'), file = "index.qmd", append = TRUE)
    # Add content
    cat(paste0('\n'), file = "index.qmd", append = TRUE)
    cat('<div class="sticky">', file = "index.qmd", append = TRUE)
    cat(paste0('\n'), file = "index.qmd", append = TRUE)
    cat(paste0('<h4 style="color:', df$font[i], '">', df$interval[i], '</h4>'), file = "index.qmd", append = TRUE)
    cat(paste0('\n'), file = "index.qmd", append = TRUE)
    cat(paste0('<h5 style="color:', df$font[i], '">', df$min_ma[i], '--', df$max_ma[i], ' Ma', '</h5>'), file = "index.qmd", append = TRUE)
    cat(paste0('\n'), file = "index.qmd", append = TRUE)
    # Close div
    cat('</div>', file = "index.qmd", append = TRUE)
    cat(paste0('\n'), file = "index.qmd", append = TRUE)
    # Close div
    cat('</div>', file = "index.qmd", append = TRUE)
    # Add space
    cat(paste0('\n'), file = "index.qmd", append = TRUE)
    # Create div
    create_div(cols = c("white", "white"), height = height)
    # Add space
    cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
    # Close div
    cat('</div>', file = "index.qmd", append = TRUE)
    break
  }
  # Set cols
  cols <- c(df$colour[i], df$colour[i], df$colour[i+1])
  # Create div
  create_div(cols = cols, height = height)

  # Insert content
  cat(paste0('\n'), file = "index.qmd", append = TRUE)
  cat('<div class="sticky">', file = "index.qmd", append = TRUE)
  cat(paste0('\n'), file = "index.qmd", append = TRUE)
  cat(paste0('<h4 style="color:', df$font[i], '">', df$interval[i], '</h4>'), file = "index.qmd", append = TRUE)
  cat(paste0('\n'), file = "index.qmd", append = TRUE)
  cat(paste0('<h5 style="color:', df$font[i], '">', df$min_ma[i], '--', df$max_ma[i], ' Ma', '</h5>'), file = "index.qmd", append = TRUE)
  cat(paste0('\n'), file = "index.qmd", append = TRUE)
  # Close div
  cat('</div>', file = "index.qmd", append = TRUE)
  cat(paste0('\n'), file = "index.qmd", append = TRUE)
  # Close div
  cat('</div>', file = "index.qmd", append = TRUE)
  # Add space
  cat(paste0('\n\n'), file = "index.qmd", append = TRUE)
}

#quarto_render(input = "index.qmd")
#quarto_preview(file = "index.qmd")
