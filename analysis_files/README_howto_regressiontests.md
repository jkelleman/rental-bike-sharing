Jen Kelleman<p></p>
Data Science Capstone<p></p>
Carnegie Mellon University<p></p>
February 2025
<p></p>
<p></p>
<p></p>
<h1>What are statistical modeling concepts</h1>
<b>Statistical modeling</b> is a process used in data science to identify relationships within a dataset and make predictions based on those relationships. It involves creating a mathematical representation of the data, which can help in understanding patterns and making informed decisions.

There are two main categories of statistical modeling methods: <b>supervised learning and unsupervised learning.</b>

<h2>Supervised Learning:</h2>
<p></p>
<b>Regression Models:</b> These models predict the relationship between independent and dependent variables. Common types include linear regression, logistic regression, and polynomial regression.
<p></p>
<b>Classification Models:</b> These models classify data points into categories. Examples include decision trees, Naive Bayes, nearest neighbor, random forests, and neural networks.
<p></p>
<h2>Unsupervised Learning:</h2>
<p></p>
<b>Clustering Algorithms:</b> These algorithms group data points based on similarities. An example is K-means clustering.
<p></p>
<b>Association Rules:</b> These rules identify relationships between variables in large datasets.
<p></p>
Additionally, statistical modeling often involves techniques like hypothesis testing, which includes <b>T-tests and Z-tests</b>, to validate the models and ensure their accuracy
<p></p>
<p></p>
<h1>Diving into regression models and how to implement them in R.</h1>
<p></p>
<b>Regression Models:</b> Regression models are statistical techniques used to estimate the relationships between a dependent variable and one or more independent variables. Here are some common types of regression models:
<p></p>
<b>1. Linear Regression:</b> This model assumes a linear relationship between the dependent and independent variables. It is used to predict the value of a dependent variable based on the value of one or more independent variables.
<p></p>
<b>2. Logistic Regression:</b> This model is used when the dependent variable is binary (e.g., yes/no, true/false). It estimates the probability that a given input point belongs to a certain class.
<p></p>
<b>3. Polynomial Regression:</b> This model is a type of linear regression where the relationship between the independent variable and the dependent variable is modeled as an nth degree polynomial.
<p></p>
<b>4. Ridge Regression:</b> This model is a type of linear regression that includes a regularization term to prevent overfitting.
<p></p>
<b>5. Lasso Regression:</b> Similar to ridge regression, but it can shrink some coefficients to zero, effectively performing variable selection.
<p></p>
<b>6. Poisson Regression:</b> This model is used for count data and assumes that the dependent variable follows a Poisson distribution.
<p></p>
<p></p>
<p></p>
<h2>Examples in R:</h2> 
Here are some examples of how to implement these regression models in R:
<p></p>
<b><h3>1. Linear Regression:</h3></b>
<li>Load necessary library </li>
library(ggplot2)
<p></p>
<li>Load dataset </li>
data(mtcars)
<p></p>
<li>Fit linear regression model </li>
model <- lm(mpg ~ wt + hp, data = mtcars)
<p></p>
<li>Summary of the model </li>
summary(model)
<p></p>
<p></p>
<b><h3>2. Logistic Regression:</h3></b>
<li>Load necessary library </li>
library(ggplot2)
<p></p>
<li>Load dataset </li>
data(mtcars)
<p></p>
<li>Convert vs variable to a factor </li>
mtcars$vs <- as.factor(mtcars$vs)
<p></p>
<li>Fit logistic regression model </li>
model <- glm(vs ~ wt + hp, data = mtcars, family = binomial)
<p></p>
<li>Summary of the model </li>
summary(model)
<p></p>
<p></p>
<b><h3>3. Polynomial Regression:</h3></b>
<li>Load necessary library </li>
library(ggplot2)
<p></p>
<li>Load dataset </li>
data(mtcars)
<p></p>
<li>Fit polynomial regression model </li>
model <- lm(mpg ~ poly(wt, 2) + poly(hp, 2), data = mtcars)
<p></p>
<li>Summary of the model </li>
summary(model)
<p></p>
<p></p>
<b><h3>4. Ridge Regression:</h3></b>
<li>Load necessary library </li>
library(glmnet)
<p></p>
<li>Load dataset </li>
data(mtcars)
<p></p>
<li>Prepare data </li>
x <- as.matrix(mtcars[, c("wt", "hp")])
y <- mtcars$mpg
<p></p>
#Fit ridge regression model </li>
model <- glmnet(x, y, alpha = 0)
<p></p>
<li>Summary of the model </li>
print(model)
<p></p>
<p></p>
<b><h3>5. Lasso Regression:</h3></b>
<li>Load necessary library </li>
library(glmnet)
<p></p>
<li>Load dataset </li>
data(mtcars)
<p></p>
<li>Prepare data </li>
x <- as.matrix(mtcars[, c("wt", "hp")])
y <- mtcars$mpg
<p></p>
<li>Fit lasso regression model </li>
model <- glmnet(x, y, alpha = 1)
<p></p>
<li>Summary of the model </li>
print(model)
<p></p>
<p></p>
<b><h3>6. Poisson Regression:</h3></b>
<li>Load necessary library </li>
library(ggplot2)
<p></p>
<li>Load dataset </li>
data(mtcars)
<p></p>
<li>Fit Poisson regression model </li>
model <- glm(qsec ~ wt + hp, data = mtcars, family = poisson)
<p></p>
<li>Summary of the model </li>
summary(model)
