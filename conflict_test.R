# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the mtcars dataset
data("mtcars")

# Data manipulation: Add a factor column for cylinders
mtcars <- mtcars %>%
  mutate(cyl_factor = factor(cyl, levels = c(1, 2, 3), labels = c("1 Cyl", "2 Cyl", "3 Cyl")))

# Summarize the dataset: Calculate mean MPG by cylinder category
summary_table <- mtcars %>%
  group_by(cyl_factor) %>%
  summarise(mean_mpg = mean(mpg, na.rm = TRUE))

print(summary_table)

# Plot
ggplot(mtcars, aes(y = hp, x = mpg, color = cyl_factor)) +
  geom_point(size = 5, alpha = 0.7) +
  labs(title = "MPG vs. Horsepower",
       x = "Horsepower (HP)",
       y = "Miles Per Gallon (MPG)",
       color = "Cylinders") +
  theme_minimal()



