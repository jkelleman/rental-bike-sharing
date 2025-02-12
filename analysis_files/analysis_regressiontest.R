### analysis_regressiontest.R 

## Jen Kelleman
## Carnegie Mellon University
## Data Science Capstone


#This file is for analyzing the data. It reads in the cleaned data and analyzes it. 


# Install R library:
# install.packages("readr")

#Reading in the dataset
library(readr)

bikeSharing <- read_csv("C:/Users/jenkelleman/OneDrive - Microsoft/Desktop/CMU DS Capstone/rental-bike-sharing/clean-data/clean_bikeSharing.csv")
view(bikeSharing)

#Checking the dataset
print(bikeSharing) 


## To learn more about my research question, I'll be doing multiple regression model tests:
#1. Linear Regression: Predict bike rental count using temperature, humidity, and wind speed as predictors.
#2. Polynomial Regression: Predict bike rental count using temperature, humidity, and wind speed with polynomial features.
#3. Ridge Regression: Predict bike rental count using temperature, humidity, and wind speed with L2 regularization.
#4. Lasso Regression: Predict bike rental count using temperature, humidity, and wind speed with L1 regularization.
#5. Elastic Net Regression: Predict bike rental count using temperature, humidity, and wind speed with a combination of L1 and L2 regularization.
#6. Decision Tree Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#7. Random Forest Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#8. Gradient Boosting Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#9. Support Vector Regression (SVR): Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#10. Neural Network Regression: Predict bike rental count using temperature, humidity, wind speed, and season as predictors.
#11. Principal Component Analysis (PCA): Reduce the dimensionality of the dataset and predict bike rental count using the principal components.

## I'll be using the following libraries for the regression model tests:
#1. glmnet: For Ridge, Lasso, and Elastic Net Regression.
#2. rpart: For Decision Tree Regression.
#3. randomForest: For Random Forest Regression.
#4. xgboost: For Gradient Boosting Regression.
#5. e1071: For Support Vector Regression (SVR).
#6. nnet: For Neural Network Regression.
#7. caret: For Principal Component Analysis (PCA).


## Regression Model Functions
# 1. Linear Regression
# I want to perform a linear regression analysis on the dataset. I want to predict the "rental_count" using the "temperature", "humidity", and "wind_speed" columns as predictors. Basically, I'm doing a simple linear regression analysis. Here are some reasons why I'm doing this:
# Linear Regression:
# Coefficients: These indicate the relationship between each predictor (e.g., temperature, humidity) and the bike rental count. A positive coefficient means that as the predictor increases, the bike rental count also increases, and vice versa.
# R-squared: This value indicates how well the model explains the variability in the bike rental count. A higher R-squared value means a better fit.
# p-values: These indicate the statistical significance of each predictor. A low p-value (typically < 0.05) suggests that the predictor is significantly associated with the bike rental count.
# Residuals: These are the differences between the actual bike rental count and the predicted bike rental count. A good model will have residuals that are normally distributed around zero.


### Here is my code:

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


# Define the predictor variables and the response variable
predictors <- bikeSharing %>% select(Temp, Humidity, Windspeed)
response <- bikeSharing$Count

# Fit the linear regression model
model <- lm(response ~ ., data = predictors)
summary(model)
print(model)

## Interpretation of the linear regression model: I've uncovered a statistically significantly relationship between the predictors (temperature, humidity, wind speed) and the bike rental count. The R-squared value of 0.26 indicates that the model explains 26% of the variability in the bike rental count. The p-values for the predictors are all less than 0.05, indicating that they are statistically significant.
# Moving on to the interpretation of coefficients, I can say that temperature has a positive relationship with the bike rental count (+62.16); humidity has a negative relationship (-273.47); and wind speed has a positive relationship (+26.32). This means that as temperature increases, bike rental count increases; as humidity increases, bike rental count decreases; and as wind speed increases, bike rental count increases. 
# In a nutshell, I can predict the bike rental count using the temperature, humidity, and wind speed predictors with a reasonable degree of accuracy. For a non-statistical audience, I can say that each degree Fahrenheit increase in temperature, the bike rental count increases by 62.16. With each percentage increase in humidity, the bike rental count decreases by 273.47. With each mile per hour increase in wind speed, the bike rental count increases by 26.32.
#Coefficients:
# (Intercept)         Temp     Humidity    Windspeed
# -11839.05        62.16      -273.47        26.32  

# Predict the bike rental count using the model. Plot the coefficients of the model.
plot(model$coefficients)

# Extract coefficients (excluding the intercept)
coefficients <- summary(model)$coefficients[-1, "Estimate"]

coeff_df <- data.frame(
  Predictor = names(coefficients),
  Coefficient = coefficients
)



# Next,I plot the coefficients. Why? To visualize the relationship between the predictors and the response variable. This will help me understand the impact of each predictor on the bike rental count.
library(ggplot2)
ggplot(coeff_df, aes(x = Predictor, y = Coefficient, fill = Predictor)) +
  geom_bar(stat = "identity") +
  scale_fill_viridis_d() +
  theme_minimal() +
  ggtitle("Coefficients of the Linear Regression Model") +
  xlab("Predictor Variables") +
  ylab("Coefficient Value") 

# Plot the residuals
ggplot(data.frame(Residuals = model$residuals), aes(x = Residuals)) +
  geom_histogram(binwidth = 50, fill = "blue", alpha = 0.7) +
  geom_density(color = "red") +
  theme_minimal() +
  ggtitle("Distribution of Residuals") +
  xlab("Residual Value") +
  ylab("Frequency") 
# Interpretation of the residuals plot: In my plot, the residuals are randomly distributed around zero. This indicates that the linear regression model is capturing the relationship between the predictors and the response variable well. There are no clear patterns or trends in the residuals, which is a good sign.


# Check the assumptions of linear regression
# 1. Linearity: The relationship between the predictors and the response variable should be linear.
# 2. Independence: The residuals should be independent of each other. 
# 3. Normality: The residuals should be normally distributed.

# Check the linearity assumption
plot(predictors$Temp, response)
abline(model)

plot(predictors$Humidity, response)
abline(model)

plot(predictors$Windspeed, response)
abline(model)

# Check the independence assumption
plot(model$residuals)

# Check the normality assumption
hist(model$residuals)

# Check the homoscedasticity assumption
plot(model$residuals, predictors$Temp)
abline(h = 0)

plot(model$residuals, predictors$Humidity)
abline(h = 0)

plot(model$residuals, predictors$Windspeed)
abline(h = 0)


# Check the multicollinearity assumption
cor(predictors)

# Calculate the VIF (Variance Inflation Factor) for each predictor. A VIF > 5 indicates multicollinearity. 
library(car)
vif(model)
print(vif(model))
plot(vif(model))

## Doing some data visualizations to understand the data better.




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