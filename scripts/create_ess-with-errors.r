# Prep dataset with errors 
library(readr)
library(tidyverse)
library(dplyr)
library(tidyr)
library(stringr)

ess2018 <- read_csv("https://github.com/CALDISS-AAU/workshop_R-intro/raw/master/data/ESS2018DK_subset.csv")

ess2018e <- ess2018 %>%
    mutate(grspnum = replace_na(grspnum, 9999999),
          frlgrsp = replace_na(frlgrsp, 9999999),
          ppltrst = as.character(ppltrst),
          netustm = as.character(netustm),
          inwtm = as.character(inwtm)) %>%
    mutate(ppltrst = case_when(
        ppltrst == "0" ~ "You can't be too careful",
        ppltrst == "10" ~ "Most people can be trusted",
        TRUE ~ ppltrst),
          netustm = paste0(netustm, ",0"),
          inwtm = paste0(inwtm, ",0"))

write_delim(ess2018e, "../data/ESS2918DK_subset_with-errors.csv", delim = ";")