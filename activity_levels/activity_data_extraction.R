# clear environment
rm(list = ls())

# import required packages
library(dplyr)
library(shinyDigitise)


#### Shiny Digitise ####

# code for shiny digitise
#figures_data <- shinyDigitise(dir = normalizePath("./activity_levels/figures"))
metadigitise_output <- read.csv("./activity_levels/figures/ExtractedData.csv")
View(metadigitise_output)


#### Extraction of mean number of passes ####

##### Data from Lou et al. (2012) #####
lou_metadigitise <- metadigitise_output[37:38, ]
head(lou_metadigitise)

# extract needed values from this dataset
lou_light_mean <- lou_metadigitise[2,5]
lou_dark_mean <- lou_metadigitise[1,5]
lou_light_se <- lou_metadigitise[2,9]
lou_dark_se <- lou_metadigitise[1,9]
lou_light_n <- lou_metadigitise[2,7]
lou_dark_n <- lou_metadigitise[1,7]
lou_species <- "Rhinolophus_hipposiderus"


##### Data from Hooker et al. (2012) #####
hooker_metadigitise <- metadigitise_output[25:36, ]
head(hooker_metadigitise)

hooker_myot_light_mean <- hooker_metadigitise[2,5]
hooker_myot_dark_mean <- hooker_metadigitise[1,5]
hooker_myot_light_se <- hooker_metadigitise[2,9]
hooker_myot_dark_se <- hooker_metadigitise[1,9]
hooker_myot_light_n <- hooker_metadigitise[2,7]
hooker_myot_dark_n <- hooker_metadigitise[1,7]
hooker_myot_species <- "Myotis_spp"

hooker_ppyg_light_mean <- hooker_metadigitise[6,5]
hooker_ppyg_dark_mean <- hooker_metadigitise[5,5]
hooker_ppyg_light_se <- hooker_metadigitise[6,9]
hooker_ppyg_dark_se <- hooker_metadigitise[5,9]
hooker_ppyg_light_n <- hooker_metadigitise[6,7]
hooker_ppyg_dark_n <- hooker_metadigitise[5,7]
hooker_ppyg_species <- "Pipistrellus_pygmaeus"

hooker_ppip_light_mean <- hooker_metadigitise[10,5]
hooker_ppip_dark_mean <- hooker_metadigitise[9,5]
hooker_ppip_light_se <- hooker_metadigitise[10,9]
hooker_ppip_dark_se <- hooker_metadigitise[9,9]
hooker_ppip_light_n <- hooker_metadigitise[10,7]
hooker_ppip_dark_n <- hooker_metadigitise[9,7]
hooker_ppip_species <- "Pipistrellus_pipistrellus"


##### Data from Froidevaux et al. (2018) #####
froidevaux_metadigitise <- metadigitise_output[1:16, ]
head(froidevaux_metadigitise)

froidevaux_rfer_light_mean <- froidevaux_metadigitise[2,5]
froidevaux_rfer_dark_mean <- froidevaux_metadigitise[1,5]
froidevaux_rfer_light_se <- froidevaux_metadigitise[2,9]
froidevaux_rfer_dark_se <- froidevaux_metadigitise[1,9]
froidevaux_rfer_light_n <- froidevaux_metadigitise[2,7]
froidevaux_rfer_dark_n <- froidevaux_metadigitise[1,7]
froidevaux_rfer_species <- "Rhinolophus_ferrumequinum"

froidevaux_rhip_light_mean <- froidevaux_metadigitise[4,5]
froidevaux_rhip_dark_mean <- froidevaux_metadigitise[3,5]
froidevaux_rhip_light_se <- froidevaux_metadigitise[4,9]
froidevaux_rhip_dark_se <- froidevaux_metadigitise[3,9]
froidevaux_rhip_light_n <- froidevaux_metadigitise[4,7]
froidevaux_rhip_dark_n <- froidevaux_metadigitise[3,7]
froidevaux_rhip_species <- "Rhinolophus_hipposideros"

froidevaux_myot_light_mean <- froidevaux_metadigitise[6,5]
froidevaux_myot_dark_mean <- froidevaux_metadigitise[5,5]
froidevaux_myot_light_se <- froidevaux_metadigitise[6,9]
froidevaux_myot_dark_se <- froidevaux_metadigitise[5,9]
froidevaux_myot_light_n <- froidevaux_metadigitise[6,7]
froidevaux_myot_dark_n <- froidevaux_metadigitise[5,7]
froidevaux_myot_species <- "Myotis_spp"

