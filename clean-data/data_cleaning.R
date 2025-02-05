#data_cleaning.R 

#This file is for cleaning the data. It reads in the raw data and cleans it up. It also creates a new data frame that is ready for analysis. 


#Reading in the dataset
library(readr)
bikeSharing <- read_csv("raw-data/bikeSharing.csv")
View(bikeSharing)

#Checking the dataset
print(bikeSharing) 

#Reorder the columns for better readability.
#I want to have like-for-like data next to each other. That is, have the "Casual" and "Registered" columns next to each other. Have the "Year", "Month", "Day", and "Hour" columns next to each other. Have the "Holiday", "WorkDay", and "Weather" columns next to each other. Have the "Temp", "TempFeel", "Humidity", and "Windspeed" columns next to each other.
bikeSharing <- bikeSharing[, c("Casual", "Registered", "Count", "Month", "Day", "Year", "Hour", "Holiday", "WorkDay", "Weather", "Temp", "TempFeel", "Humidity", "Windspeed")] 
print(bikeSharing) 


#Cleaning the dataset. I'll be doing multiple steps here: 
#1. Change the data types (to factor or categorical). We need to arrange the data so it's like-for-like. We also need to make it easily digestible for analysis.
#2. Add a "Count" column next to the "Casual" and "Registered" columns. Make it the 3rd column.
#3. Clean up how "Year" is represented. 0 = 2011, 1 = 2012.
#4. Convert the "Month" column to a factor. Spell out the months. 1 = January, 2 = February, 3 = March, 4 = April, 5 = May, 6 = June, 7 = July, 8 = August, 9 = September, 10 = October, 11 = November, 12 = December.
#5. Add a "HolidayName" column to the dataset. Create a new column called "HolidayName". If "Holiday" is 0, then "HolidayName" is "No". If "Holiday" is 1, then "HolidayName" is the value in the "HolidayName" column. Replace the value "HolidayName" with the corresponding holiday name based on 2011 or 2012 calendar, using information from the "Year" column.
#6 Create "Season" column based off information from the "Month" column. 1 = spring, 2 = summer, 3 = fall, 4 = winter. Spell out the seasons.
#7. Add a "MDY" column to the dataset. Merge together the existing columns of "Month", "Day", and "Year" to create a new column called "MDY". Format the column as "Month-Day,-Year". 
#8. Convert the time from 24 hours to 12 hours format. Include am and pm as appropriate. Create "Hour" column with the following values: 0 = 12am, 1 = 1am, 2 = 2am, 3 = 3am, 4 = 4am, 5 = 5am, 6 = 6am, 7 = 7am, 8 = 8am, 9 = 9am, 10 = 10am, 11 = 11am, 12 = 12pm, 13 = 1pm, 14 = 2pm, 15 = 3pm, 16 = 4pm, 17 = 5pm,18=6pm ,19=7pm ,20=8pm ,21=9pm ,22=10pm ,23=11pm
#9. Convert the "Temp" and "Feels Like" to Fahrenheit (for the US audience). 


#Change the data types (to factor or categorical) 
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


#Add a "Count" column next to the "Casual" and "Registered" columns.
bikeSharing$Count <- bikeSharing$Casual + bikeSharing$Registered
print(bikeSharing)  


#Create "Year" column with the following values: 0 = 2011, 1 = 2012
bikeSharing$Year <- as.factor(bikeSharing$Year)
#Create "Month" column with the following values: 1 = January, 2 = February, 3 = March, 4 = April, 5 = May, 6 = June, 7 = July, 8 = August, 9 = September, 10 = October, 11 = November, 12 = December
bikeSharing$Month <- as.factor(bikeSharing$Month)
print(bikeSharing$Month)


#Add a "MDY" column to the dataset. Merge together the existing columns of "Month", "Day", and "Year" to create a new column called "MDY".
bikeSharing$MDY <- as.Date(paste(bikeSharing$Year, bikeSharing$Month, bikeSharing$Day, sep = "-"), format = "%Y-%m-%d")
#Reorder the 
print(bikeSharing$MDY)









#Create "Month" column with the following values: 1 = January, 2 = February, 3 = March, 4 = April, 5 = May, 6 = June, 7 = July, 8 = August, 9 = September, 10 = October, 11 = November, 12 = December
bikeSharing$Month <- as.factor(bikeSharing$Month)

#Create "Season" column with the following values: 1 = spring, 2 = summer, 3 = fall, 4 = winter
bikeSharing$Season <- as.factor(bikeSharing$Season)

#Create "Hour" column with the following values: 0 = 12am, 1 = 1am, 2 = 2am, 3 = 3am, 4 = 4am, 5 = 5am, 6 = 6am, 7 = 7am, 8 = 8am, 9 = 9am, 10 = 10am, 11 = 11am, 12 = 12pm, 13 = 1pm, 14 = 2pm, 15 = 3pm, 16 = 4pm, 17 = 5pm, 18 = 6pm,19 =7pm ,20=8pm ,21=9pm ,22=10pm ,23=11pm
bikeSharing$Hour <- as.factor(bikeSharing$Hour)

#Create WorkDay column with the following values: 0 = No, 1 = Yes
bikeSharing$WorkDay <- as.factor(bikeSharing$WorkDay)

#Create Holiday column with the following values: 0 = No, 1 = Yes
bikeSharing$Holiday <- as.factor(bikeSharing$Holiday)

#Create Weather column with the following values: 1 = Clear, 2 = Mist, 3 = Light Snow, 4 = Heavy Rain
bikeSharing$Weather <- as.factor(bikeSharing$Weather)

#Converting the "Temp" and "Feels Like" to Fahrenheit (for the US audience).
bikeSharing$Temp <- (bikeSharing$Temp * 9/5) + 32
bikeSharing$TempFeel <- (bikeSharing$TempFeel * 9/5) + 32


