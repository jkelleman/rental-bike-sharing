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


## Principal Component Analysis (PCA) Model:
# I want to reduce the dimensionality of the dataset and predict the "Count" using the principal components.

# As part of this model fit, I'll be investigating these 4 key components: explained variance, principal components, coefficients, and residuals.
# 1. Explained Variance: This value indicates how much of the variability in the bike rental count is explained by the principal components. A higher explained variance means a better fit.
# 2. Principal Components: These are the new variables created by the PCA. They are linear combinations of the original predictors and are orthogonal to each other.
# 3. Coefficients: These indicate the relationship between each principal component and the bike rental count. A positive coefficient means that as the principal component increases, the bike rental count also increases, and vice versa.
# 4. Residuals: These are the differences between the actual bike rental count and the predicted bike rental count. A good model will have residuals that are normally distributed around zero.


### Here is my code:

# Load flat files in R and install packages
library(tidyverse)
library(caret)
library(ggplot2)
library(janitor)

# Standardize the data
predictors <- bikeSharing %>% select(temperature, humidity, wind_speed)
predictors_scaled <- scale(predictors)

# Perform PCA
pca_model <- prcomp(predictors_scaled, center = TRUE, scale. = TRUE)
summary(pca_model)

principal_components <- predict(pca_model, predictors_scaled)
principal_components_df <- as.data.frame(principal_components)

# Add the "Count" column to the principal components data frame
principal_components_df$Count <- bikeSharing$Count

#Spilt the data into training and testing sets
set.seed(123) # For reproducibility
trainIndex <- createDataPartition(principal_components_df$Count, p = .8, 
                                  list = FALSE, 
                                  times = 1)
train_data <- principal_components_df[ trainIndex,]
test_data  <- principal_components_df[-trainIndex,]

# Fit the linear regression model
model <- lm(Count ~ ., data = train_data)
summary(model)
print(model)

# Predict the bike rental count using the test data
predictions <- predict(model, test_data)
print(predictions)

# Evaluate the model using Mean Squared Error (MSE)
RMSE <- sqrt(mean((test_data$Count - predictions)^2))
print(RMSE)

# Visualize the results
plot(test_data$Count, predictions, 
     xlab = "Actual Bike Rental Count", 
     ylab = "Predicted Bike Rental Count",
     main = "Actual vs. Predicted Bike Rental Count",
     col = "blue")
abline(0, 1, col = "red")


# Save the model
saveRDS(model, "C:/Users/jenkelleman/OneDrive - Microsoft/Desktop/CMU DS Capstone/rental-bike-sharing/models/pca_model.rds")




