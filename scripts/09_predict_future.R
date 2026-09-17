# 09_predict_future.R
library(terra)
library(maxnet)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Predicting future suitability (2041-2070 SSP3-7.0)...\n")
# pred_future <- predict(future_env_raster, model, type="cloglog")
# writeRaster(pred_future, file.path(config$paths$results_maps, "suitability_ssp3_70.tif"))
