# 02_prepare_baseline_environment.R
library(terra)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Preparing baseline environmental data (CHELSA, DEM, Soil)...\n")
# Aligning, cropping to boundary, and harmonizing resolution
