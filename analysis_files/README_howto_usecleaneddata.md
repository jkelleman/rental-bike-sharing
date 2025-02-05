# Jen Kelleman
# Data Science Capstone


<h1>How to bring in "cleaned data"</h1>
To bring in "cleaned data" from one R script into another R script in RStudio, you can use the source() function. This function allows you to run an R script from within another R script, effectively importing the cleaned data and any other objects or functions defined in the first script.

Here's a step-by-step guide: 

Save your cleaned data script: Ensure that your cleaned data script is saved as a .R file. For example, let's call it cleaned_data.R.

Use the source() function: In your analysis script, use the source() function to run the cleaned data script. This will load all the objects, including the cleaned data, into your current R session.

Here's an example:
# In your analysis script
# Load the cleaned data script
source("path/to/your/cleaned_data.R")

# Now you can use the cleaned data for analysis
# For example, if your cleaned data is stored in a variable called cleaned_data
summary(cleaned_data)



Make sure to replace "path/to/your/cleaned_data.R" with the actual path to your cleaned data script.

If you want to ensure that the script is only sourced if it hasn't been already, you can use an if statement to check for the existence of a specific object:

# Check if the cleaned data exists
if (!exists("cleaned_data")) {
  source("path/to/your/cleaned_data.R")
}

# Proceed with your analysis
summary(cleaned_data)


This approach helps avoid reloading the script unnecessarily if the data is already available in your environment.

References:
<li> Statistics Globe article - https://statisticsglobe.com/run-r-script-within-other-scripts</li>
<li> Youtube: Basics of using R studio - https://www.youtube.com/watch?v=FIrsOBy5k58</li>