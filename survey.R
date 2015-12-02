## survey project in R

# install and load library
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# download a file
download.file("http://files.figshare.com/2236372/combined.csv",  "data/portal_data_joined.csv")

# import file
surveys <- read.csv('data/portal_data_joined.csv')


## figure 1 the relationship between the numerical values of hindfoot_length and weight in species DM

# data parsing for figure 1
surveys_complete <- surveys %>% filter(species_id == "DM") %>% filter(!is.na(weight)) %>% filter(!is.na(hindfoot_length))

# build figure 1
ggplot(data = surveys_complete, aes(x = hindfoot_length, y = weight)) + geom_point() + ggtitle("The Relationship Between Hind Foot Length and Weight in Species DM") + labs(x="Hind Foot Length of Species DM (mm)", y="Weight of Species DM (g)")

## figure 2 compares the difference in hindfoot_length with respect to sex in all species 

# data parsing for figure 2
surveys_complete <- surveys %>% filter(species_id == "DM") %>% group_by(sex) %>% filter(!is.na(hindfoot_length)) %>% filter(!is.na(sex))

# build figure 2
ggplot(surveys_complete, aes(x = sex, y = hindfoot_length, fill=sex)) + geom_boxplot() + ggtitle("Comparing Hind Foot Length to Sex in Species DM") + labs(x="Sex", y="Hind Foot Length (mm)")


## figure 3 the distribution of the weights of all species in the data set

# data parsing for figure 3
surveys_complete <- surveys %>% group_by(species_id) %>% filter(!is.na(weight)) %>% filter(!is.na(hindfoot_length)) %>% filter(species_id=="DM")

# build figure 3
ggplot(data = surveys_complete, aes( x=weight)) + geom_histogram(binwidth =.5) + ggtitle("The Distribution of Weight of Species DM") + labs(x="Weight for DM (g)",y="Species DM Count")

# ANOVA of the species weights and sex 
# Fit model
fit <- aov(weight ~ sex, data =surveys_complete)

# visualize fit 
summary(fit)
