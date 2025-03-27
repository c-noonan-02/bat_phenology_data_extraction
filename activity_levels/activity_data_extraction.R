# clear environment
rm(list = ls())

# import required packages
library(dplyr)
library(shinyDigitise)

#### Shiny Digitise ####

# code for shiny digitise
figures_data <- shinyDigitise(dir = normalizePath("./activity_levels/figures"))
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
lou_species <- "Rhinolophus_hipposiderus"


##### Data from Hooker et al. (2012) #####
hooker_metadigitise <- metadigitise_output[25:36, ]
View(hooker_metadigitise)

hooker_myot_light_mean <- hooker_metadigitise[2,5]
hooker_myot_dark_mean <- hooker_metadigitise[1,5]
hooker_myot_light_se <- hooker_metadigitise[2,9]
hooker_myot_dark_se <- hooker_metadigitise[1,9]
hooker_myot_species <- "Myotis_spp"

hooker_ppyg_light_mean <- hooker_metadigitise[6,5]
hooker_ppyg_dark_mean <- hooker_metadigitise[5,5]
hooker_ppyg_light_se <- hooker_metadigitise[6,9]
hooker_ppyg_dark_se <- hooker_metadigitise[5,9]
hooker_ppyg_species <- "Pipistrellus_pygmaeus"

hooker_ppip_light_mean <- hooker_metadigitise[10,5]
hooker_ppip_dark_mean <- hooker_metadigitise[9,5]
hooker_ppip_light_se <- hooker_metadigitise[10,9]
hooker_ppip_dark_se <- hooker_metadigitise[9,9]
hooker_ppip_species <- "Pipistrellus_pipistrellus"


##### Data from Froidevaux et al. (2018) #####
froidevaux_metadigitise <- metadigitise_output[1:16, ]
View(froidevaux_metadigitise)

froidevaux_rfer_light_mean <- froidevaux_metadigitise[2,5]
froidevaux_rfer_dark_mean <- froidevaux_metadigitise[1,5]
froidevaux_rfer_light_se <- froidevaux_metadigitise[2,9]
froidevaux_rfer_dark_se <- froidevaux_metadigitise[1,9]
froidevaux_rfer_species <- "Rhinolophus_ferrumequinum"

froidevaux_rhip_light_mean <- froidevaux_metadigitise[4,5]
froidevaux_rhip_dark_mean <- froidevaux_metadigitise[3,5]
froidevaux_rhip_light_se <- froidevaux_metadigitise[4,9]
froidevaux_rhip_dark_se <- froidevaux_metadigitise[3,9]
froidevaux_rhip_species <- "Rhinolophus_hipposideros"

froidevaux_myot_light_mean <- froidevaux_metadigitise[6,5]
froidevaux_myot_dark_mean <- froidevaux_metadigitise[5,5]
froidevaux_myot_light_se <- froidevaux_metadigitise[6,9]
froidevaux_myot_dark_se <- froidevaux_metadigitise[5,9]
froidevaux_myot_species <- "Myotis_spp"

froidevaux_ppip_light_mean <- froidevaux_metadigitise[8,5]
froidevaux_ppip_dark_mean <- froidevaux_metadigitise[7,5]
froidevaux_ppip_light_se <- froidevaux_metadigitise[8,9]
froidevaux_ppip_dark_se <- froidevaux_metadigitise[7,9]
froidevaux_ppip_species <- "Pipistrellus_pipistrellus"

froidevaux_ppyg_light_mean <- froidevaux_metadigitise[10,5]
froidevaux_ppyg_dark_mean <- froidevaux_metadigitise[9,5]
froidevaux_ppyg_light_se <- froidevaux_metadigitise[10,9]
froidevaux_ppyg_dark_se <- froidevaux_metadigitise[9,9]
froidevaux_ppyg_species <- "Pipistrellus_pygmaeus"

# froidevaux_epny_light_mean <- froidevaux_metadigitise[12,5]
# froidevaux_epny_dark_mean <- froidevaux_metadigitise[11,5]
# froidevaux_epny_light_se <- froidevaux_metadigitise[12,9]
# froidevaux_epny_dark_se <- froidevaux_metadigitise[11,9]
# froidevaux_epny_species <- "Eptesicus_&_Nyctalus_spp"

froidevaux_light_mean <- froidevaux_metadigitise[14,5]
froidevaux_dark_mean <- froidevaux_metadigitise[13,5]
froidevaux_light_se <- froidevaux_metadigitise[14,9]
froidevaux_dark_se <- froidevaux_metadigitise[13,9]


##### Data from Haddock et al. (2019) #####
haddock_metadigitise <- metadigitise_output[17:24, ]
View(haddock_metadigitise)

haddock_light_mean <- haddock_metadigitise[1,5]
haddock_dark_mean <- haddock_metadigitise[2,5]
haddock_light_se <- haddock_metadigitise[1,9]
haddock_dark_se <- haddock_metadigitise[2,9]