froidevaux_ppip_light_mean <- froidevaux_metadigitise[8,5]
froidevaux_ppip_dark_mean <- froidevaux_metadigitise[7,5]
froidevaux_ppip_light_se <- froidevaux_metadigitise[8,9]
froidevaux_ppip_dark_se <- froidevaux_metadigitise[7,9]
froidevaux_ppip_light_n <- froidevaux_metadigitise[8,7]
froidevaux_ppip_dark_n <- froidevaux_metadigitise[7,7]
froidevaux_ppip_species <- "Pipistrellus_pipistrellus"

froidevaux_ppyg_light_mean <- froidevaux_metadigitise[10,5]
froidevaux_ppyg_dark_mean <- froidevaux_metadigitise[9,5]
froidevaux_ppyg_light_se <- froidevaux_metadigitise[10,9]
froidevaux_ppyg_dark_se <- froidevaux_metadigitise[9,9]
froidevaux_ppyg_light_n <- froidevaux_metadigitise[10,7]
froidevaux_ppyg_dark_n <- froidevaux_metadigitise[9,7]
froidevaux_ppyg_species <- "Pipistrellus_pygmaeus"

# froidevaux_epny_light_mean <- froidevaux_metadigitise[12,5]
# froidevaux_epny_dark_mean <- froidevaux_metadigitise[11,5]
# froidevaux_epny_light_se <- froidevaux_metadigitise[12,9]
# froidevaux_epny_dark_se <- froidevaux_metadigitise[11,9]
# froidevaux_epny_light_n <- froidevaux_metadigitise[12,7]
# froidevaux_epny_dark_n <- froidevaux_metadigitise[11,7]
# froidevaux_epny_species <- "Eptesicus_&_Nyctalus_spp"

froidevaux_light_mean <- froidevaux_metadigitise[14,5]
froidevaux_dark_mean <- froidevaux_metadigitise[13,5]
froidevaux_light_se <- froidevaux_metadigitise[14,9]
froidevaux_dark_se <- froidevaux_metadigitise[13,9]
froidevaux_light_n <- froidevaux_metadigitise[14,7]
froidevaux_dark_n <- froidevaux_metadigitise[13,7]


##### Data from Haddock et al. (2019) #####
haddock_metadigitise <- metadigitise_output[17:24, ]
head(haddock_metadigitise)

haddock_light_mean <- haddock_metadigitise[1,5]
haddock_dark_mean <- haddock_metadigitise[2,5]
haddock_light_se <- haddock_metadigitise[1,9]
haddock_dark_se <- haddock_metadigitise[2,9]
haddock_light_n <- haddock_metadigitise[1,7]
haddock_dark_n <- haddock_metadigitise[2,7]

haddock_cgou_light_mean <- haddock_metadigitise[4,5]
haddock_cgou_dark_mean <- haddock_metadigitise[3,5]
haddock_cgou_light_se <- haddock_metadigitise[4,9]
haddock_cgou_dark_se <- haddock_metadigitise[3,9]
haddock_cgou_light_n <- haddock_metadigitise[4,7]
haddock_cgou_dark_n <- haddock_metadigitise[3,7]
haddock_cgou_species <- "Chalinolobus_gouldii"

haddock_orid_light_mean <- haddock_metadigitise[5,5]
haddock_orid_dark_mean <- haddock_metadigitise[6,5]
haddock_orid_light_se <- haddock_metadigitise[5,9]
haddock_orid_dark_se <- haddock_metadigitise[6,9]
haddock_orid_light_n <- haddock_metadigitise[5,7]
haddock_orid_dark_n <- haddock_metadigitise[6,7]
haddock_orid_species <- "Ozimops_ridei"

haddock_vvul_light_mean <- haddock_metadigitise[8,5]
haddock_vvul_dark_mean <- haddock_metadigitise[7,5]
haddock_vvul_light_se <- haddock_metadigitise[8,9]
haddock_vvul_dark_se <- haddock_metadigitise[7,9]
haddock_vvul_light_n <- haddock_metadigitise[8,7]
haddock_vvul_dark_n <- haddock_metadigitise[7,7]
haddock_vvul_species <- "Vespadelus_vulturnus"


##### Data from Rowse et al. (2018) #####
rowse_metadigitise <- metadigitise_output[39:44, ]
head(rowse_metadigitise)

