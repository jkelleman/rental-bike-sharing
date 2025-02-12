### HW4


## Jen Kelleman
## Carnegie Mellon University
## Data Science Capstone


# Install R library:
# install.packages("readr")

#Reading in the dataset
library(readr)

bikeSharing <- read_csv("C:/Users/jenkelleman/OneDrive - Microsoft/Desktop/CMU DS Capstone/rental-bike-sharing/clean-data/clean_bikeSharing.csv")
view(bikeSharing)

#Checking the dataset
print(bikeSharing) 


## Linear Regression Model: 
# I want to predict the "Rental Count" using the "Temperature", "Humidity", and "Wind Speed" columns as predictors. 

# As part of this model fit, I'll be investigating these key components: coefficients, R-squared value, p-values, and residuals.

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

# Coefficients:
# (Intercept)         Temp     Humidity    Windspeed
# -11839.05        62.16      -273.47        26.32  

# Residual standard error: 157 on 17375 degrees of freedom
# Multiple R-squared:  0.2514,	Adjusted R-squared:  0.2512 
# F-statistic:  1945 on 3 and 17375 DF,  p-value: < 2.2e-16


# Predict the bike rental count using the model. Plot the coefficients of the model.
plot(model$coefficients)

# Extract coefficients (excluding the intercept)
coefficients <- summary(model)$coefficients[-1, "Estimate"]

coeff_df <- data.frame(
  Predictor = names(coefficients),
  Coefficient = coefficients
)



# Next, I plot the coefficients. Why? To visualize the relationship between the predictors and the response variable. This will help me understand the impact of each predictor on the bike rental count.
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
  geom_histogram(binwidth = 50, fill = "orange", alpha = 50) +
  geom_density(color = "blue") +
  theme_minimal() +
  ggtitle("Distribution of Residuals") +
  xlab("Residual Value") +
  ylab("Frequency") 


## Interpretation: In my plot, the residuals are randomly distributed around zero. 
# This indicates that the linear regression model is capturing the relationship between the predictors and the response variable well. There are no clear patterns or trends in the residuals, which is a good sign.


# Check the assumptions of linear regression. Plot the relationship between the predictors and the response variable, the residuals, and the normality of the residuals.

## Next, I'll be investigating these key assumptions of linear regression: linearity, independence, normality, and homoscedasticity. These assumptions are crucial for the model to be valid and reliable. 

# Here's how I'll check them
# 1. Linearity: The relationship between the predictors and the response variable should be linear.
# 2. Independence: The residuals should be independent of each other. 
# 3. Normality: The residuals should be normally distributed.
# 4. Homoscedasticity: The residuals should have constant variance across all levels of the predictors.
# 5. Multicollinearity: The predictors should not be highly correlated with each other. This can lead to unstable coefficients and unreliable predictions.


## 1. Check the linearity assumption
# Temperature vs. Rental Count
ggplot(data.frame(Temp = predictors$Temp, Count = response), aes(x = Temp, y = Count)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", col = "red") +
  theme_minimal() +
  ggtitle("Temperature vs. Rental Count") +
  xlab("Temperature") +
  ylab("Rental Count")

# Humidity vs. Rental Count
ggplot(data.frame(Humidity = predictors$Humidity, Count = response), aes(x = Humidity, y = Count)) +
  geom_point(color = "green") +
  geom_smooth(method = "lm", col = "red") +
  theme_minimal() +
  ggtitle("Humidity vs. Rental Count") +
  xlab("Humidity") +
  ylab("Rental Count")

# Wind Speed vs. Rental Count
ggplot(data.frame(WindSpeed = predictors$WindSpeed, Count = response), aes(x = WindSpeed, y = Count)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", col = "red") +
  theme_minimal() +
  ggtitle("Wind Speed vs. Rental Count") +
  xlab("Wind Speed") +
  ylab("Rental Count")


## 2. Check the independence assumption
# Residuals Plot
ggplot(data.frame(Residuals = model$residuals), aes(x = seq_along(Residuals), y = Residuals)) +
  geom_point(color = "orange") +
  geom_hline(yintercept = 0, col = "red", linetype = "dashed") +
  theme_minimal() +
  ggtitle("Residuals Plot") +
  xlab("Index") +
  ylab("Residuals")


## 3. Check the normality assumption
# Histogram of Residuals
ggplot(data.frame(Residuals = model$residuals), aes(x = Residuals)) +
  geom_histogram(binwidth = 50, fill = "skyblue", alpha = 0.7) +
  geom_density(color = "red") +
  theme_minimal() +
  ggtitle("Distribution of Residuals") +
  xlab("Residual Value") +
  ylab("Frequency")


## 4. Check the homoscedasticity assumption
# Residuals vs. Temperature
ggplot(data.frame(Temp = predictors$temperature, Residuals = model$residuals), aes(x = Temp, y = Residuals)) +
  geom_point(color = "blue") +
  geom_hline(yintercept = 0, col = "red", linetype = "dashed") +
  theme_minimal() +
  ggtitle("Residuals vs. Temperature") +
  xlab("Temperature") +
  ylab("Residuals")

# Residuals vs. Humidity
ggplot(data.frame(Humidity = predictors$humidity, Residuals = model$residuals), aes(x = Humidity, y = Residuals)) +
  geom_point(color = "green") +
  geom_hline(yintercept = 0, col = "red", linetype = "dashed") +
  theme_minimal() +
  ggtitle("Residuals vs. Humidity") +
  xlab("Humidity") +
  ylab("Residuals")

# Residuals vs. Wind Speed
ggplot(data.frame(WindSpeed = predictors$wind_speed, Residuals = model$residuals), aes(x = WindSpeed, y = Residuals)) +
  geom_point(color = "purple") +
  geom_hline(yintercept = 0, col = "red", linetype = "dashed") +
  theme_minimal() +
  ggtitle("Residuals vs. Wind Speed") +
  xlab("Wind Speed") +
  ylab("Residuals")


## 5. Check the multicollinearity assumption
# Correlation Matrix of Predictors
correlation_matrix <- cor(predictors)
ggplot(data = as.data.frame(as.table(correlation_matrix)), aes(Var1, Var2, fill = Freq)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1), space = "Lab", name = "Correlation") +
  theme_minimal() +
  ggtitle("Correlation Matrix of Predictors") +
  xlab("Predictors") +
  ylab("Predictors") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 


# Calculate the VIF (Variance Inflation Factor) for each predictor. A VIF > 5 indicates multicollinearity. 
library(car)
vif(model)
print(vif(model)) 

# Coefficients:
# Temp  Humidity Windspeed 
# 1.006988  1.098937  1.094156 

# The VIF values for all predictors are close to 1. 
# This indicates that multicollinearity is not a concern in this model. This is good news, as multicollinearity can lead to unstable coefficients and unreliable predictions.