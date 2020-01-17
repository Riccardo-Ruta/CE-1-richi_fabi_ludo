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


#Recode variable political position
view_election02 <- mutate(
  view_election01, 
  political_pos = ifelse(view_election01$left_right <= 3.3333, "left",
                   ifelse(view_election01$left_right <= 6.6666, "center",
                          "right")))
view(view_election02)

#drop missing values 
view_election03 <- na.omit(view_election02)
dim(view_election03)

apply(view_election03, 2, function(x) sum(is.na(x)))

view(view_election03)


