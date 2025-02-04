# rental-bike-sharing
Rental Bike Sharing in DC (2011-2012)


<h1># rental-bike-sharing</h1>
Rental Bike Sharing in DC (2011-2012)

<h2>**Context**</h2>
Bike sharing systems have become very popular in many cities, allowing people to easily rent a bike from one location and return it at another. These systems are praised for their benefits in reducing traffic, improving the environment, and promoting health. Additionally, they collect a lot of user data, making them valuable for studying city mobility patterns.

What's cool about bike sharing systems is the data they generate. Unlike buses or subways, they record the exact travel duration and positions. This makes them like a virtual sensor network for city mobility. By monitoring this data, we can detect important events in the city. 

My project focuses on a bike sharing system in Washington, D.C., with records of bike trips in two-hour intervals over a two-year period (2011-2012). The data includes details about each interval, such as weather conditions, the day of the week, temperature, humidity, and windspeed. The main goal is to analyze how the number of bike users has changed over time and how environmental factors influence bike usage.


<h2>About the dataset</h2>
The dataset contains the hourly and daily count of rental bikes from the Capital bikeshare system in Washington, DC, covering the years 2011 and 2012. It includes corresponding weather and seasonal information, making it a rich source for analyzing bike rental patterns and their correlation with various factors.

The dataset is multivariate and includes 13 features such as:

<li><b>Date:</b>The date of the observation. </li>
<li><b>Season:</b>Categorical values representing winter, spring, summer, and fall. Season (1:springer, 2:summer, 3:fall, 4:winter)</li>
<li><b>Year:</b>Encoded as 0 for 2011 and 1 for 2012. Year (0: 2011, 1:2012).</li>
<li><b>Month:</b>Categorical values from 1 to 12. Month (1 to 12).</li>
<li><b>Hour:</b>Categorical values from 0 to 23. Hour (0 to 23).</li>
<li><b>Holiday:</b>Binary value indicating whether the day is a holiday (extracted from Holiday Schedule).</li>
<li><b>Weekday:</b>Categorical values representing the day of the week. If day is neither weekend nor holiday is 1, otherwise is 0.</li>
<li><b>Working day:</b>Binary value indicating whether the day is a working day.</li>
<li><b>Weather situation:</b>Categorical values representing different weather conditions.</li>
      <li><b>weathersit:</b>extracted from Freemeteo)</li>
     <li><b>1:</b>Clear, Few clouds, Partly cloudy, Partly cloudy</li>
      <li><b>2:</b>Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist</li>
      <li><b>3:</b>Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds</li>
      <li><b>4:</b>Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog</li>
<li><b>Temperature:</b>Normalized temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-8, t_max=+39 (only in hourly scale).</li>
<li><b>Atemp:</b>Normalized feeling temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-16, t_max=+50 (only in hourly scale)</li>
<li><b>Humidity:</b>Normalized humidity. The values are divided to 100 (max)</li>
<li><b>Windspeed:</b>Normalized wind speed. The values are divided to 67 (max)</li>
<li><b>Casual:</b>The count of casual users</li>
<li><b>Registered:</b>The count of registered users</li>
<li><b>Count:</b>The count of total rental bikes including both casual and registered</li>


This dataset is particularly interesting because it records the exact travel duration and positions, turning the bike-sharing system into a virtual sensor network for city mobility. By monitoring this data, important events in the city can be detected.

Both hour.csv and day.csv have the following fields, except hr which is not available in day.csv