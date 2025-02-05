# Jen Kelleman
# Data Science Capstone
# Carnegie Mellon University
# February 2025

<h1>What are statistical modeling concepts</h1>
<b>Statistical modeling</b> is a process used in data science to identify relationships within a dataset and make predictions based on those relationships. It involves creating a mathematical representation of the data, which can help in understanding patterns and making informed decisions.

There are two main categories of statistical modeling methods: supervised learning and unsupervised learning.

<h2>Supervised Learning:</h2>
<p></p>
<b>Regression Models:</b> These models predict the relationship between independent and dependent variables. Common types include linear regression, logistic regression, and polynomial regression.
<p></p>
<b>Classification Models:</b> These models classify data points into categories. Examples include decision trees, Naive Bayes, nearest neighbor, random forests, and neural networks.
<p></p>
<h2>Unsupervised Learning:</h2>
<p></p>
<h2>Unsupervised Learning:</h2>
<p></p>
<b>Clustering Algorithms:</b> These algorithms group data points based on similarities. An example is K-means clustering.
<p></p>
<b>Association Rules:</b> These rules identify relationships between variables in large datasets.

Additionally, statistical modeling often involves techniques like hypothesis testing, which includes <b>T-tests and Z-tests</b>, to validate the models and ensure their accuracy
<p></p>
<p></p>
<h1>Diving into regression models and how to implement them in R.</h1>
<p></p>
<b>Regression Models:</b> Regression models are statistical techniques used to estimate the relationships between a dependent variable and one or more independent variables. Here are some common types of regression models:
<p></p>
<b>1. Linear Regression:</b> This model assumes a linear relationship between the dependent and independent variables. It is used to predict the value of a dependent variable based on the value of one or more independent variables.
<p></p>
<b>Logistic Regression:</b> This model is used when the dependent variable is binary (e.g., yes/no, true/false). It estimates the probability that a given input point belongs to a certain class.
<p></p>
<b>Polynomial Regression:</b> This model is a type of linear regression where the relationship between the independent variable and the dependent variable is modeled as an nth degree polynomial.
<p></p>
<b>Ridge Regression:</b> This model is a type of linear regression that includes a regularization term to prevent overfitting.
<p></p>
<b>Lasso Regression:</b> Similar to ridge regression, but it can shrink some coefficients to zero, effectively performing variable selection.
<p></p>
<b>Poisson Regression:</b> This model is used for count data and assumes that the dependent variable follows a Poisson distribution.
<p></p>
<p></p>
<p></p>
<h2>Examples in R:</h2> 
Here are some examples of how to implement these regression models in R:
<p></p>
<b><h3>Linear Regression:</h3></b>
# Load necessary library
library(ggplot2)

# Load dataset
data(mtcars)

# Fit linear regression model
model <- lm(mpg ~ wt + hp, data = mtcars)

# Summary of the model
summary(model)
<p></p>
<p></p>
<b><h3>Logistic Regression:</h3></b>
# Load necessary library
library(ggplot2)

# Load dataset
data(mtcars)

# Convert vs variable to a factor
mtcars$vs <- as.factor(mtcars$vs)

# Fit logistic regression model
model <- glm(vs ~ wt + hp, data = mtcars, family = binomial)

# Summary of the model
summary(model)
<p></p>
<p></p>
<b><h3>Polynomial Regression:</h3></b>
# Load necessary library
library(ggplot2)

# Load dataset
data(mtcars)

# Fit polynomial regression model
model <- lm(mpg ~ poly(wt, 2) + poly(hp, 2), data = mtcars)

# Summary of the model
summary(model)
<p></p>
<p></p>
<b><h3>Ridge Regression:</h3></b>
# Load necessary library
library(glmnet)

# Load dataset
data(mtcars)

# Prepare data
x <- as.matrix(mtcars[, c("wt", "hp")])
y <- mtcars$mpg

# Fit ridge regression model
model <- glmnet(x, y, alpha = 0)

# Summary of the model
print(model)
<p></p>
<p></p>
<b><h3>Lasso Regression:</h3></b>
# Load necessary library
library(glmnet)

# Load dataset
data(mtcars)

# Prepare data
x <- as.matrix(mtcars[, c("wt", "hp")])
y <- mtcars$mpg

# Fit lasso regression model
model <- glmnet(x, y, alpha = 1)

# Summary of the model
print(model)
<p></p>
<p></p>
<b><h3>Poisson Regression:</h3></b>
# Load necessary library
library(ggplot2)

# Load dataset
data(mtcars)

# Fit Poisson regression model
model <- glm(qsec ~ wt + hp, data = mtcars, family = poisson)

# Summary of the model
summary(model)