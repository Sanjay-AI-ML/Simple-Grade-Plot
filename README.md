# 📊 Simple Grade Plotter (R)

![R](https://img.shields.io/badge/r-4.0-blue?logo=r&logoColor=white) ![ggplot2](https://img.shields.io/badge/visualization-ggplot2-blue) ![Statistics](https://img.shields.io/badge/stats-analysis-blue) ![CSV](https://img.shields.io/badge/data-csv-blue)

A practical R script that calculates student grades based on marks and visualizes the distribution using ggplot2. Perfect for learning R data manipulation, conditional logic, and data visualization.

---

## 🎯 What It Does

1. **Load Student Data** — Creates a dataframe with student names and marks
2. **Calculate Grades** — Applies conditional logic to assign letter grades (A/B/C/D)
3. **Determine Pass/Fail** — Marks students as Pass/Fail based on minimum score
4. **Visualize Results** — Generates a professional bar chart showing grade distribution

### Grade Scale
| Marks | Grade | Result |
|-------|-------|--------|
| ≥ 80 | A | Pass |
| 60–79 | B | Pass |
| 50–59 | C | Pass |
| < 50 | D | Fail |

---

## 🚀 Quick Start

### Requirements
- R 3.6+ (or RStudio)
- Two R packages (auto-installed on first run):
  - `ggplot2` — Data visualization
  - `dplyr` — Data manipulation

### Installation

```bash
# Clone the repo
git clone https://github.com/Sanjay-AI-ML/Simple-Grade-Plot.git
cd Simple-Grade-Plot
```

### Run the Script

**Option 1: RStudio (Easiest)**
1. Open `Simple_Grade_Calculation.R` in RStudio
2. Click **Run** or press Ctrl+Shift+Enter to source the script
3. View output in the console and Plots panel

**Option 2: R Terminal**
```r
# In R console:
source("Simple_Grade_Calculation.R")
```

**Option 3: Command Line**
```bash
Rscript Simple_Grade_Calculation.R
```

---

## 📄 How It Works

### Step 1: Import Libraries
```r
library(ggplot2)  # For plotting
library(dplyr)    # For data manipulation
```

### Step 2: Create Student Data
```r
students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Marks = c(87, 54, 72, 43, 65)
)
```

### Step 3: Calculate Grades
Uses nested `ifelse()` for conditional grade assignment:
```r
students$Grade <- ifelse(students$Marks >= 80, "A",
                  ifelse(students$Marks >= 60, "B",
                  ifelse(students$Marks >= 50, "C", "D")))
```

### Step 4: Determine Pass/Fail
```r
students$Result <- ifelse(students$Marks >= 50, "Pass", "Fail")
```

### Step 5: Visualize
```r
grade_counts <- students %>% count(Grade)

ggplot(grade_counts, aes(x = Grade, y = n, fill = Grade)) +
  geom_col(colour = "blue") +
  ggtitle("Students Exam Results") +
  xlab("Grade") +
  ylab("Count")
```

---

## 📊 Output Example

### Console Output
```r
   Name Marks Grade Result
1 Alice    87     A   Pass
2   Bob    54     C   Pass
3 Charlie  72     B   Pass
4 David    43     D   Fail
5   Eva    65     B   Pass
```

### Plot Output
A professional bar chart showing the count of each grade (A, B, C, D) with blue color scheme.

---

## 🧰 Technologies Used

| Component | Technology |
|-----------|-----------|
| **Language** | R 3.6+ |
| **Visualization** | ggplot2 (grammar of graphics) |
| **Data Manipulation** | dplyr (pipe operations) |
| **Environment** | RStudio (recommended) or base R |

---

## 💡 Key Concepts Demonstrated

- **Nested Conditional Logic** — Complex `ifelse()` statements for grading
- **Data Frames** — Creating and manipulating tabular data
- **dplyr Pipes** — `%>%` operator for readable data operations
- **ggplot2 Grammar** — Layered graphics with geoms and aesthetics
- **Theme Customization** — Title, axis labels, legend styling

---

## 🚀 Customization Ideas

### 1. Load from CSV File
```r
students <- read.csv("students.csv")
```

### 2. Use Different Grade Scales
Modify the nested `ifelse()` to support your institution's grading system (e.g., A+/A/A-, percentage-based, etc.)

### 3. Add More Statistics
```r
# Calculate mean mark
mean_mark <- mean(students$Marks)

# Calculate pass rate
pass_rate <- sum(students$Result == "Pass") / nrow(students)

print(paste("Average Mark:", mean_mark))
print(paste("Pass Rate:", percent(pass_rate)))
```

### 4. Generate Multiple Plots
```r
# Histogram of marks
ggplot(students, aes(x = Marks)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "darkblue") +
  ggtitle("Distribution of Student Marks")

# Scatter plot with grades
ggplot(students, aes(x = Name, y = Marks, color = Grade)) +
  geom_point(size = 5)
```

### 5. Save Plots to File
```r
# Save as PNG
ggsave("grade_distribution.png", width = 8, height = 6, dpi = 300)

# Save as PDF
ggsave("grade_distribution.pdf", width = 8, height = 6)
```

### 6. Interactive Plots with Shiny
```r
# Create a live dashboard where users select students/thresholds
# and the plot updates in real-time
```

---

## 📚 Educational Value

This project teaches:
- ✅ **Data Structures** — Working with dataframes
- ✅ **Control Flow** — Nested conditionals for complex logic
- ✅ **Data Visualization** — ggplot2 syntax and aesthetics
- ✅ **Functional Programming** — Vectorized operations (no loops!)
- ✅ **Package Management** — Installing and importing libraries
- ✅ **Data Analysis Workflow** — Load → Transform → Visualize

---

## 🔧 Troubleshooting

### "Package not found" error
```r
# Install the missing package
install.packages("ggplot2")
install.packages("dplyr")
```

### Plot doesn't display in RStudio
- Try clicking the **Plots** tab at the bottom right
- Or export manually:
  ```r
  png("output.png", width = 800, height = 600)
  # ... plotting code ...
  dev.off()
  ```

### Script stops with an error
- Ensure you've installed required packages (see above)
- Check that the dataframe has a "Marks" column
- Verify R version is 3.6 or higher

---

## 🎓 Next Steps

- ✨ Try modifying the grade scale (e.g., A+/A/B+/B/C/D)
- ✨ Add more students to the dataframe
- ✨ Calculate class statistics (mean, median, mode, standard deviation)
- ✨ Create side-by-side plots for multiple classes
- ✨ Save results to a CSV file for further analysis
- ✨ Build an interactive Shiny app with real-time grade calculator

---

## 📄 License

MIT — Free to use and modify.

---

## 👤 Author

Built by [@Sanjay-AI-ML](https://github.com/Sanjay-AI-ML)

Questions? Open an issue on GitHub!
