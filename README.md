# Rice Cultivation Suitability Mapping under SSP3-7.0

## Overview

This repository contains the workflow and results of a study assessing potential changes in the spatial suitability of rice cultivation in Vietnam under future climate conditions.

The study applies the **Maximum Entropy (Maxent)** model to characterize the relationship between observed rice-cultivation locations and environmental conditions. The trained model is subsequently projected onto baseline and future climate conditions to examine potential changes in the distribution and extent of environmentally suitable rice-growing areas.

The analysis compares:

- **Baseline:** 2020
- **Future:** 2041–2070 under the **SSP3-7.0** scenario

The main objective is to determine whether future climate conditions may result in:

1. a spatial shift in environmentally suitable rice-growing areas; and
2. a change in the overall extent of suitable areas.

> **Important:** The model estimates environmental suitability rather than directly predicting future farmer decisions or actual land-use change.

---

# Research Questions

The study addresses four main questions:

1. How does the spatial distribution of rice-growing suitability change between 2020 and 2041–2070 under SSP3-7.0?
2. Which regions are projected to experience decreases or increases in environmental suitability?
3. Does the spatial distribution indicate a potential geographical shift in suitable rice-growing areas?
4. Does the total extent of environmentally suitable land change under the future climate scenario?

---

# Scenario Selection

## SSP3-7.0: Regional Rivalry

The future projection uses **SSP3-7.0**, which is based on the *Regional Rivalry* socioeconomic pathway.

SSP3 describes a future characterized by increasing regional competition, limited international cooperation, relatively slow economic and technological development, and greater challenges to climate-change adaptation.

SSP3-7.0 combines this socioeconomic pathway with a relatively high radiative-forcing trajectory. It is therefore used in this study as a **stress-test scenario** for examining how rice-growing suitability may respond to future environmental conditions under substantial climate pressure.

SSP3-7.0 is treated as a scenario for impact assessment rather than a prediction of the most likely future.

References:

