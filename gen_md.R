library(deeptime)

# Get data and merge
data("stages")
stages <- stages[8:nrow(stages), ]
data("periods")
periods <- periods[1, ]
stages <- rbind.data.frame(stages, periods)
colnames(stages)[which(colnames(stages) == "name")] <- "interval"
stages <- stages[order(stages$min_age), ]
stages$max_age <- stages$max_age * 500
stages$min_age <- stages$min_age * 500
stages$height <- (stages$max_age - stages$min_age)
stages$color_upper <- NA
stages$color_upper[1] <- "white"
stages$color_upper[2:nrow(stages)] <- stages$color[1:(nrow(stages)-1)]
stages$color_lower <- stages$color
stages$interval <- gsub(pattern = " ", replacement = "-", x = stages$interval)

gen_md <- function(x) {
  cat("\n",
      "\n",
      "::: {.", x$interval, " .h1}  \n",
      "\n",
      "# ", x$interval, "  \n",
      "\n",
      ":::  \n",
      file = "content.md", sep = "", append = TRUE)
}

unlink("./content.md")

for (i in 1:nrow(stages)) {
  gen_md(x = stages[i, ])
}
