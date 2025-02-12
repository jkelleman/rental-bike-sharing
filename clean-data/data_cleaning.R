### data_cleaning.R 


## Jen Kelleman
## Carnegie Mellon University
## Data Science Capstone


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


-------------------
  
#Data Cleaning

#Checking the dataset
print(bikeSharing) 

#Reorder the columns for better readability.
#I want to have like-for-like data next to each other. That is, have the "Casual" and "Registered" columns next to each other. Have the "Year", "Month", "Day", and "Hour" columns next to each other. Have the "Holiday", "WorkDay", and "Weather" columns next to each other. Have the "Temp", "TempFeel", "Humidity", and "Windspeed" columns next to each other.
bikeSharing <- bikeSharing[, c("Casual", "Registered", "Month", "Day", "Year", "Hour", "Holiday", "WorkDay", "Weather", "Temp", "TempFeel", "Humidity", "Windspeed")] 
print(bikeSharing) 


## Cleaning the dataset. 
## I'll be doing multiple steps here: 
# 1. Change the data types (to factor or categorical). We need to arrange the data so it's like-for-like. We also need to make it easily digestible for analysis.
# 2. Add a "Count" column next to the "Casual" and "Registered" columns.
# 3. Clean up how "Year" is represented. 0 = 2011, 1 = 2012.
# 4.  Add a "SeasonName" column to the dataset. Based the information from the "Month" column. 1 = spring, 2 = summer, 3 = fall, 4 = winter. Spell out the seasons.
# 5. Add a "MDY" column to the dataset. Merge together the existing columns of "Month", "Day", and "Year" to create a new column called "MDY". Format the column as "Month-Day-Year". 
# 6. Convert the "Temp" and "FeelsLike" columns to Fahrenheit (for the US audience). 
# 7. Add a "WeatherName" column. Spell out the weather conditions. Use the following values: 1 = Clear, 2 = Mist, 3 = Light Snow, 4 = Heavy Rain

## Additional cleaning that I'll do in the analysis file.
# 8. Add a "HolidayName" column to the dataset. If "Holiday" is 0, then "HolidayName" is "No". If "Holiday" is 1, then "HolidayName" is the value in the "HolidayName" column. 
# 9. Add a "CulturalEvent" column with the corresponding cultural event date(s) based on the 2011 or 2012 calendar, using information from the "Year" column.

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
print(bikeSharing$Count)  


# 3. Clean up how "Year" is represented. 0 = 2011, 1 = 2012.
bikeSharing$Year <- as.factor(bikeSharing$Year)
bikeSharing$Year <- ifelse(bikeSharing$Year == 0, 2011, 2012)
print(bikeSharing$Year) 


# 4. Add a "MonthName" column to the dataset. Base the information from the "Month" column.
bikeSharing$MonthName <- as.factor(month.name[bikeSharing$Month])
print(bikeSharing$MonthName)


# 5. Add a "Season" column to the dataset. Based the information from the "Month" column. 1 = spring, 2 = summer, 3 = fall, 4 = winter. Spell out the season names.
getSeason <- function(month) { 
  if (month %in% c(3, 4, 5)) {
    return("Spring")
  } else if (month %in% c(6, 7, 8)) {
    return("Summer")
  } else if (month %in% c(9, 10, 11)) {
    return("Fall")
  } else {
    return("Winter")
  }
}
bikeSharing$Season <- sapply(bikeSharing$Month, getSeason)
bikeSharing$Season <- as.factor(bikeSharing$Season)
print(bikeSharing$Season)


# 6. Add a "MDY" column to the dataset. Merge together the existing columns of "Month", "Day", and "Year" to create a new column called "MDY". Format the column as "Year-Month-Day".
bikeSharing$MDY <- as.Date(paste(bikeSharing$Month, bikeSharing$Day, bikeSharing$Year, sep = "-"), format = "%m-%d-%Y")
print(bikeSharing$MDY)


# 7. Convert the "Temp" and "FeelsLike" columns to Fahrenheit (for the US audience). 
bikeSharing$Temp <- (bikeSharing$Temp * 9/5) + 32
bikeSharing$TempFeel <- (bikeSharing$TempFeel * 9/5) + 32
print(bikeSharing$Temp)


# 8. Add a "WeatherName" column. Spell out the weather conditions. Use the following values: 1 = Clear, 2 = Mist, 3 = Light Snow, 4 = Heavy Rain
bikeSharing$Weather <- as.factor(bikeSharing$Weather)
bikeSharing$WeatherName <- ifelse(bikeSharing$Weather == 1, "Clear", ifelse(bikeSharing$Weather == 2, "Mist", ifelse(bikeSharing$Weather == 3, "Light Snow", "Heavy Rain")))
print(bikeSharing$WeatherName)


#9. Reorder the columns for better readability.
bikeSharing <- bikeSharing[, c("Casual", "Registered", "Count", "Month", "MonthName", "Day", "Year", "MDY", "Hour", "Season", "Holiday", "WorkDay", "Weather", "Temp", "TempFeel", "Humidity", "Windspeed")]
print(bikeSharing) 

write.csv(bikeSharing, "C:/Users/jenkelleman/OneDrive - Microsoft/Desktop/CMU DS Capstone/rental-bike-sharing/clean-data/clean_bikeSharing.csv")


