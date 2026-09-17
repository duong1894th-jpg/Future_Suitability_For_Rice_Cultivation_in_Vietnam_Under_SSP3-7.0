# 06_train_maxent.R
library(dismo)
library(maxnet)
library(yaml)

config <- yaml.load_file("../config/config.yaml")

cat("Training Maxent model...\n")
# model <- maxnet(p = presence_vector, data = environmental_predictors)
# saveRDS(model, file.path(config$paths$models, "maxent_model.rds"))
