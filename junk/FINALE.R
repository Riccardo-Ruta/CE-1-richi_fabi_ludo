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
  facet_wrap(~country_name) +
  scale_fill_manual(values = c("darkmagenta", "darkolivegreen3", "steelblue"),
                    "Political positions") +
  scale_y_continuous() +
  ylab("Percentage of vote share") +
  xlab("Years") +
  theme_bw() +
  theme(legend.position = "bottom")


view(view_election)

#VOTE_SHAREXLEFT_RIGHT: 60's
election04 %>% 
  filter(election_date > "1963-04-28", 
         election_date <= "1969-12-27") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Political position", y="Percentage of vote share", title = "Correlation between vote share and political position in the 60's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 70's 
election04 %>% 
  filter(election_date > "1972-05-07", 
         election_date <= "1979-10-07") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Political position", y="Percentage of vote share", title = "Correlation between vote share and political position in the 70's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 80's
election04 %>% 
  filter(election_date > "1980-06-22", 
         election_date <= "1987-07-11") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Political position", y="Percentage of vote share", title = "Correlation between vote share and political position in the 80's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 90's 
election04 %>% 
  filter(election_date > "1990-02-18", 
         election_date <= "1998-10-03") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Political position", y="Percentage of vote share", title = "Correlation between vote share and political position in the 90's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 2000's
election04 %>% 
  filter(election_date > "2000-06-25", 
         election_date <= "2009-09-27") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Political position", y="Percentage of vote share", title = "Correlation between vote share and political position in the 2000's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 2010's
election04 %>% 
  filter(election_date > "2010-08-21", 
         election_date <= "2018-03-04") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Political position", y="Percentage of vote share", title = "Correlation between vote share and political position in the 2010's") +
  theme_bw() 
