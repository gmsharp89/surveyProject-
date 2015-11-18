## survey project in R

# install and load library
# install.packages("dplyr")
# install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# download a file
download.file("http://files.figshare.com/2236372/combined.csv",  "data/portal_data_joined.csv")

# import file
surveys <- read.csv('data/portal_data_joined.csv')

## explore distribution of weight for each species
summary(surveys)


## figure 1 exploring the relationship between hindfoot_length and weight in species DM?

# data parsing
surveys_complete <- surveys %>% filter(species_id == "DM") %>% filter(!is.na(weight)) %>% filter(!is.na(hindfoot_length))

# build figure
ggplot(data = surveys_complete, aes(x = hindfoot_length, y = weight)) + geom_point()

## figure 2 comparing hinfoot_length between males and females in species DM.

# data parsing 
surveys_complete <- surveys %>% filter(species_id == "DM") %>% group_by(sex) %>% filter(!is.na(sex)) %>% filter(!is.na(hindfoot_length))

# build figure 
ggplot(surveys_complete, aes(x = sex, y = hindfoot_length, fill=sex)) + geom_boxplot()

## figure 3 exploring the distribution of average weight among species 

# data parsing 
surveys_complete <- surveys %>% filter(!is.na(weight)) %>% filter(!is.na(species))

# build figure
ggplot(data = surveys_complete, aes( x=weight)) + geom_histogram(binwidth=.5)


## look at composition of data in sampling

## explore comparisons between variables

# export figure 



