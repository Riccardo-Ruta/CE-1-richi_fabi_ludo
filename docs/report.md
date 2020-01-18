### CLASS EXERCISE #1

#### Introduction

The starting point of this research has to be found in the *classic Median voter's theorem* and in a recent contribution given by Abou-Chadi and Orlowski. Them both are theories which state the political parties's tendency at positioning themselves close to the center, but differ among themseleves because they refer to different political system: the former refer to the majority rule voting system and the second to the competitive one. 
Starting from these analyses, this research aims to inquire whether or not the centrist political parties are more successful than others. 
To answer this question we drawed two hypotheses: 
 - The first hypothesis is that the success of central parties depends on the cultural and historical context;
 - The second hypothesis is that there is not correlation between an high share vote and the political position, due to the variability of the factors that can influence this relationship.
 
 #### Methods 
 ##### Pre-processing phase 
 To study this relationship we used the **ParlGov parties' dataset**, which contains significant and useful variables to achieve our goals. *Originally*, the dataset was composed by:
 
 - *16 variables*: some were unnecessary in relation to our scope and for this reason we ***selected*** only **6** of them. The selected variables on which our resarch is drawn are: 
     - **"Country_name"**: which identifies the countries;
     - **"Election_date"**: which identifies the date of elections to which data refer;
     - **"Vote_share"**: which identifies the party's share for each election;
     - **"Left_right"**: which identifies the party's political position in a scale that goes from 0 to 10 where 0 the lower values are represent the left and the higher values represent the right;
     - **"Election_type"**: which distinguish between national and european parliamentary elections;
     - **"Party_name"**: which identifies the different parties for each election in each country. We didn't use this variable directly in the statistic analysis but it was significant for us to understand how the political system of each country was composed and the total number of parties in the elections. This way, we avoided to interpret results without considering the particular context of each country.  
     
 - *8550 observations*. From this total we selected a sample ***filtering*** the observations of three variables: 
    - the variable "Country_name": in this case filtering means that we selected the observation of only *four countries*. The selected countries are **Italy** and **Germany**, as representatives of Europe, and **Australia** and **Japan**, as international countries;
    - the variable "Election_type": we selected only the **national elections** in order to avoid overlaps of date; 
    - the variable "Election_date": we selected all the elections that happened **from 1960s until 2018**, in order to display the *variation of pattern in the studied relationship between the share vote and the political position during the years*. 

Moreover, we ***recoded*** the variable "Left_right" in order to transform it from an interval to a categorical variable with three categories: "left", "center" and "right". This way, we created the variable **Political_pos** thanks to which the visualization in the plot would be more intuitive and direct.

##### Analysis 
The analysis was conducted in *two different levels*:
1. The first level is the more intuitive. Using *ggplot* we drafted a plot that displays:
    - the difference in vote share for each political position (left; right; center);
    - how it changed during the years. 
The plot is created for each country and allows to compare the political situation of them. This way, it is possible to test our first hypothesis that states the importance of the historical and cultural context of each country in determining which political position is more successful; 
2. The second level is more technical: it aims to show the correlation between the variables "Vote_share" and "Left_right".
   - We used the variable "Left_right" insted of "Political_pos" because it allows to look at the results in a more precise way; 
   - Also in this case we choose plot to present our results, considering it the best way to do that. We created six graphs that:
       - Refer to different temporal periods: "60's", "70's", "80's", "90's", "2000's", "2010's";
       - display how the correlation varies during the years;
       - Contain the values of all the countries but they are differentiated among them through the colors.
       

#### Results 
