#Import data
library(readr)
view_election <- read_csv("data/original_data/view_election.csv")
View(view_election)

#Select variables
library(tidyverse)
election00 <- select(view_election, country_name, election_date, vote_share, left_right, election_type, party_name)
view(election00)

#Filter variable country and variable election_type
election01 <- filter(
  election00, 
  country_name %in% c("Italy", "Germany", "Australia", "Japan"),
  election_type == "parliament") 

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

#Filter election date 
election04 <- filter(election03,
                     election_date > "1961-12-09")


#Graph bar election_dateXvote_shareXpolitical_pos for each country
ggplot(election04, mapping = aes(x = election_date, y = vote_share, fill = political_pos)) +
geom_bar(stat="identity", size = 5, width =600, position = "dodge") + 
facet_wrap(~country_name)
scale_fill_manual(values = c("darkgreen", "grey50", "steelblue")) +
scale_y_continuous() +
ylab("Percentage of share vote") +
xlab("year") +
theme_bw() +
theme(legend.position = "bottom")

#correlazione con la mean di vote_share
election04 %>% 

  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "prova") +
  theme_bw() 

#VOTE_SHARE