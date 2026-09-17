# 03_prepare_future_environment.R
library(terra)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Preparing future SSP3-7.0 environmental data...\n")
# Processing future climate data
