# 08_predict_baseline.R
library(terra)
library(maxnet)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Predicting baseline suitability (2020)...\n")
# pred_baseline <- predict(baseline_env_raster, model, type="cloglog")
# writeRaster(pred_baseline, file.path(config$paths$results_maps, "suitability_baseline.tif"))
