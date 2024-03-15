library(deeptime)

# Get data and merge
data("stages")
data("periods")
stages <- stages[8:nrow(stages), ]
stages <- rbind.data.frame(periods[1, ], stages)
colnames(stages)[which(colnames(stages) == "name")] <- "interval"
stages <- stages[order(stages$min_age), ]
stages$max_age <- (stages$max_age * 500) + 800
stages$min_age <- floor((stages$min_age * 500) + 800)
stages$height <- ceiling(stages$max_age - stages$min_age) + 2

stages$color_upper <- NA
stages$color_upper <- stages$color
stages$color_lower <- c(stages$color[2:nrow(stages)], stages$color[nrow(stages)])
stages$interval <- gsub(pattern = " ", replacement = "-", x = stages$interval)

gen_container <- function(x) {
  cat("\n",
      "\n",
      ".", x$interval, " { \n",
      "  position: absolute; \n",
      "  width: 100%; \n",
      "  top: ", x$min_age, "px; \n",
      "  height: ", x$height, "px; \n",
      "  color: ", "black", ";  \n",
      "  background: linear-gradient(to bottom, ",
      x$color_upper, ", ", x$color_lower, ");  \n",
      "  opacity: ", "1", ";  \n",
      "}",
      file = "container.css", sep = "", append = TRUE)
}

unlink("./container.css")

for (i in 1:nrow(stages)) {
  gen_container(x = stages[i, ])
}
