#analysis_regressiontest.R 

#This file is for analysing the data. It reads in the cleaned data and analyzes it. 

#Reading in the dataset
library(readr)
bikeSharing <- read_R("clean-data/data_cleaning.R")
View(bikeSharing)

#Checking the dataset
print(bikeSharing) 

#Reorder the columns for better readability.
#I want to have like-for-like data next to each other. That is, have the "Casual" and "Registered" columns next to each other. Have the "Year", "Month", "Day", and "Hour" columns next to each other. Have the "Holiday", "WorkDay", and "Weather" columns next to each other. Have the "Temp", "TempFeel", "Humidity", and "Windspeed" columns next to each other.
bikeSharing <- bikeSharing[, c("Casual", "Registered", "Count", "Month", "Day", "Year", "Hour", "Holiday", "WorkDay", "Weather", "Temp", "TempFeel", "Humidity", "Windspeed")] 
print(bikeSharing) 


#To learn more about my research question, I'll be doing multiple regression model tests:
#1. Linear Regression: Predict bike rental count using temperature, humidity, and wind speed as predictors.
#2. Polynomial Regression: Predict bike rental count using temperature, humidity, and wind speed with polynomial features.
#3.Ridge Regression: Predict bike rental count using temperature, humidity, and wind speed with L2 regularization.
#4. Lasso Regression: Predict bike rental count using temperature, humidity, and wind speed with L1 regularization.
#5.Elastic Net Regression: Predict bike rental count using temperature, humidity, and wind speed with a combination of L1 and L2 regularization.
#6.Decision Tree Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#7.Random Forest Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#8.Gradient Boosting Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#9. Support Vector Regression (SVR): Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#10. Neural Network Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.


#Regression Model Functions
# 1. Linear Regression
linear_regression <- function(data) {
  model <- lm(rental_count ~ temperature + humidity + wind_speed, data = data)
  summary(model)
}

# 2. Polynomial Regression
polynomial_regression <- function(data) {
  model <- lm(rental_count ~ poly(temperature, 2) + poly(humidity, 2) + poly(wind_speed, 2), data = data)
  summary(model)
}

# 3. Ridge Regression
ridge_regression <- function(data) {
  library(glmnet)
  x <- model.matrix(rental_count ~ temperature + humidity + wind_speed, data)[,-1]
  y <- data$rental_count
  model <- cv.glmnet(x, y, alpha = 0)
  print(model)
}