rowse_ppip_light_mean <- rowse_metadigitise[2,5]
rowse_ppip_dark_mean <- rowse_metadigitise[1,5]
rowse_ppip_light_se <- rowse_metadigitise[2,9]
rowse_ppip_dark_se <- rowse_metadigitise[1,9]
rowse_ppip_light_n <- rowse_metadigitise[2,7]
rowse_ppip_dark_n <- rowse_metadigitise[1,7]
rowse_ppip_species <- "Pipistrellus_pipistrellus"

rowse_myot_light_mean <- rowse_metadigitise[4,5]
rowse_myot_dark_mean <- rowse_metadigitise[3,5]
rowse_myot_light_se <- rowse_metadigitise[4,9]
rowse_myot_dark_se <- rowse_metadigitise[3,9]
rowse_myot_light_n <- rowse_metadigitise[4,7]
rowse_myot_dark_n <- rowse_metadigitise[3,7]
rowse_myot_species <- "Myotis_spp"


##### Data from Stone et al. (2009) #####
stone_metadigitise <- metadigitise_output[69:70, ]
head(stone_metadigitise)

stone_rhip_light_mean <- stone_metadigitise[2,5]
stone_rhip_dark_mean <- stone_metadigitise[1,5]
stone_rhip_light_se <- stone_metadigitise[2,9]
stone_rhip_dark_se <- stone_metadigitise[1,9]
stone_rhip_light_n <- stone_metadigitise[2,7]
stone_rhip_dark_n <- stone_metadigitise[1,7]
stone_rhip_species <- "Rhinolophus_hipposideros"


##### Compilation of species data #####

