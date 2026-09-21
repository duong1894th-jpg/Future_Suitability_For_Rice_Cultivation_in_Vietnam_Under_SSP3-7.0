# 02b_transform_climate_data.R
# This script extracts 2020 climate data (temperature and rainfall) and transforms
# it into selected Bioclimatic variables (bio4, bio10, bio11, bio12, bio15).
# Data source: https://data.opendevelopmentmekong.net/dataset/data-on-average-rainfall-minimum-temperature-average-temperature-and-maximum-temperature-in-vietnam

library(dplyr)
library(terra)
library(dismo)

# -----------------------------------------------------------------------------
# 1. Load Data
# -----------------------------------------------------------------------------
# Load the raw climate dataset (Update the path with the actual downloaded file name)
climate_data_path <- "../data/raw/vietnam_climate_1991_2020.csv" 
# Ensure the dataset has columns like: Year, Month, Tmin, Tmax, Precip, Longitude, Latitude
if (file.exists(climate_data_path)) {
  climate_df <- read.csv(climate_data_path)
} else {
  stop("Climate data file not found. Please download it from Open Development Mekong and place it in the data/raw/ directory.")
}

# -----------------------------------------------------------------------------
# 2. Extract Data for 2020
# -----------------------------------------------------------------------------
climate_2020 <- climate_df %>%
  filter(Year == 2020)

# Check if 12 months are present for each location
# Sort by location and month to ensure correct order for biovars calculation
climate_2020 <- climate_2020 %>%
  arrange(Longitude, Latitude, Month)

# -----------------------------------------------------------------------------
# 3. Transform to Spatial Format & Compute Bioclim Variables
# -----------------------------------------------------------------------------
# The dismo::biovars function expects matrices or vectors of prec, tmin, tmax
# where rows are locations and columns are months (1 to 12).
# Here we reshape the data to wide format for each variable.

library(tidyr)

prec_wide <- climate_2020 %>%
  select(Longitude, Latitude, Month, Precip) %>%
  pivot_wider(names_from = Month, values_from = Precip) %>%
  select(-Longitude, -Latitude) %>%
  as.matrix()

tmin_wide <- climate_2020 %>%
  select(Longitude, Latitude, Month, Tmin) %>%
  pivot_wider(names_from = Month, values_from = Tmin) %>%
  select(-Longitude, -Latitude) %>%
  as.matrix()

tmax_wide <- climate_2020 %>%
  select(Longitude, Latitude, Month, Tmax) %>%
  pivot_wider(names_from = Month, values_from = Tmax) %>%
  select(-Longitude, -Latitude) %>%
  as.matrix()

coords <- climate_2020 %>%
  select(Longitude, Latitude) %>%
  distinct()

# Calculate all 19 bioclim variables
bioclim_vars <- biovars(prec_wide, tmin_wide, tmax_wide)

# -----------------------------------------------------------------------------
# 4. Select Target Bioclim Variables (Bio4, Bio10, Bio11, Bio12, Bio15)
# -----------------------------------------------------------------------------
bioclim_selected <- as.data.frame(bioclim_vars) %>%
  select(bio4, bio10, bio11, bio12, bio15)

# Combine with coordinates
bioclim_final <- bind_cols(coords, bioclim_selected)

# -----------------------------------------------------------------------------
# 5. Save the Processed Data
# -----------------------------------------------------------------------------
output_path <- "../data/processed/bioclim_2020_selected.csv"
dir.create(dirname(output_path), showWarnings = FALSE, recursive = TRUE)
write.csv(bioclim_final, output_path, row.names = FALSE)

cat("Successfully transformed 2020 climate data into Bioclim variables.\n")
