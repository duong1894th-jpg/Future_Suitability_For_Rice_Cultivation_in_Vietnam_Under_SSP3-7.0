# 05_sample_train_test.R
library(sf)
library(yaml)
library(dplyr)

config <- yaml.load_file("../config/config.yaml")
set.seed(config$model$seed)

cat("Generating spatially distributed presence/background points and splitting into train/test sets...\n")