# generate dataframe to contain all of the extracted values from this paper
bat_passes_data <- data.frame(paper_ID = rep(NA, 15), species = rep(NA,15), light_treatment_mean = rep(NA, 15), dark_treatment_mean = rep(NA, 15), light_se = rep(NA,15), dark_se = rep(NA, 15), light_n = rep(NA,15), dark_n = rep(NA, 15))
# Lou et al. (2012)
bat_passes_data[1,1] <- "XLE9CETS"
bat_passes_data[1,2] <- lou_species
bat_passes_data[1,3] <- lou_dark_mean
bat_passes_data[1,4] <- lou_light_mean
bat_passes_data[1,5] <- lou_light_se
bat_passes_data[1,6] <- lou_dark_se
bat_passes_data[1,7] <- lou_light_n
bat_passes_data[1,8] <- lou_dark_n
# Hooker et al. (2012)
bat_passes_data[2,1] <- "4XJZH9V7"
bat_passes_data[2,2] <- hooker_myot_species
bat_passes_data[2,3] <- hooker_myot_light_mean
bat_passes_data[2,4] <- hooker_myot_dark_mean
bat_passes_data[2,5] <- hooker_myot_light_se
bat_passes_data[2,6] <- hooker_myot_dark_se
bat_passes_data[2,7] <- hooker_myot_light_n
bat_passes_data[2,8] <- hooker_myot_dark_n
bat_passes_data[3,1] <- "4XJZH9V7"
bat_passes_data[3,2] <- hooker_ppyg_species
bat_passes_data[3,3] <- hooker_ppyg_light_mean
bat_passes_data[3,4] <- hooker_ppyg_dark_mean
bat_passes_data[3,5] <- hooker_ppyg_light_se
bat_passes_data[3,6] <- hooker_ppyg_dark_se
bat_passes_data[3,7] <- hooker_ppyg_light_n
bat_passes_data[3,8] <- hooker_ppyg_dark_n
bat_passes_data[4,1] <- "4XJZH9V7"
bat_passes_data[4,2] <- hooker_ppip_species
bat_passes_data[4,3] <- hooker_ppip_light_mean
bat_passes_data[4,4] <- hooker_ppip_dark_mean
bat_passes_data[4,5] <- hooker_ppip_light_se
bat_passes_data[4,6] <- hooker_ppip_dark_se
bat_passes_data[4,7] <- hooker_ppip_light_n
bat_passes_data[4,8] <- hooker_ppip_dark_n
# Froidevaux et al. (2018)
bat_passes_data[5,1] <- "HYJXU4SH"
bat_passes_data[5,2] <- froidevaux_rfer_species
bat_passes_data[5,3] <- froidevaux_rfer_light_mean
bat_passes_data[5,4] <- froidevaux_rfer_dark_mean
bat_passes_data[5,5] <- froidevaux_rfer_light_se
bat_passes_data[5,6] <- froidevaux_rfer_dark_se
bat_passes_data[5,7] <- froidevaux_rfer_light_n
bat_passes_data[5,8] <- froidevaux_rfer_dark_n
bat_passes_data[6,1] <- "HYJXU4SH"
bat_passes_data[6,2] <- froidevaux_rhip_species
bat_passes_data[6,3] <- froidevaux_rhip_light_mean
bat_passes_data[6,4] <- froidevaux_rhip_dark_mean
bat_passes_data[6,5] <- froidevaux_rhip_light_se
bat_passes_data[6,6] <- froidevaux_rhip_dark_se
bat_passes_data[6,7] <- froidevaux_rhip_light_n
bat_passes_data[6,8] <- froidevaux_rhip_dark_n
bat_passes_data[7,1] <- "HYJXU4SH"
bat_passes_data[7,2] <- froidevaux_myot_species
bat_passes_data[7,3] <- froidevaux_myot_light_mean
bat_passes_data[7,4] <- froidevaux_myot_dark_mean
bat_passes_data[7,5] <- froidevaux_myot_light_se
bat_passes_data[7,6] <- froidevaux_myot_dark_se
bat_passes_data[7,7] <- froidevaux_myot_light_n
bat_passes_data[7,8] <- froidevaux_myot_dark_n
bat_passes_data[8,1] <- "HYJXU4SH"
bat_passes_data[8,2] <- froidevaux_ppip_species
bat_passes_data[8,3] <- froidevaux_ppip_light_mean
bat_passes_data[8,4] <- froidevaux_ppip_dark_mean
bat_passes_data[8,5] <- froidevaux_ppip_light_se
bat_passes_data[8,6] <- froidevaux_ppip_dark_se
bat_passes_data[8,7] <- froidevaux_ppip_light_n
bat_passes_data[8,8] <- froidevaux_ppip_dark_n
bat_passes_data[9,1] <- "HYJXU4SH"
bat_passes_data[9,2] <- froidevaux_ppyg_species
bat_passes_data[9,3] <- froidevaux_ppyg_light_mean
bat_passes_data[9,4] <- froidevaux_ppyg_dark_mean
bat_passes_data[9,5] <- froidevaux_ppyg_light_se
bat_passes_data[9,6] <- froidevaux_ppyg_dark_se
bat_passes_data[9,7] <- froidevaux_ppyg_light_n
bat_passes_data[9,8] <- froidevaux_ppyg_dark_n
# Haddock et al. 
bat_passes_data[10,1] <- "66FLKFKZ"
bat_passes_data[10,2] <- haddock_cgou_species
bat_passes_data[10,3] <- haddock_cgou_light_mean
bat_passes_data[10,4] <- haddock_cgou_dark_mean
bat_passes_data[10,5] <- haddock_cgou_light_se
bat_passes_data[10,6] <- haddock_cgou_dark_se
bat_passes_data[10,7] <- haddock_cgou_light_n
bat_passes_data[10,8] <- haddock_cgou_dark_n
bat_passes_data[11,1] <- "66FLKFKZ"
bat_passes_data[11,2] <- haddock_orid_species
bat_passes_data[11,3] <- haddock_orid_light_mean
bat_passes_data[11,4] <- haddock_orid_dark_mean
bat_passes_data[11,5] <- haddock_orid_light_se
bat_passes_data[11,6] <- haddock_orid_dark_se
bat_passes_data[11,7] <- haddock_orid_light_n
bat_passes_data[11,8] <- haddock_orid_dark_n
bat_passes_data[12,1] <- "66FLKFKZ"
bat_passes_data[12,2] <- haddock_vvul_species
bat_passes_data[12,3] <- haddock_vvul_light_mean
bat_passes_data[12,4] <- haddock_vvul_dark_mean
bat_passes_data[12,5] <- haddock_vvul_light_se
bat_passes_data[12,6] <- haddock_vvul_dark_se
bat_passes_data[12,7] <- haddock_vvul_light_n
bat_passes_data[12,8] <- haddock_vvul_dark_n
# Rowse et al. (2018)
bat_passes_data[13,1] <- "NSX6JM2N"
bat_passes_data[13,2] <- rowse_ppip_species
bat_passes_data[13,3] <- rowse_ppip_light_mean
bat_passes_data[13,4] <- rowse_ppip_dark_mean
bat_passes_data[13,5] <- rowse_ppip_light_se
bat_passes_data[13,6] <- rowse_ppip_dark_se
bat_passes_data[13,7] <- rowse_ppip_light_n
bat_passes_data[13,8] <- rowse_ppip_dark_n
bat_passes_data[14,1] <- "NSX6JM2N"
bat_passes_data[14,2] <- rowse_myot_species
bat_passes_data[14,3] <- rowse_myot_light_mean
bat_passes_data[14,4] <- rowse_myot_dark_mean
bat_passes_data[14,5] <- rowse_myot_light_se
bat_passes_data[14,6] <- rowse_myot_dark_se
bat_passes_data[14,7] <- rowse_myot_light_n
bat_passes_data[14,8] <- rowse_myot_dark_n
# Stone et al. (2009)
bat_passes_data[15,1] <- "6IHYJZ5N"
bat_passes_data[15,2] <- stone_rhip_species
bat_passes_data[15,3] <- stone_rhip_light_mean
bat_passes_data[15,4] <- stone_rhip_dark_mean
bat_passes_data[15,5] <- stone_rhip_light_se
bat_passes_data[15,6] <- stone_rhip_dark_se
bat_passes_data[15,7] <- stone_rhip_light_n
bat_passes_data[15,8] <- stone_rhip_dark_n
# Check final data set
View(bat_passes_data)
# Then save data to files
write.csv(bat_passes_data, "./activity_levels/data/bat_passes_data.csv", row.names = FALSE)


