#!/usr/bin/env Rscript
# Enhanced grade plotting with sample data loading

library(ggplot2)
library(dplyr)

# Check if sample data file exists
if (!file.exists("sample_grades.csv")) {
  cat("✗ sample_grades.csv not found!\n")
  cat("Run: Rscript generate_sample_data.R\n")
  quit()
}

# Load sample data
cat("Loading sample grades data...\n")
students <- read.csv("sample_grades.csv")

# Display loaded data
cat("\nLoaded", nrow(students), "students:\n")
print(head(students, 10))

# Calculate grades
students$Grade <- ifelse(students$Marks >= 80, "A", 
  ifelse(students$Marks >= 60, "B", 
  ifelse(students$Marks >= 50, "C", "D")))

students$Result <- ifelse(students$Marks >= 50, "Pass", "Fail")

# Display statistics
cat("\n=== GRADE DISTRIBUTION ===\n")
cat("Total Students:", nrow(students), "\n")
cat("Average Marks:", round(mean(students$Marks), 2), "\n")
cat("Highest Marks:", max(students$Marks), "\n")
cat("Lowest Marks:", min(students$Marks), "\n")
cat("Pass Rate:", round(sum(students$Result == "Pass") / nrow(students) * 100, 1), "%\n")

# Grade breakdown
grade_counts <- students %>% count(Grade)
cat("\n=== GRADE BREAKDOWN ===\n")
print(grade_counts)

# Create visualization
cat("\nGenerating plot...\n")

grade_counts <- students %>%
  count(Grade)

plot <- ggplot(grade_counts, aes(x = Grade, y = n, fill = Grade)) +
  geom_col(colour = "blue") +
  ggtitle("Students Exam Results") +
  xlab("Grade") +
  ylab("Number of Students") +
  theme(
    axis.title.x = element_text(size = 15, colour = "darkblue"),
    axis.title.y = element_text(size = 15, colour = "blue"),
    plot.title = element_text(size = 20, colour = "black", hjust = 0.5),
    legend.title = element_text(size = 15, colour = "orange"),
    panel.background = element_rect(fill = "white", colour = "gray")
  )

# Save plot
output_file <- "grade_distribution.png"
ggsave(output_file, plot, width = 8, height = 6, dpi = 300)
cat("✓ Plot saved to:", output_file, "\n")

# Display the plot
print(plot)

# Show summary statistics
cat("\n=== STATISTICAL SUMMARY ===\n")
summary_stats <- data.frame(
  Metric = c("Mean", "Median", "Std Dev", "Min", "Max", "Q1", "Q3"),
  Value = c(
    round(mean(students$Marks), 2),
    round(median(students$Marks), 2),
    round(sd(students$Marks), 2),
    min(students$Marks),
    max(students$Marks),
    round(quantile(students$Marks, 0.25), 2),
    round(quantile(students$Marks, 0.75), 2)
  )
)
print(summary_stats)

cat("\n✓ Analysis complete!\n")
