# clear environment
rm(list = ls())

# import required packages
library(dplyr)


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
  mutate(treatment = ifelse(radiance_mean > 5, "light_treatment", "dark_treatment"))
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






#### Meta Analysis Data ####

# generate dataframe to contain all of the extracted values from this paper
bat_metaanalysis_data <- data.frame(paper_ID = rep(NA, 3), light_treatment_mean = rep(NA, 3), dark_treatment_mean = rep(NA, 3), light_se = rep(NA,3), dark_se = rep(NA, 3))
bat_metaanalysis_data[1,1] <- "46VSSJ83"
bat_metaanalysis_data[1,2] <- mariton_light_mean
bat_metaanalysis_data[1,3] <- mariton_dark_mean
bat_metaanalysis_data[1,4] <- mariton_light_se
bat_metaanalysis_data[1,5] <- mariton_dark_se
View(bat_metaanalysis_data)
