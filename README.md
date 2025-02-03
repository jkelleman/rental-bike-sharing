# rental-bike-sharing
Rental Bike Sharing in DC (2011-2012)


# rental-bike-sharing
Rental Bike Sharing in DC (2011-2012)

**Context**
Bike sharing systems are like the modern version of traditional bike rentals, but everything is automated. You can easily rent a bike from one spot and return it to another. There are over 500 bike-sharing programs worldwide with more than 500,000 bikes. These systems are gaining popularity because they help with traffic, environmental, and health issues.

What's cool about bike sharing systems is the data they generate. Unlike buses or subways, they record the exact travel duration and positions. This makes them like a virtual sensor network for city mobility. By monitoring this data, we can detect important events in the city. 

This dataset includes hourly and daily bike rental counts from 2011 to 2012 in Washington, DC, along with weather and seasonal info.


**About the dataset**
The dataset contains the hourly and daily count of rental bikes from the Capital bikeshare system in Washington, DC, covering the years 2011 and 2012. It includes corresponding weather and seasonal information, making it a rich source for analyzing bike rental patterns and their correlation with various factors1.

The dataset is multivariate and includes 13 features such as:

<li> **Date:** The date of the observation. </li>
<li>**Season:** Categorical values representing winter, spring, summer, and fall. Season (1:springer, 2:summer, 3:fall, 4:winter)</li>
<li>**Year:** Encoded as 0 for 2011 and 1 for 2012. Year (0: 2011, 1:2012).</li>
<li>**Month:** Categorical values from 1 to 12. Month (1 to 12).</li>
<li>**Hour:** Categorical values from 0 to 23. Hour (0 to 23).</li>
<li>**Holiday:** Binary value indicating whether the day is a holiday (extracted from Holiday Schedule).</li>
<li>**Weekday:** Categorical values representing the day of the week. If day is neither weekend nor holiday is 1, otherwise is 0.</li>
<li>**Working day:** Binary value indicating whether the day is a working day.</li>
<li>**Weather situation:** Categorical values representing different weather conditions.</li>
      <li>**weathersit:** (extracted from Freemeteo)</li>
     <li> 1: Clear, Few clouds, Partly cloudy, Partly cloudy</li>
      <li>2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist</li>
      <li>3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds</li>
      <li>4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog</li>
<li>**Temperature:** Normalized temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-8, t_max=+39 (only in hourly scale).</li>
<li>**atemp**: Normalized feeling temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-16, t_max=+50 (only in hourly scale)</li>
<li>**hum:** Normalized humidity. The values are divided to 100 (max)</li>
<li>**windspeed:** Normalized wind speed. The values are divided to 67 (max)</li>
<li>**casual:** count of casual users</li>
<li>**registered:** count of registered users</li>
<li>**cnt:** count of total rental bikes including both casual and registered</li>


This dataset is particularly interesting because it records the exact travel duration and positions, turning the bike-sharing system into a virtual sensor network for city mobility. By monitoring this data, important events in the city can be detected.

Both hour.csv and day.csv have the following fields, except hr which is not available in day.csv