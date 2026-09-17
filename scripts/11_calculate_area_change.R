# 11_calculate_area_change.R
library(terra)
library(yaml)
library(dplyr)

config <- yaml.load_file("../config/config.yaml")

cat("Quantifying changes in suitable area...\n")
# Thresholding and area calculation (Absolute change and Percentage change)
