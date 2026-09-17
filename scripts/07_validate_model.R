# 07_validate_model.R
library(dismo)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Evaluating model... calculating AUC...\n")
# validation with test data (AUC > 0.796 expected as per README)
