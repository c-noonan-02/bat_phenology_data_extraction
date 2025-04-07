# clear environment
rm(list = ls())

# import required packages
#devtools::install_github("EIvimeyCook/ShinyDigitise")
library(dplyr)
library(shinyDigitise)


#### Data from Lou et al. (2021) ####

# load shinydigitise, extract data
#lou_data <- shinyDigitise(dir = normalizePath("./time_activity_onset/figures"))

# open data extracted using shinydigitise
metadigitise_output <- read.csv("./time_activity_onset/figures/ExtractedData.csv")
lou_metadigitise <- metadigitise_output[1:2, ]
View(lou_metadigitise)

# extract needed values from this dataset
lou_light_mean <- lou_metadigitise[2,5]
lou_dark_mean <- lou_metadigitise[1,5]
lou_light_se <- lou_metadigitise[2,9]
lou_dark_se <- lou_metadigitise[1,9]


#### Data from Zou et al. (2024) ####

zou_data <- read.csv("./time_activity_onset/data/zou_data_S5.csv")
head(zou_data)

# generate subset only including the data needed for the meta analysis
zou_foraging_data <- subset(zou_data, select = c(treatment, bat_ID, time_foraging_onset))
head(zou_foraging_data)

# extract subsets of the data, including only each treatment group
zou_light_treatment <- subset(zou_foraging_data, treatment == "white_light")
zou_dark_treatment <- subset(zou_foraging_data, treatment == "dark_control")
# calculate the mean time of first emergence for each treatment
zou_light_mean <- mean(zou_light_treatment$time_foraging_onset)
zou_dark_mean <- mean(zou_dark_treatment$time_foraging_onset)
# calculate the se of first emergence for each treatment
zou_light_se <- sd(zou_light_treatment$time_foraging_onset) / sqrt(length(zou_light_treatment$time_foraging_onset))
zou_dark_se <- sd(zou_dark_treatment$time_foraging_onset) / sqrt(length(zou_dark_treatment$time_foraging_onset))


#### Data from Stone et al. (2009) ####

# load shinydigitise, extract data
#stone_data <- shinyDigitise(dir = normalizePath("./time_activity_onset/figures"))

# open data extracted using shinydigitise
metadigitise_output <- read.csv("./time_activity_onset/figures/ExtractedData.csv")
stone_metadigitise <- metadigitise_output[3:4, ]
View(stone_metadigitise)

# extract needed values from this dataset
stone_light_mean <- stone_metadigitise[1,5]
stone_dark_mean <- stone_metadigitise[2,5]
stone_light_se <- stone_metadigitise[1,9]
stone_dark_se <- stone_metadigitise[2,9]


#### Meta Analysis Data ####

# generate dataframe to contain all of the extracted values from this paper
bat_metaanalysis_data <- data.frame(paper_ID = rep(NA, 3), light_treatment_mean = rep(NA, 3), dark_treatment_mean = rep(NA, 3), light_se = rep(NA, 3), dark_se = rep(NA, 3))
# Lou et al. (2021)
bat_metaanalysis_data[1,1] <- "XLE9CETS"
bat_metaanalysis_data[1,2] <- lou_light_mean
bat_metaanalysis_data[1,3] <- lou_dark_mean
bat_metaanalysis_data[1,4] <- lou_light_se
bat_metaanalysis_data[1,5] <- lou_dark_se
# Zou et al. (2024)
bat_metaanalysis_data[2,1] <- "JTRLFNEZ"
bat_metaanalysis_data[2,2] <- zou_light_mean
bat_metaanalysis_data[2,3] <- zou_dark_mean
bat_metaanalysis_data[2,4] <- zou_light_se
bat_metaanalysis_data[2,5] <- zou_dark_se
# Stone et al. (2009)
bat_metaanalysis_data[3,1] <- "6IHYJZ5N"
bat_metaanalysis_data[3,2] <- stone_light_mean
bat_metaanalysis_data[3,3] <- stone_dark_mean
bat_metaanalysis_data[3,4] <- stone_light_se
bat_metaanalysis_data[3,5] <- stone_dark_se
View(bat_metaanalysis_data)

# Then extract data into the final meta-analysis table!
write.csv(bat_metaanalysis_data, "./time_activity_onset/data/meta_analysis_data.csv", row.names = FALSE)
