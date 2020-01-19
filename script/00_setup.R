#data access  CE_01
#richi_fabi_ludo
#2th tremester

# Installing packages ---------------------------------------------------------------------------------

want <- c("here","readr","tidyverse", "rio")  # list of required packages
have <- want %in% rownames(installed.packages())
if ( any(!have) ) { install.packages( want[!have] ) }
rm(have, want)

library("rio")
library("tidyverse")
library("readr")
library("here")
