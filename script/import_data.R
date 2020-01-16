#Import data
library(readr)
view_election <- read_csv("data/original_data/view_election.csv")
View(view_election)

#Select variables
library(tidyverse)
view_election00 <- select(view_election, country_name, election_date, vote_share, left_right)
view(view_election00)

#Filter variable country 

view_election01 <- filter(
  view_election00, 
  country_name %in% c("Italy", "Germany", "France", "Canada", "Australia", "Japan")) 
view(view_election01)

