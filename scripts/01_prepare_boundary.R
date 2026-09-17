# 01_prepare_boundary.R
library(sf)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

# Load and prepare Vietnam boundary
cat("Preparing study boundary...\n")
# boundary <- st_read(file.path(config$paths$data_raw, "vietnam_boundary.shp"))
# st_write(boundary, file.path(config$paths$data_processed, "vietnam_boundary_processed.gpkg"))
