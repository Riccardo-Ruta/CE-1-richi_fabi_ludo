library(readr)
view_election <- read_csv("data/original_data/view_election.csv")
View(view_election)

library(tidyverse)
view_election00 <- select(view_election, country_name, election_date, vote_share, left_right)
view(view_election00)
