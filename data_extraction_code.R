# clear environment
rm(list = ls())

# import required packages
#devtools::install_github("EIvimeyCook/ShinyDigitise")
library(dplyr)
library(shinyDigitise)


#### Data from Mariton et al. (2022) ####

# import dataset
mariton_data <- read.csv("./data/mariton_data_01.csv")
head(mariton_data)

# extract relevant data for a new dataframe, to store the values needed to calculate the means for each treatment 
mariton_emergence_data <- subset(mariton_data, select = c(Date, Julian_day, Longitude, Latitude, Median_part1, Sunrise, Sunset, ALAN))
head(mariton_emergence_data)
colnames(mariton_emergence_data) <- c("date", "julian_day", "long", "lat", "first_emergence_time", "sunrise", "sunset", "radiance_mean")
head(mariton_emergence_data)

# check radiance levels recorded
min(mariton_emergence_data$radiance_mean)
max(mariton_emergence_data$radiance_mean)

# add another column to separate dataset into treatment groups
mariton_emergence_data <- mariton_emergence_data %>%
  mutate(treatment = ifelse(radiance_mean > 3, "light_treatment", "dark_treatment"))
head(mariton_emergence_data)

sum(mariton_emergence_data$treatment == "light_treatment")
sum(mariton_emergence_data$treatment == "dark_treatment")

# extract subsets of the data, including only each treatment group
mariton_light_treatment <- subset(mariton_emergence_data, treatment == "light_treatment")
mariton_dark_treatment <- subset(mariton_emergence_data, treatment == "dark_treatment")
# calculate the mean time of first emergence for each treatment
mariton_light_mean <- mean(mariton_light_treatment$first_emergence_time)
mariton_dark_mean <- mean(mariton_dark_treatment$first_emergence_time)
# calculate the se of first emergence for each treatment
mariton_light_se <- sd(mariton_light_treatment$first_emergence_time) / sqrt(length(mariton_light_treatment$first_emergence_time))
mariton_dark_se <- sd(mariton_dark_treatment$first_emergence_time) / sqrt(length(mariton_dark_treatment$first_emergence_time))

# convert units from seconds to minutes, to match the other studies
mariton_light_mean <- mariton_light_mean/60
mariton_dark_mean <- mariton_dark_mean/60
mariton_light_se <- mariton_light_se/60
mariton_dark_se <- mariton_dark_se/60


#### Data from Lou et al. (2021) ####

# load shinydigitise, extract data
#lou_data <- shinyDigitise(dir = normalizePath("./figures"))

# open data extracted using shinydigitise
metadigitise_output <- read.csv("./figures/ExtractedData.csv")
lou_metadigitise <- metadigitise_output[1:2, ]
View(lou_metadigitise)

# extract needed values from this dataset
lou_light_mean <- lou_metadigitise[2,5]
lou_dark_mean <- lou_metadigitise[1,5]
lou_light_se <- lou_metadigitise[2,9]
lou_dark_se <- lou_metadigitise[1,9]


#### Data from Zou et al. (2024) ####

zou_data <- read.csv("./data/zou_data_S5.csv")
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
# stone_data <- shinyDigitise(dir = normalizePath("./figures"))

# open data extracted using shinydigitise
metadigitise_output <- read.csv("./figures/ExtractedData.csv")
stone_metadigitise <- metadigitise_output[3:4, ]
View(stone_metadigitise)

# extract needed values from this dataset
stone_light_mean <- stone_metadigitise[2,5]
stone_dark_mean <- stone_metadigitise[1,5]
stone_light_se <- stone_metadigitise[2,9]
stone_dark_se <- stone_metadigitise[1,9]


#### Meta Analysis Data ####

# generate dataframe to contain all of the extracted values from this paper
bat_metaanalysis_data <- data.frame(paper_ID = rep(NA, 4), light_treatment_mean = rep(NA, 4), dark_treatment_mean = rep(NA, 4), light_se = rep(NA,4), dark_se = rep(NA, 4))
# Mariton et al. (2022)
bat_metaanalysis_data[1,1] <- "46VSSJ83"
bat_metaanalysis_data[1,2] <- mariton_light_mean
bat_metaanalysis_data[1,3] <- mariton_dark_mean
bat_metaanalysis_data[1,4] <- mariton_light_se
bat_metaanalysis_data[1,5] <- mariton_dark_se
# Lou et al. (2021)
bat_metaanalysis_data[2,1] <- "XLE9CETS"
bat_metaanalysis_data[2,2] <- lou_light_mean
bat_metaanalysis_data[2,3] <- lou_dark_mean
bat_metaanalysis_data[2,4] <- lou_light_se
bat_metaanalysis_data[2,5] <- lou_dark_se
# Zou et al. (2024)
bat_metaanalysis_data[3,1] <- "JTRLFNEZ"
bat_metaanalysis_data[3,2] <- zou_light_mean
bat_metaanalysis_data[3,3] <- zou_dark_mean
bat_metaanalysis_data[3,4] <- zou_light_se
bat_metaanalysis_data[3,5] <- zou_dark_se
View(bat_metaanalysis_data)
# Stone et al. (2009)
bat_metaanalysis_data[4,1] <- "6IHYJZ5N"
bat_metaanalysis_data[4,2] <- stone_light_mean
bat_metaanalysis_data[4,3] <- stone_dark_mean
bat_metaanalysis_data[4,4] <- stone_light_se
bat_metaanalysis_data[4,5] <- stone_dark_se
View(bat_metaanalysis_data)

# Then extract data into the final meta-analysis table!
write.csv(bat_metaanalysis_data, "./data/meta_analysis_data.csv", row.names = FALSE)

# Left to do:
# Check difference between Mariton 01 and 05!