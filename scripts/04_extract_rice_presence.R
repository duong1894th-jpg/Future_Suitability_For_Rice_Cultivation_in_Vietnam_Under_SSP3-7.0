# 04_extract_rice_presence.R
library(terra)
library(sf)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Extracting rice presence from JAXA Land Cover 2020...\n")
# Extract pixels where rice is cultivated and convert to point geometries
