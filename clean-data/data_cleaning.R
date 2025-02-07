### data_cleaning.R 
## I'm using this file for cleaning the data. My process: read in the raw data, clean it up, and create a new data frame that is ready for analysis.
## The first part of this file will be data exploration. I'll be looking at the dataset to understand its structure and contents.
## The second part of this file will be data cleaning. I'll be cleaning up the dataset to make it easier to work with and analyze.



## Data exploration
# Load flat files in R and install packages
library(tidyverse)
library(knitr)
library(ggplot2)
library(janitor)
library(dbplyr)
library(dplyr)
library(readr)
library(lubridate)
library(stringr)


# Reading in the dataset
library(readr)
bikeSharing <- read_csv("C:/Users/jenkelleman/OneDrive - Microsoft/Desktop/CMU DS Capstone/rental-bike-sharing/raw-data/bikeSharing.csv")
View(bikeSharing)

# Data exploration
head(bikeSharing) 
tail(bikeSharing)

#Summary of the dataset
summary(bikeSharing)

# Visual exploration
plot(bikeSharing)


-------------------
  
#Data Cleaning

#Checking the dataset
print(bikeSharing) 

#Reorder the columns for better readability.
#I want to have like-for-like data next to each other. That is, have the "Casual" and "Registered" columns next to each other. Have the "Year", "Month", "Day", and "Hour" columns next to each other. Have the "Holiday", "WorkDay", and "Weather" columns next to each other. Have the "Temp", "TempFeel", "Humidity", and "Windspeed" columns next to each other.
bikeSharing <- bikeSharing[, c("Casual", "Registered", "Count", "Month", "Day", "Year", "Hour", "Holiday", "WorkDay", "Weather", "Temp", "TempFeel", "Humidity", "Windspeed")] 
print(bikeSharing) 


## Cleaning the dataset. 
## I'll be doing multiple steps here: 
# 1. Change the data types (to factor or categorical). We need to arrange the data so it's like-for-like. We also need to make it easily digestible for analysis.
# 2. Add a "Count" column next to the "Casual" and "Registered" columns.
# 3. Clean up how "Year" is represented. 0 = 2011, 1 = 2012.
# 4. Add a "MonthName" column to the dataset. Spell out the months. 1 = January, 2 = February, 3 = March, 4 = April, 5 = May, 6 = June, 7 = July, 8 = August, 9 = September, 10 = October, 11 = November, 12 = December.
# 5  Add a "SeasonName" column to the dataset. Based the information from the "Month" column. 1 = spring, 2 = summer, 3 = fall, 4 = winter. Spell out the seasons.
# 6. Add a "MDY" column to the dataset. Merge together the existing columns of "Month", "Day", and "Year" to create a new column called "MDY". Format the column as "Month-Day,-Year". 
# 7. Convert the "Temp" and "FeelsLike" columns to Fahrenheit (for the US audience). 
# 8. Add a "WeatherName" column. Spell out the weather conditions. Use the following values: 1 = Clear, 2 = Mist, 3 = Light Snow, 4 = Heavy Rain

## Additional cleaning that I'll do in the analysis file.
# 9. Add a "HolidayName" column to the dataset. If "Holiday" is 0, then "HolidayName" is "No". If "Holiday" is 1, then "HolidayName" is the value in the "HolidayName" column. 
# 10. Add a "CulturalEvent" column with the corresponding cultural event date(s) based on the 2011 or 2012 calendar, using information from the "Year" column.

-------------------



# 1. Change the data types (to factor or categorical). 
bikeSharing$Year <- as.factor(bikeSharing$Year)
bikeSharing$Month <- as.factor(bikeSharing$Month)
bikeSharing$Hour <- as.factor(bikeSharing$Hour)
bikeSharing$Holiday <- as.factor(bikeSharing$Holiday)
bikeSharing$WorkDay <- as.factor(bikeSharing$WorkDay)
bikeSharing$Weather <- as.factor(bikeSharing$Weather)
bikeSharing$Temp <- as.numeric(bikeSharing$Temp)
bikeSharing$TempFeel <- as.numeric(bikeSharing$TempFeel)
bikeSharing$Humidity <- as.numeric(bikeSharing$Humidity)
bikeSharing$Windspeed <- as.numeric(bikeSharing$Windspeed)
bikeSharing$Casual <- as.numeric(bikeSharing$Casual)
bikeSharing$Registered <- as.numeric(bikeSharing$Registered)


# 2. Add a "Count" column next to the "Casual" and "Registered" columns.
bikeSharing$Count <- bikeSharing$Casual + bikeSharing$Registered
print(bikeSharing)  


# 3. Clean up how "Year" is represented. 0 = 2011, 1 = 2012.
bikeSharing$Year <- as.factor(bikeSharing$Year)

# 4. Add a "MonthName" column to the dataset. Spell out the months. 1 = January...
bikeSharing$Month <- as.factor(bikeSharing$Month)
print(bikeSharing$Month)


# 5. Add a "SeasonName" column to the dataset. Based the information from the "Month" column. 1 = spring, 2 = summer, 3 = fall, 4 = winter. Spell out the seasons.
bikeSharing$Season <- as.factor(bikeSharing$Season)


# 6. Add a "MDY" column to the dataset. Merge together the existing columns of "Month", "Day", and "Year" to create a new column called "MDY". Format the column as "Month-Day,-Year". 
bikeSharing$MDY <- as.Date(paste(bikeSharing$Year, bikeSharing$Month, bikeSharing$Day, sep = "-"), format = "%Y-%m-%d")
#Reorder the 
print(bikeSharing$MDY)


# 7. Convert the "Temp" and "FeelsLike" columns to Fahrenheit (for the US audience). 
bikeSharing$Temp <- (bikeSharing$Temp * 9/5) + 32
bikeSharing$TempFeel <- (bikeSharing$TempFeel * 9/5) + 32


# 8. Add a "WeatherName" column. Spell out the weather conditions. Use the following values: 1 = Clear, 2 = Mist, 3 = Light Snow, 4 = Heavy Rain
bikeSharing$Weather <- as.factor(bikeSharing$Weather)





