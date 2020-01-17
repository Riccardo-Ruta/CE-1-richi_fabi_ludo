#Import data
library(readr)
view_election <- read_csv("data/original_data/view_election.csv")
View(view_election)

#Select variables
library(tidyverse)
election00 <- select(view_election, country_name, election_date, vote_share, left_right)
view(election00)

#Filter variable country 

election01 <- filter(
  election00, 
  country_name %in% c("Italy", "Germany", "France", "Canada", "Australia", "Japan")) 
view(election01)


#Recode variable political position

view_election02 <- mutate(
  view_election01, 
  political_pos = ifelse(view_election01$left_right <= 3.3333, "left",
                   ifelse(view_election01$left_right <= 6.6666, "center",
                          "right")))
view(view_election02)

#drop missing values 
election03 <- na.omit(election02)
dim(election03)

apply(election03, 2, function(x) sum(is.na(x)))

view(election03)


# Prova grafico Italia da sistemare
election03 %>%
  filter(country_name == "Italy") %>%
  ggplot(election03, mapping = aes(x = election_date, y = vote_share, fill = as.factor(political_pos))) +
  geom_bar(stat="identity", fill="#f68060", size = 0.1, width =100) + 
  scale_y_continuous(labels = scales::percent) +
  ylab("Share vote") +
  xlab("year") +
  theme_bw() +
  theme(legend.position = "bottom")