- [IPCC AR6 — Working Group I](https://www.ipcc.ch/report/ar6/wg1/)
- [IPCC — Shared Socioeconomic Pathways](https://www.ipcc.ch/report/ar6/wg1/chapter/chapter-1/)

---

# Data

## Rice Cultivation Presence Data

Rice cultivation presence locations were derived from the **2020 JAXA land-cover dataset**.

Pixels classified as rice cultivation were extracted as candidate presence locations. Spatial sampling was subsequently applied to reduce computational requirements while maintaining spatial coverage.

The final modelling dataset contains:

- **896 rice presence points** for model development
- **6,281 non-rice points** for independent evaluation

The occurrence data represent observed rice-cultivation locations and are used to characterize the environmental conditions associated with rice production.

Source: [JAXA Earth Observation Research Center](https://earth.jaxa.jp/en/)

---

## Climate Data

Bioclimatic variables were obtained from **CHELSA**.

The model uses:

| Variable | Description |
|---|---|
| Bio4 | Temperature Seasonality |
| Bio10 | Mean Temperature of the Warmest Quarter |
| Bio11 | Mean Temperature of the Coldest Quarter |
| Bio12 | Annual Precipitation |
| Bio15 | Precipitation Seasonality |

Historical and future climate layers are used to represent baseline and SSP3-7.0 environmental conditions.

Source: [CHELSA Climate Data](https://www.chelsa-climate.org/)

---

## Topography

A **Digital Elevation Model (DEM)** was incorporated as a topographic predictor.

Source: [Open Development Mekong — Digital Elevation Model](https://data.opendevelopmentmekong.net/vi/dataset/digital-elevation-model-dem)

---

## Soil

Soil-type data were incorporated to represent differences in soil-related environmental conditions.

Source: [Open Development Mekong — Soil Types in Vietnam](https://data.vietnam.opendevelopmentmekong.net/en/dataset/soil-types-in-vietnam)

---

## Study Area Boundary

A standardized national boundary of Vietnam was used to define the study area and clip the spatial datasets.

Source: [GIS.vn — Vietnam Administrative Map](https://gis.vn/ban-do-hanh-chinh-viet-nam)

---

# Data Preprocessing

All spatial datasets were processed before model development.

The preprocessing workflow consisted of:

1. Preparing the national boundary of Vietnam.
2. Clipping all datasets to the study area.
3. Reprojecting datasets where necessary.
4. Harmonizing spatial extent.
5. Harmonizing spatial resolution.
6. Aligning raster grids.
7. Preparing the final environmental predictor layers.

The common spatial resolution was determined according to the lowest-resolution environmental raster used in the analysis.

---

# Methodology

## Maximum Entropy Modelling

The study uses the **Maximum Entropy (Maxent)** approach to estimate the environmental suitability of rice cultivation.

The modelling process can be summarized as:

```text
JAXA Land Cover
      │
      ▼
Rice Presence Locations
      │
      ▼
Spatial Sampling
      │
      ▼
Environmental Predictors
      │
      ├── Climate
      ├── Soil
      └── Elevation
      │
      ▼
    Maxent
      │
      ▼
Suitability Index
```

The resulting **Suitability Index** represents the relative environmental suitability of each spatial cell for rice cultivation.

---

## Model Validation

Model performance was evaluated using an independent dataset containing rice and non-rice locations.

The model achieved an **AUC of 0.796**.

Because:

```text
0.5 < AUC < 1
```

the result indicates that the model has a useful ability to distinguish rice-associated locations from non-rice locations.

The independent evaluation is further supported by comparing the distributions of predicted suitability values between rice and non-rice locations.

The boxplot shows a clear separation between the two groups, with their central distributions showing limited overlap. This indicates that locations associated with rice cultivation generally receive higher suitability values than the comparison locations.

Together, the AUC and independent suitability comparison provide evidence that the model captures meaningful environmental patterns associated with the observed distribution of rice cultivation.

---

# Results

## Baseline Suitability — 2020

The first suitability map represents the modeled environmental suitability for rice cultivation under the baseline conditions.

The model successfully identifies the major rice-producing regions of Vietnam, including:

- the **Mekong Delta**;
- the **Red River Delta**; and
- the **Central Coastal Plains**.

The model also identifies smaller, spatially distributed areas of suitable conditions in upland, mountainous, and highland regions.

The spatial agreement between the predicted suitability pattern and the major observed rice-producing regions indicates that the model captures important geographical characteristics associated with rice cultivation.

---

## Future Suitability — 2041–2070 under SSP3-7.0

The future projection indicates an overall deterioration of environmental suitability for rice cultivation across Vietnam under the SSP3-7.0 scenario.

A notable pattern is the substantial reduction in suitability in higher-elevation areas. Consequently, environmentally suitable rice-growing conditions become increasingly concentrated in lowland and deltaic regions.

However, the major lowland rice-producing regions are also projected to experience considerable reductions in suitability.

### Northern Vietnam

The Red River Delta remains environmentally suitable for rice cultivation, although its suitability is projected to decline compared with the baseline.

### Central Vietnam

The suitability of the Central Coastal Plains is comparatively maintained. However, the relatively limited extent of suitable land means that the region's potential contribution to national rice production remains geographically constrained.

### Southern Vietnam

The southern region shows substantial deterioration in modeled suitability.

The strongest reduction occurs in the western and southeastern parts of southern Vietnam, particularly areas close to the Cambodian border. In some of these areas, modeled suitability decreases by approximately **two-thirds relative to the 2020 baseline**.

The Mekong Delta therefore represents one of the major regions requiring attention when assessing potential future changes in the environmental suitability of rice cultivation.

---

# Potential Spatial Shift

The comparison between baseline and future suitability suggests a potential **concentration of suitable rice-growing environments toward lower-elevation areas**.

The projected pattern can be summarized as:

```text
2020

Mountainous / Highland
        │
        ├── Some suitable areas
        │
        ▼
Lowland / Delta
        │
        └── Major suitable areas


2041–2070
SSP3-7.0

Mountainous / Highland
        │
        └── Strong reduction in suitability
                     │
                     ▼
Lowland / Delta
        │
        ├── Remains relatively more suitable
        │
        └── But also experiences substantial decline
```

This indicates that future changes may involve both:

- **spatial redistribution of suitable environments**, and
- **overall contraction of suitable environments**.

The results therefore suggest that the future response may not simply be a movement of rice cultivation from one region to another. Instead, some regions may lose suitability without an equivalent expansion elsewhere.

---

# Interpretation

The results indicate three broad patterns.

### 1. Contraction at higher elevations

Areas that currently provide suitable environmental conditions for rice cultivation in upland and mountainous regions are projected to experience substantial reductions in suitability.

### 2. Increasing concentration in lowlands

As suitability declines in higher-elevation areas, the remaining relatively suitable environments become increasingly concentrated in the major lowland and deltaic regions.

### 3. Potential reduction in total suitable area

The deterioration of suitability in both upland areas and major lowland production regions suggests that future change may involve not only a geographical redistribution but also a potential reduction in the total environmentally suitable area.

The magnitude of this area change should be quantified using the final suitability threshold and spatial-area analysis.

---

# Suitability Change Analysis

The difference between future and baseline suitability is calculated as:

```text
ΔS(x) = S_future(x) − S_baseline(x)
```

where:

- `S_baseline(x)` is the modeled suitability at location `x` under baseline conditions;
- `S_future(x)` is the modeled suitability at the same location under SSP3-7.0 conditions.

The resulting difference map identifies areas experiencing:

- increased suitability;
- decreased suitability; and
- relatively stable suitability.

A suitability threshold can then be applied to estimate the extent of suitable land in each period.

The change in suitable area can be expressed as:

```text
Absolute change = Future suitable area − Baseline suitable area
```

and:

```text
Percentage change =
(Future suitable area − Baseline suitable area)
÷ Baseline suitable area × 100
```

---

# Key Findings

The main findings of the study are:

- The Maxent model achieved an **AUC of 0.796**, indicating useful discrimination between rice-associated and comparison locations.
- The independent suitability distributions show clear separation between rice and non-rice locations.
- The 2020 suitability map successfully captures the major rice-producing regions of Vietnam.
- Under SSP3-7.0 for 2041–2070, environmental suitability for rice cultivation generally decreases across the country.
- Higher-elevation regions show particularly strong reductions in suitability.
- Future suitable environments become increasingly concentrated in lowland and deltaic areas.
- The major rice-producing regions are also affected by declining suitability.
- Southern Vietnam, particularly areas near the Cambodian border, shows some of the strongest projected reductions, with suitability decreasing by approximately two-thirds in the affected areas.
- The results indicate that future change may involve both a **potential spatial shift** and a **potential contraction of environmentally suitable rice-growing areas**.

---

# Limitations

Several limitations should be considered when interpreting the results.

### Environmental suitability is not actual land use

Maxent estimates environmental suitability based on the selected predictors and observed occurrence data. It does not directly model future farmer decisions, agricultural policies, irrigation development, market conditions, or land-use conversion.

### Scenario uncertainty

The future projection is based on a single socioeconomic-climate scenario, SSP3-7.0. Other SSP scenarios may produce different environmental conditions and therefore different suitability patterns.

### Predictor limitations

The model represents only the environmental variables included in the analysis. Other factors affecting rice cultivation, such as irrigation availability, flooding, salinity, water resources, and land-use pressure, are not necessarily fully represented.

### Threshold dependence

Estimates of suitable-area change depend on the threshold used to convert continuous suitability values into suitable/unsuitable classes. Continuous suitability changes should therefore be considered alongside threshold-based area estimates.

---

# Repository Structure

```text
rice-suitability-maxent/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── data/
│   ├── README.md
│   └── sources.md
│
├── config/
│   └── config.yaml
│
├── scripts/
│   ├── 01_prepare_boundary.py
│   ├── 02_prepare_baseline_environment.py
│   ├── 03_prepare_future_environment.py
│   ├── 04_extract_rice_presence.py
│   ├── 05_sample_train_test.py
│   ├── 06_train_maxent.py
│   ├── 07_validate_model.py
│   ├── 08_predict_baseline.py
│   ├── 09_predict_future.py
│   ├── 10_compare_suitability.py
│   └── 11_calculate_area_change.py
│
├── results/
│   ├── figures/
│   ├── maps/
│   └── tables/
│
└── docs/
    └── methodology.md
```

---

# Main Outputs

The repository produces the following outputs:

### Model evaluation

- AUC score
- Suitability distribution boxplot
- Validation summary

### Spatial outputs

- 2020 baseline suitability map
- 2041–2070 SSP3-7.0 suitability map
- Suitability-change map
- Suitable-area gain/loss map

### Quantitative outputs

- Baseline suitable area
- Future suitable area
- Absolute area change
- Percentage area change
- Regional suitability changes

---

# Reproducibility

The workflow is organized into sequential processing steps:

```text
01 → Prepare study boundary

02 → Prepare baseline environmental data

03 → Prepare future SSP3-7.0 environmental data

04 → Extract rice presence locations

05 → Generate training and evaluation datasets

06 → Train Maxent

07 → Evaluate model

08 → Predict baseline suitability

09 → Predict future suitability

10 → Compare baseline and future suitability

11 → Quantify changes in suitable area
```

Large raster datasets are not included in this repository. Their original sources and acquisition information are documented in `data/sources.md`.

---

# Data Sources

| Dataset | Use | Source |
|---|---|---|
| JAXA Land Cover | Rice presence data | [JAXA](https://earth.jaxa.jp/en/) |
| CHELSA Bioclim | Climate predictors | [CHELSA](https://www.chelsa-climate.org/) |
| DEM | Elevation | [Open Development Mekong](https://data.opendevelopmentmekong.net/) |
| Soil | Soil predictor | [Open Development Mekong](https://data.vietnam.opendevelopmentmekong.net/) |
| Vietnam Boundary | Study-area definition | [GIS.vn](https://gis.vn/ban-do-hanh-chinh-viet-nam) |

Dataset versions, spatial resolutions, coordinate reference systems, acquisition dates, and licensing information should be documented in `data/sources.md`.

---

# Citation

If you use this repository, workflow, or results in academic work, please cite the corresponding study and the original datasets.

The modelling approach is based on the Maximum Entropy method for estimating environmental distributions from presence data.

---

# Project Status

**Research project — completed analysis / results under documentation**

This repository documents the modelling workflow and findings of an assessment of potential changes in rice-growing environmental suitability in Vietnam under SSP3-7.0.