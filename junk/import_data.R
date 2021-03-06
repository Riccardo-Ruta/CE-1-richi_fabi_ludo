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
election02 <- mutate(
  election01, 
  political_pos = ifelse(election01$left_right <= 3.3333, "left",
                         ifelse(election01$left_right <= 6.6666, "center",
                                "right"))
)
view(election02)

#drop missing values 
election03 <- na.omit(election02)
dim(election03)

apply(election03, 2, function(x) sum(is.na(x)))

view(election03)

#filter election date 
election04 <- filter(election03,
                     election_date > "1961-12-09")

election04$election_date <- as.Date(election04$election_date)

library(lubridate)
as_date(0)


# Prova grafico Italia da sistemare
election03 %>%
  filter(country_name == "Italy") %>%
  ggplot(election03, mapping = aes(x = election_date, y = vote_share, fill = political_pos)) +
  geom_bar(stat="identity", size = 5, width =1200, position = "dodge") + 
  scale_fill_manual(values = c("yellow", "pink", "red")) +
  scale_y_continuous(labels = scales::percent) +
  scale_x_continuous(breaks = seq (1940, 2019, by = 20))
  ylab("Share vote") +
  xlab("year") +
  theme_bw() +
  theme(legend.position = "bottom")


#prova grafico 2 che funziona
election03 %>%
  filter(country_name == "Italy") %>%
  ggplot(election03, mapping = aes(x = election_date, y = vote_share, fill = political_pos)) +
  geom_bar(stat = "identity", width = 500, size = 10, position = "stack") + 
  scale_fill_manual(values = c("green", "red", "blue"), 
                    "Political position") +
  scale_y_continuous(labels = scales::percent) +
  ylab("Share vote") +
  xlab("year") +
  theme_bw() +
  theme(legend.position = "bottom")

#ALTRO GRAFICO
election04 %>%
  filter(country_name == "Italy") %>%
  ggplot(election04, mapping = aes(x = election_date, y = vote_share, fill = political_pos)) +
  geom_bar(stat="identity", size = 5, width =350, position = "dodge") + 
  scale_fill_manual(values = c("red", "grey50", "grey80")) +
  scale_y_continuous() +
  scale_x_continuous(breaks = seq(1960, 2019, by = 10)) +
  ylab("Percentage of share vote") +
  xlab("year") +
  theme_bw() +
  theme(legend.position = "bottom")


??origin

