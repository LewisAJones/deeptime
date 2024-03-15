library(deeptime)

# Get data and merge
data("stages")
stages <- stages[8:nrow(stages), ]
data("periods")
periods <- periods[1, ]
stages <- rbind.data.frame(stages, periods)
colnames(stages)[which(colnames(stages) == "name")] <- "interval"
stages <- stages[order(stages$min_age), ]
stages$max_age <- (stages$max_age * 500) + 800
stages$min_age <- (stages$min_age * 500) + 800
stages$height <- stages$max_age - stages$min_age

stages$color_upper <- NA
stages$color_upper[1] <- "white"
stages$color_upper[2:nrow(stages)] <- stages$color[1:(nrow(stages)-1)]
stages$color_lower <- stages$color
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
      "}",
      file = "container.css", sep = "", append = TRUE)
}

unlink("./container.css")

for (i in 1:nrow(stages)) {
  gen_container(x = stages[i, ])
}
