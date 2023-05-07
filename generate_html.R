library(quarto)
library(googlesheets4)

# Get data and merge
stages <- read.csv("https://macrostrat.org/api/v2/defs/intervals?timescale=international%20ages&format=csv")
periods <- read.csv("https://macrostrat.org/api/v2/defs/intervals?timescale=international%20periods&format=csv")
eras <- read.csv("https://macrostrat.org/api/v2/defs/intervals?timescale=international%20eras&format=csv")
eons <- read.csv("https://macrostrat.org/api/v2/defs/intervals?timescale=international%20eons&format=csv")

periods <- subset(periods, t_age >= max(stages$b_age))
stages <- rbind.data.frame(stages, periods)

eras <- subset(eras, t_age >= max(stages$b_age))
stages <- rbind.data.frame(stages, eras)

eons <- subset(eons, t_age >= max(stages$b_age))
stages <- rbind.data.frame(stages, eons)
# Add Hadean
hadean <- data.frame(int_id = NA, name = "Hadean", abbrev = NA,
           t_age = 4000, b_age = 4567, int_type = "eon",
           timescales = "custom", color = "#a2247c")
stages <- rbind.data.frame(stages, hadean)

# Add font colour if it doesn't exist
rgbs <- col2rgb(stages$color)
luminance <- apply(rgbs, 2, function(x) {
  (0.299 * x[1] + 0.587 * x[2] + 0.114 * x[3]) / 255
})
stages$font <- ifelse(luminance > .5, "black", "white")
# Update name
colnames(stages)[which(colnames(stages) == "name")] <- "interval"
colnames(stages)[which(colnames(stages) == "t_age")] <- "min_ma"
colnames(stages)[which(colnames(stages) == "b_age")] <- "max_ma"
colnames(stages)[which(colnames(stages) == "color")] <- "colour"

# Add data
df <- read_sheet("https://docs.google.com/spreadsheets/d/1lPn72Zc40iH6mqjmkhGZdqt1RBm5ESmwO0xndNUsI_I/edit?usp=sharing")
df <- merge(x = stages, y = df, by = "interval", all.x = TRUE)
df <- df[order(df$min_ma), ]


# Function for generating divs
create_div <- function(cols, height){
  open <- paste0('<div style="background-image:linear-gradient(')
  cols <- toString(cols)
  height <- paste0('); height:', height, 'vh; width:', height, '%">')
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

cat('<div style="background-image:linear-gradient(lightblue, #FEF2E0); height:100vh">
  <h1>
  Origins
  </h1>
  <h2>
  Earth History Events
  </h2>
  <h3>
  Made by <a href="https://twitter.com/LewisAlanJones">Lewis A. Jones</a> & <a href="https://twitter.com/MirantaKouvari">Miranta Kouvari</a>
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
