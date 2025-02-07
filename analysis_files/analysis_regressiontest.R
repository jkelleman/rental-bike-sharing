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
#3. Ridge Regression: Predict bike rental count using temperature, humidity, and wind speed with L2 regularization.
#4. Lasso Regression: Predict bike rental count using temperature, humidity, and wind speed with L1 regularization.
#5.Elastic Net Regression: Predict bike rental count using temperature, humidity, and wind speed with a combination of L1 and L2 regularization.
#6.Decision Tree Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#7.   Random Forest Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#8. Gradient Boosting Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#9. Support Vector Regression (SVR): Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#10. Neural Network Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#11. Principal Component Analysis (PCA): Reduce the dimensionality of the dataset and predict bike rental count using the principal components.

#I'll be using the following libraries for the regression model tests:
#1. glmnet: For Ridge, Lasso, and Elastic Net Regression.
#2. rpart: For Decision Tree Regression.
#3. randomForest: For Random Forest Regression.
#4. xgboost: For Gradient Boosting Regression.
#5. e1071: For Support Vector Regression (SVR).
#6. nnet: For Neural Network Regression.
#7. caret: For Principal Component Analysis (PCA).


#Regression Model Functions
# 1. Linear Regression
#I want to perform a linear regression analysis on the dataset. I want to predict the "rental_count" using the "temperature", "humidity", and "wind_speed" columns as predictors. Basically, I'm doing a simple linear regression analysis. Here are some reasons why I'm doing this:
#Linear Regression:
#Coefficients: These indicate the relationship between each predictor (e.g., temperature, humidity) and the bike rental count. A positive coefficient means that as the predictor increases, the bike rental count also increases, and vice versa.
#R-squared: This value indicates how well the model explains the variability in the bike rental count. A higher R-squared value means a better fit.
#p-values: These indicate the statistical significance of each predictor. A low p-value (typically < 0.05) suggests that the predictor is significantly associated with the bike rental count.
#Residuals: These are the differences between the actual bike rental count and the predicted bike rental count. A good model will have residuals that are normally distributed around zero.

#Here is my code:

```{r} 
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


#Load dataset
bikeSharing <- read_csv("clean-data/data-cleaning.csv")
}
```

# Create a table of the number of appeals filed per year
appeals_per_year <- propertyappeals %>%
  group_by(tax_year) %>%
  summarize(`Number of Appeals` = n())

```{r}
linear_regression <- function(bikeSharing) {
  model <- lm(rental_count ~ temperature + humidity + wind_speed, data = data)
  summary(model)
}
```


# 2. Polynomial Regression
#I want to perform a polynomial regression: a type of regression analysis that models the relationship between the independent variable and the dependent variable as an nth degree polynomial. This is useful when the relationship between the variables is non-linear. In this case, I want to predict the "rental_count" using the "temperature", "humidity", and "wind_speed" columns as predictors with polynomial features. Here are some reasons why I'm doing this:
#Similar to linear regression, but includes polynomial terms. The interpretation of coefficients and R-squared is the same, but the model can capture non-linear relationships.
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


#11. Principal Component Analysis (PCA): Reduce the dimensionality of the dataset and predict bike rental count using the principal components.
 
pca_regression <- function(data) {
  library(caret)
  preProcess <- preProcess(data, method = c("center", "scale"))
  data_processed <- predict(preProcess, data)
  model <- train(rental_count ~ ., data = data_processed, method = "pcr", preProcess = c("center", "scale"), tuneLength = 10)
  print(model)
  
  olive.pca = prcomp(olive.subset, center = TRUE, scale. = TRUE)
  summary(olive.pca)
  
  #get the "rotation" from PCA, and then compute the Gamma vectors:
  rotation = olive.pca$rotation
  gamma = rotation %*% diag(olive.pca$sdev)
  
  rotation.pca = olive.pca$rotation
  
  
}