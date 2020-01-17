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
                          "right"))
)
view(view_election02)

#drop missing values 
view_election03 <- na.omit(view_election02)
dim(view_election03)

apply(view_election03, 2, function(x) sum(is.na(x)))

view(view_election03)


view_election3 <- mutate(political_pos = factor(political_pos, levels = c ("Left", "Center", "Right")))


# Prova grafico Italia da sistemare
election03 %>%
  filter(country_name == "Italy") %>%
  ggplot(election03, mapping = aes(x = election_date, y = vote_share, fill = political_pos)) +
  geom_bar(stat = "identity", position = "dodge", col = "black") + 
  scale_fill_manual(values = c("gray20", "gray50", "gray80"), 
                    "Political position") +
  scale_y_continuous(labels = scales::percent) +
  ylab("Share vote") +
  xlab("year") +
  theme_bw() +
  theme(legend.position = "bottom")