haddock_cgou_light_mean <- haddock_metadigitise[4,5]
haddock_cgou_dark_mean <- haddock_metadigitise[3,5]
haddock_cgou_light_se <- haddock_metadigitise[4,9]
haddock_cgou_dark_se <- haddock_metadigitise[3,9]
haddock_cgou_species <- "Chalinolobus_gouldii"

haddock_orid_light_mean <- haddock_metadigitise[5,5]
haddock_orid_dark_mean <- haddock_metadigitise[6,5]
haddock_orid_light_se <- haddock_metadigitise[5,9]
haddock_orid_dark_se <- haddock_metadigitise[6,9]
haddock_orid_species <- "Ozimops_ridei"

haddock_vvul_light_mean <- haddock_metadigitise[8,5]
haddock_vvul_dark_mean <- haddock_metadigitise[7,5]
haddock_vvul_light_se <- haddock_metadigitise[8,9]
haddock_vvul_dark_se <- haddock_metadigitise[7,9]
haddock_vvul_species <- "Vespadelus_vulturnus"


##### Data from Rowse et al. (2018) #####
rowse_metadigitise <- metadigitise_output[39:44, ]
View(rowse_metadigitise)

rowse_ppip_light_mean <- rowse_metadigitise[2,5]
rowse_ppip_dark_mean <- rowse_metadigitise[1,5]
rowse_ppip_light_se <- rowse_metadigitise[2,9]
rowse_ppip_dark_se <- rowse_metadigitise[1,9]
rowse_ppip_species <- "Pipistrellus_pipistrellus"

rowse_myot_light_mean <- rowse_metadigitise[4,5]
rowse_myot_dark_mean <- rowse_metadigitise[3,5]
rowse_myot_light_se <- rowse_metadigitise[4,9]
rowse_myot_dark_se <- rowse_metadigitise[3,9]
rowse_myot_species <- "Myotis_spp"


##### Data from Stone et al. (2009) #####
stone_metadigitise <- metadigitise_output[69:70, ]
View(stone_metadigitise)

stone_rhip_light_mean <- stone_metadigitise[2,5]
stone_rhip_dark_mean <- stone_metadigitise[1,5]
stone_rhip_light_se <- stone_metadigitise[2,9]
stone_rhip_dark_se <- stone_metadigitise[1,9]
stone_rhip_species <- "Rhinolophus_hipposideros"


##### Compilation of species data ####

# generate dataframe to contain all of the extracted values from this paper
bat_passes_data <- data.frame(paper_ID = rep(NA, 20), species = rep(NA,20), light_treatment_mean = rep(NA, 20), dark_treatment_mean = rep(NA, 20), light_se = rep(NA,20), dark_se = rep(NA, 20))
# Hooker et al. (2012)
bat_passes_data[1,1] <- "4XJZH9V7"
bat_passes_data[1,2] <- hooker_myot_species
bat_passes_data[1,3] <- hooker_myot_light_mean
bat_passes_data[1,4] <- hooker_myot_dark_mean
bat_passes_data[1,5] <- hooker_myot_light_se
bat_passes_data[1,6] <- hooker_myot_dark_se
bat_passes_data[2,1] <- "4XJZH9V7"
bat_passes_data[2,2] <- hooker_ppyg_species
bat_passes_data[2,3] <- hooker_ppyg_light_mean
bat_passes_data[2,4] <- hooker_ppyg_dark_mean
bat_passes_data[2,5] <- hooker_ppyg_light_se
bat_passes_data[2,6] <- hooker_ppyg_dark_se
bat_passes_data[3,1] <- "4XJZH9V7"
bat_passes_data[3,2] <- hooker_ppip_species
bat_passes_data[3,3] <- hooker_ppip_light_mean
bat_passes_data[3,4] <- hooker_ppip_dark_mean
bat_passes_data[3,5] <- hooker_ppip_light_se
bat_passes_data[3,6] <- hooker_ppip_dark_se

View(bat_passes_data)


##### Compilation of overall data #####



#### Extraction of other measures ####
rm(list = ls())

metadigitise_output <- read.csv("./activity_levels/figures/ExtractedData.csv")
View(metadigitise_output)


##### Data from Russo et al. (2019) #####

# a


##### Data from Froidevaux et al. (2018) #####
froidevaux_metadigitise <- metadigitise_output[1:16, ]
View(froidevaux_metadigitise)

froidevaux_light_mean <- froidevaux_metadigitise[16,5]
froidevaux_dark_mean <- froidevaux_metadigitise[15,5]
froidevaux_light_se <- froidevaux_metadigitise[16,9]
froidevaux_dark_se <- froidevaux_metadigitise[15,9]


##### Data from Rowse et al. (2018) #####
rowse_metadigitise <- metadigitise_output[39:44, ]
View(rowse_metadigitise)

rowse_light_mean <- rowse_metadigitise[6,5]
rowse_dark_mean <- rowse_metadigitise[5,5]
rowse_light_se <- rowse_metadigitise[6,9]
rowse_dark_se <- rowse_metadigitise[5,9]