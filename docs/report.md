### CLASS EXERCISE #1

#### Introduction

The starting point of this research has to be found in the *classic Median voter's theorem* and in a recent contribution given by Abou-Chadi and Orlowski. Them both are theories which state the political parties's tendency at positioning themselves close to the center, but differ among themseleves because they refer to different political system: the former refer to the majority rule voting system and the second to the competitive one. 
Starting from these analyses, this research aims to inquire whether or not the centrist political parties are more successful than others. 
To answer this question we drawed two hypotheses: 
 - The first hypothesis is that the success of central parties depends on the cultural and historical context of each country;
 - The second hypothesis is that there is no correlation between an high share of votes and the political position, due to the variability of the factors that can influence this relationship and to the differences among the meaning of the "left-right" dimension in each country.
 
 #### Methods 
 ##### Pre-processing phase 
 To study this relationship we used the **ParlGov parties' dataset**, which contains significant and useful variables to achieve our goals. *Originally*, the dataset was composed by:
 
 - *16 variables*: some were unnecessary for our scope and for this reason we ***selected*** only **6** of them. The selected variables on which our resarch is drawn are: 
     - **"Country_name"**: which identifies the countries;
     - **"Election_date"**: which identifies the date of the elections to which data refers;
     - **"Vote_share"**: which identifies the party's share of votes for each election;
     - **"Left_right"**: which identifies the party's political position in a scale that goes from 0 to 10 where lower values represent the left-wing and higher values represent the right-wing;
     - **"Election_type"**: which distinguish between national and european parliamentary elections;
     - **"Party_name"**: which identifies the different parties for each election in each country. We didn't use this variable directly in the statistic analysis but it was significant for us to understand how the political system of each country was composed and the total number of parties in the elections. This way, we avoided to interpret results without considering the particular context of each country.  
     
 - *8550 observations*. From this total we selected a sample ***filtering*** the observations of three variables: 
    - the variable "Country_name": in this case filtering means that we selected the observations of only *four countries*. The selected countries are **Italy** and **Germany**, as representatives of Europe, and **Australia** and **Japan**, as international countries;
    - the variable "Election_type": we selected only the **national elections** in order to avoid overlaps of date and also to compare european and non-european countries; 
    - the variable "Election_date": we selected all the elections that happened **from 1960s until 2018**, in order to display the *variation of pattern in the studied relationship between the share of votes and the political position over time*. 

Moreover, we ***recoded*** the variable "Left_right" in order to transform it from an interval to a categorical variable with three categories: "left", "center" and "right". This way, we created the variable **Political_pos** thanks to which the visualization in the plot would be more intuitive and direct.

##### Analysis 
The analysis was conducted in *two different levels*:
1. The first level is the most intuitive. Using *ggplot* we drafted a plot that displays:
    - the difference in vote share for each political position (left; right; center);
    - how it changed over time. 
The plot is created for each country and allows us to compare them. This way, it is possible to test our first hypothesis that states the importance of the historical and cultural context of each country in determining which political position is more successful; 
2. The second level is more technical: it aims to show the correlation between the variables "Vote_share" and "Left_right".
   - We used the variable "Left_right" insted of "Political_pos" because it allows us to look at the results in a more precise way; 
   - Also in this case we chose plot to present our results, considering it the best way to do that. We created six graphs that:
       - Refer to different temporal periods: "60's", "70's", "80's", "90's", "2000's", "2010's";
       - display how the correlation varies during the years;
       - Contain the values of all the countries but with different colors.
       

#### Results 
To put our two hypothesis to the test we decided to select four countries, that are Italy, Germany, Australia and Japan, and check for a correlation between the political position of the parties and their share of votes; We then compared the variation of political parties' share of votes in each country according to their political position.
  
![Figure 1](/docs/fig_1.png)                         

![Figure 2](/docs/fig_2.png)

![Figure 3](/docs/fig_3.png)

![Figure 4](/docs/fig_4.png)

![Figure 5](/docs/fig_5.png) 

![Figure 6](/docs/fig_6.png)

At first glance we can see that, as we expected in our first hypothesis, there's not a clear association between the political position of parties and the share of votes gained over time. In fact, we should consider all the aspects that influence the results of the elections and the context in which they are held. But still, we might want to look for the variation of the vote share over time in the countries we selected, according to the political positions.
  
  ##### Percentages of votes for political position in each country over time

![Figure 7](/docs/Figure_1.png)

The first thing that we can see from the graph in Figure 7 is that there are differences both among countries and over time. In Australia and Germany, for example, there are strong center parties that gained almost 40%, in same cases, and that held their position over time. On the contrary, in Japan, the center gained very low percentages of votes until the 2000's as opposite from Italy where the center had a strong consensus until the 90's. Moreover we can see that, in each country, the difference among each political alignment varies. In Australia for example, the main parties belong to the center and the right-wing. Whereas in Germany the center has highest scores. In Japan the right-wing has almost every time the highest values and there's an evolution of the center scores. Italy's political system changed after 1992 and, as we can see from the graph, that's when both the right-wing and the left- wing became more competitive. 


