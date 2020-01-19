#data access  CE_01
#richi_fabi_ludo
#2th tremester

# Source setup scripts:-------------------------------------------------------------------
source(here::here("script","00_setup.R"))

#load dataset--------------------------------------------------------------------------------

election04 <- import(here::here("data/recoded_data", "election04.Rdata"))

#Graph bar election_dateXvote_shareXpolitical_pos for each country-------------------------------
ggplot(election04, mapping = aes(x = election_date, y = vote_share, fill = political_pos)) +
  geom_bar(stat="identity", size = 5, width =600, position = "dodge") + 
  facet_wrap(~country_name)
scale_fill_manual(values = c("darkgreen", "grey50", "steelblue")) +
  scale_y_continuous() +
  ylab("Percentage of share vote") +
  xlab("year") +
  theme_bw() +
  theme(legend.position = "bottom")

#correlazione con la mean di vote_share-------------------------------------------------------
election04 %>% 
  group_by(left_right, country_name) %>%
  summarize(vote_share=mean(vote_share)) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "prova") +
  theme_bw() 



#VOTE_SHAREXLEFT_RIGHT: 60's------------------------------------------------------------------------
election04 %>% 
  filter(election_date > "1963-04-28", 
         election_date <= "1969-12-27") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "Correlation between vote share and political position in the 60's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 70's -----------------------------------------------------------------------
election04 %>% 
  filter(election_date > "1972-05-07", 
         election_date <= "1979-10-07") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "Correlation between vote share and political position in the 70's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 80's-----------------------------------------------------------------------------
election04 %>% 
  filter(election_date > "1980-06-22", 
         election_date <= "1987-07-11") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "Correlation between vote share and political position in the 80's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 90's -------------------------------------------------------------------------------------
election04 %>% 
  filter(election_date > "1990-02-18", 
         election_date <= "1998-10-03") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "Correlation between vote share and political position in the 90's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 2000's-----------------------------------------------------------------------------------
election04 %>% 
  filter(election_date > "2000-06-25", 
         election_date <= "2009-09-27") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "Correlation between vote share and political position in the 2000's") +
  theme_bw() 

#VOTE_SHARExLEFT_RIGHT: 2010's----------------------------------------------------------------------------------------
election04 %>% 
  filter(election_date > "2010-08-21", 
         election_date <= "2018-03-04") %>%
  group_by(left_right, country_name) %>%
  ggplot(., aes(y=vote_share, x=left_right, group=factor(country_name))) +
  geom_point(aes(col=factor(country_name))) +
  labs(x="Left_right", y="Vote_share", title = "Correlation between vote share and political position in the 2010's") +
  theme_bw() 