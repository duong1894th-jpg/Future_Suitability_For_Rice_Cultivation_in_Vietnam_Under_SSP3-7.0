# main.R - Rice Cultivation Suitability Mapping under SSP3-7.0
# Combined analysis script based on the project README

# -----------------------------------------------------------------------------
# Setup & Configuration
# -----------------------------------------------------------------------------
library(sf)
library(terra)
library(dplyr)
library(dismo)
library(maxnet)
library(yaml)

# Load configuration (assumes running from the scripts/ directory or adjust path)
config <- yaml.load_file(file.path(dirname(getwd()), "config", "config.yaml"))
set.seed(config$model$seed)

# -----------------------------------------------------------------------------
# 01_prepare_boundary
# -----------------------------------------------------------------------------
cat("1. Preparing study boundary...\n")
# boundary <- st_read(file.path(config$paths$data_raw, "vietnam_boundary.shp"))
# st_write(boundary, file.path(config$paths$data_processed, "vietnam_boundary_processed.gpkg"))

# -----------------------------------------------------------------------------
# 02_prepare_baseline_environment
# -----------------------------------------------------------------------------
cat("2. Preparing baseline environmental data (CHELSA, DEM, Soil)...\n")
# Aligning, cropping to boundary, and harmonizing resolution

# -----------------------------------------------------------------------------
# 03_prepare_future_environment
# -----------------------------------------------------------------------------
cat("3. Preparing future SSP3-7.0 environmental data...\n")
# Processing future climate data

# -----------------------------------------------------------------------------
# 04_extract_rice_presence
# -----------------------------------------------------------------------------
cat("4. Extracting rice presence from JAXA Land Cover 2020...\n")
# Extract pixels where rice is cultivated and convert to point geometries

# -----------------------------------------------------------------------------
# 05_sample_train_test
# -----------------------------------------------------------------------------
cat("5. Generating spatially distributed presence/background points and splitting into train/test sets...\n")
# Sample 896 rice presence points and 6,281 non-rice points (as per README)

# -----------------------------------------------------------------------------
# 06_train_maxent
# -----------------------------------------------------------------------------
cat("6. Training Maxent model...\n")
# model <- maxnet(p = presence_vector, data = environmental_predictors)
# saveRDS(model, file.path(config$paths$models, "maxent_model.rds"))

# -----------------------------------------------------------------------------
# 07_validate_model
# -----------------------------------------------------------------------------
cat("7. Evaluating model... calculating AUC...\n")
# Validation with test data (AUC > 0.796 expected as per README)

# -----------------------------------------------------------------------------
# 08_predict_baseline
# -----------------------------------------------------------------------------
cat("8. Predicting baseline suitability (2020)...\n")
# pred_baseline <- predict(baseline_env_raster, model, type="cloglog")
# writeRaster(pred_baseline, file.path(config$paths$results_maps, "suitability_baseline.tif"))

# -----------------------------------------------------------------------------
# 09_predict_future
# -----------------------------------------------------------------------------
cat("9. Predicting future suitability (2041-2070 SSP3-7.0)...\n")
# pred_future <- predict(future_env_raster, model, type="cloglog")
# writeRaster(pred_future, file.path(config$paths$results_maps, "suitability_ssp3_70.tif"))

# -----------------------------------------------------------------------------
# 10_compare_suitability
# -----------------------------------------------------------------------------
cat("10. Calculating suitability difference...\n")
# diff <- pred_future - pred_baseline
# writeRaster(diff, file.path(config$paths$results_maps, "suitability_difference.tif"))

# -----------------------------------------------------------------------------
# 11_calculate_area_change
# -----------------------------------------------------------------------------
cat("11. Quantifying changes in suitable area...\n")
# Thresholding and area calculation (Absolute change and Percentage change)
