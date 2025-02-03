## Jen Kelleman
## Week 2 Homework

  
#Set working directory

## Loading the required packages

library(tidyverse)
library(dplyr)
library(scales)
library(ggplot2) 
library(glmnet)
library(lubridate)


## Importing the data 
head(bikeSharing)

## Inspecting the data
summary(bikeSharing)

## Checking the data types
str(bikeSharing)


## season -  1 = spring, 2 = summer, 3 = fall, 4 = winter 
## weather - 1: Clear, Few clouds, Partly cloudy, Partly cloudy ; 2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist ;3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds ;4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog

## Converting some variables into factors
bikeSharing$season <- as.factor(bikeSharing$season)
bikeSharing$weather <- as.factor(bikeSharing$weather)

## Converting the date into a date format
bikeSharing$date <- as.Date(bikeSharing$date)


## We can use ggplot2 to visualize Hour and the Total Count of Bike Sharing

ggplot(data=bikesharing, aes(x = hour, y=count, fill=hour))+geom_bar(stat = "identity")+ggtitle(label = "Hourly Comparison with Seasons")+theme_minimal()+theme(plot.title = element_text(hjust = 0.5, lineheight = 0.8, face = "bold"),legend.position = "none")+xlab("Weekdays")+ylab("Count")

