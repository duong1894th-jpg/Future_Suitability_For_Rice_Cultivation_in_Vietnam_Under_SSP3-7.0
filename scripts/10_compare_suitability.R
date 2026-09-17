# 10_compare_suitability.R
library(terra)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Calculating suitability difference...\n")
# diff <- pred_future - pred_baseline
# writeRaster(diff, file.path(config$paths$results_maps, "suitability_difference.tif"))