##### Compilation of overall data #####

# generate dataframe to contain all of the extracted values from this paper
all_bat_passes_data <- data.frame(paper_ID = rep(NA, 3), light_treatment_mean = rep(NA, 3), dark_treatment_mean = rep(NA, 3), light_se = rep(NA,3), dark_se = rep(NA, 3), light_n = rep(NA,3), dark_n = rep(NA, 3))
# Lou et al. (2012)
all_bat_passes_data[1,1] <- "XLE9CETS"
all_bat_passes_data[1,2] <- lou_light_mean
all_bat_passes_data[1,3] <- lou_dark_mean
all_bat_passes_data[1,4] <- lou_light_se
all_bat_passes_data[1,5] <- lou_dark_se
all_bat_passes_data[1,6] <- lou_light_n
all_bat_passes_data[1,7] <- lou_dark_n
# Froidevaux et al. (2018)
all_bat_passes_data[2,1] <- "HYJXU4SH"
all_bat_passes_data[2,2] <- froidevaux_light_mean
all_bat_passes_data[2,3] <- froidevaux_dark_mean
all_bat_passes_data[2,4] <- froidevaux_light_se
all_bat_passes_data[2,5] <- froidevaux_dark_se
all_bat_passes_data[2,6] <- froidevaux_light_n
all_bat_passes_data[2,7] <- froidevaux_dark_n
# Haddock et al. (2019)
all_bat_passes_data[3,1] <- "66FLKFKZ"
all_bat_passes_data[3,2] <- haddock_light_mean
all_bat_passes_data[3,3] <- haddock_dark_mean
all_bat_passes_data[3,4] <- haddock_light_se
all_bat_passes_data[3,5] <- haddock_dark_se
all_bat_passes_data[3,6] <- haddock_light_n
all_bat_passes_data[3,7] <- haddock_dark_n
# View final data set
View(all_bat_passes_data)
# Then save data to files
write.csv(all_bat_passes_data, "./activity_levels/data/all_bat_passes_data.csv", row.names = FALSE)


#### Extraction of other measures ####
rm(list = ls())

metadigitise_output <- read.csv("./activity_levels/figures/ExtractedData.csv")
View(metadigitise_output)


##### Data from Hooker et al. (2012) #####
hooker_metadigitise <- metadigitise_output[25:36, ]
head(hooker_metadigitise)

hooker_myot_light_mean <- hooker_metadigitise[4,5]
hooker_myot_dark_mean <- hooker_metadigitise[3,5]
hooker_myot_light_se <- hooker_metadigitise[4,9]
hooker_myot_dark_se <- hooker_metadigitise[3,9]
hooker_myot_species <- "Myotis_spp"

hooker_ppyg_light_mean <- hooker_metadigitise[8,5]
hooker_ppyg_dark_mean <- hooker_metadigitise[7,5]
hooker_ppyg_light_se <- hooker_metadigitise[8,9]
hooker_ppyg_dark_se <- hooker_metadigitise[7,9]
hooker_ppyg_species <- "Pipistrellus_pygmaeus"

