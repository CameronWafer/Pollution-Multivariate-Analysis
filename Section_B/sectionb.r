# -------------------------------
# STAT 419 Section B: Graphs and Summary Stats
# -------------------------------

# Set working directory
setwd("/Users/sreerenjininamboothiri/stat419")

# Load the dataset
pollution <- read.csv("pollution_419.csv", header = TRUE)

# Quick structure check
print("Data Structure:")
str(pollution)

# Summary statistics
quant_vars <- c("PRECIP", "EDUC", "NONWHITE", "NOX", "SO2")

cat("\n=== Mean ===\n")
print(sapply(pollution[, quant_vars], mean))

cat("\n=== Median ===\n")
print(sapply(pollution[, quant_vars], median))

cat("\n=== Standard Deviation ===\n")
print(sapply(pollution[, quant_vars], sd))

# Create and save histograms
for (var in quant_vars) {
  filename <- paste0("hist_", var, ".png")
  png(filename)
  hist(pollution[[var]],
       main = paste("Histogram of", var),
       xlab = var,
       col = "skyblue",
       border = "black")
  dev.off()
  cat(paste("Saved histogram to", filename, "\n"))
}

# Optional: View all histograms together in RStudio
par(mfrow = c(2, 3))  # layout: 2 rows, 3 columns
for (var in quant_vars) {
  hist(pollution[[var]],
       main = paste("Histogram of", var),
       xlab = var,
       col = "skyblue",
       border = "black")
}