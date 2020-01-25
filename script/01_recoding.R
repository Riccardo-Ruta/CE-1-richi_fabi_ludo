#data access  CE_01
#richi_fabi_ludo
#2th tremester

# Source setup scripts:
source(here::here("script","00_setup.R"))

# Folder structure:
# - CE-1-richi_fabi_ludo/ 
# |------ script/
# |------ data/
# |------ docs/ 
# |------ junk/

# Working directory from .Rproj
here::here("")

# Importing data ---------------------------------------------------------------------------------------------

view_election <- read_csv("data/original_data/view_election.csv")

# Selecting variables----------------------------------------------------------------------------------------------
election00 <- select(view_election, country_name, election_date, vote_share, left_right, election_type, party_name)

##Filter variable country and variable election_type---------------------------------------------------------------
election01 <- filter(
  election00, 
  country_name %in% c("Italy", "Germany", "Australia", "Japan"),
  election_type == "parliament") 


#Recode variable political position-----------------------------------------------------------------------------
election02 <- mutate(
  election01, 
  political_pos = ifelse(election01$left_right <= 3.3333, "left",
                         ifelse(election01$left_right <= 6.6666, "center",
                                "right"))
)


#drop missing values-------------------------------------------------------------------------------
election03 <- na.omit(election02)
dim(election03)

apply(election03, 2, function(x) sum(is.na(x)))

#Filter election date----------------------------------------------------------------------------
election04 <- filter(election03,
                     election_date > "1961-12-09")

# exporting recoded data-------------------------------------------------------------------
save(election04,file="data/recoded_data/election04.Rdata")