hooker_ppip_light_mean <- hooker_metadigitise[12,5]
hooker_ppip_dark_mean <- hooker_metadigitise[11,5]
hooker_ppip_light_se <- hooker_metadigitise[12,9]
hooker_ppip_dark_se <- hooker_metadigitise[11,9]
hooker_ppip_species <- "Pipistrellus_pipistrellus"


##### Data from Froidevaux et al. (2018) #####
froidevaux_metadigitise <- metadigitise_output[1:16, ]
head(froidevaux_metadigitise)

froidevaux_light_mean <- froidevaux_metadigitise[16,5]
froidevaux_dark_mean <- froidevaux_metadigitise[15,5]
froidevaux_light_se <- froidevaux_metadigitise[16,9]
froidevaux_dark_se <- froidevaux_metadigitise[15,9]


##### Data from Rowse et al. (2018) #####
rowse_metadigitise <- metadigitise_output[39:44, ]
head(rowse_metadigitise)

rowse_light_mean <- rowse_metadigitise[6,5]
rowse_dark_mean <- rowse_metadigitise[5,5]
rowse_light_se <- rowse_metadigitise[6,9]
rowse_dark_se <- rowse_metadigitise[5,9]


##### Compilation of species data ####

# generate dataframe to contain all of the extracted values from this paper
bat_buzzes_data <- data.frame(paper_ID = rep(NA, 3), species = rep(NA,3), light_treatment_mean = rep(NA, 3), dark_treatment_mean = rep(NA, 3), light_se = rep(NA,3), dark_se = rep(NA,3))
# Hooker et al. (2012)
bat_buzzes_data[1,1] <- "4XJZH9V7"
bat_buzzes_data[1,2] <- hooker_myot_species
bat_buzzes_data[1,3] <- hooker_myot_light_mean
bat_buzzes_data[1,4] <- hooker_myot_dark_mean
bat_buzzes_data[1,5] <- hooker_myot_light_se
bat_buzzes_data[1,6] <- hooker_myot_dark_se
bat_buzzes_data[2,1] <- "4XJZH9V7"
bat_buzzes_data[2,2] <- hooker_ppyg_species
bat_buzzes_data[2,3] <- hooker_ppyg_light_mean
bat_buzzes_data[2,4] <- hooker_ppyg_dark_mean
bat_buzzes_data[2,5] <- hooker_ppyg_light_se
bat_buzzes_data[2,6] <- hooker_ppyg_dark_se
bat_buzzes_data[3,1] <- "4XJZH9V7"
bat_buzzes_data[3,2] <- hooker_ppip_species
bat_buzzes_data[3,3] <- hooker_ppip_light_mean
bat_buzzes_data[3,4] <- hooker_ppip_dark_mean
bat_buzzes_data[3,5] <- hooker_ppip_light_se
bat_buzzes_data[3,6] <- hooker_ppip_dark_se
# Check dataframe
head(bat_buzzes_data)
# Then save data to files
write.csv(bat_buzzes_data, "./activity_levels/data/bat_buzzes_data.csv", row.names = FALSE)


##### Compilation of overall data #####

# generate dataframe to contain all of the extracted values from this paper
all_bat_buzzes_data <- data.frame(paper_ID = rep(NA, 2), light_treatment_mean = rep(NA, 2), dark_treatment_mean = rep(NA, 2), light_se = rep(NA,2), dark_se = rep(NA, 2))
# Froidevaux et al. (2018)
all_bat_buzzes_data[1,1] <- "HYJXU4SH"
all_bat_buzzes_data[1,2] <- froidevaux_light_mean
all_bat_buzzes_data[1,3] <- froidevaux_dark_mean
all_bat_buzzes_data[1,4] <- froidevaux_light_se
all_bat_buzzes_data[1,5] <- froidevaux_dark_se
# Rowse et al. (2018)
all_bat_buzzes_data[2,1] <- "NSX6JM2N"
all_bat_buzzes_data[2,2] <- rowse_light_mean
all_bat_buzzes_data[2,3] <- rowse_dark_mean
all_bat_buzzes_data[2,4] <- rowse_light_se
all_bat_buzzes_data[2,5] <- rowse_dark_se
# Check dataframe
View(all_bat_buzzes_data)
# Then save data to files
write.csv(all_bat_buzzes_data, "./activity_levels/data/all_bat_buzzes_data.csv", row.names = FALSE)

