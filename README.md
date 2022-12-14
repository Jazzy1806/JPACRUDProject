# JPACRUDProject

# Description

This is a dynamic web application that allows the user to search a database by category and continent to discover sites around the world. The sites are divided into scenic, historical, and odd. At the landing page, the user is given the option to search by continent or category, or add a new site. If the user searches by category, a grid of sites with small image thumbnails is rendered in a grid format. Clicking on an element in the grid will direct the user to the site details page, where they are given the option to edit the site info, delete the site, or add a new site. If the user chooses any of these options, they will be directed to the respective forms to confirm the details. If the user adds or edits a site, the new site information will be displayed. If they delete a site, an alert will notify the user of the successful deletion, and they will be directed back to the landing page. 

The database also stores lat/long coordinates which are fed into a Google Maps Javascript API to render a Google map of the region on the site's info page.

# Technologies used

MySQL - SQL - Gradle - Java - Spring MVC - Spring Tool Suite - Git - GitHub - CSS - HTML -  BootStrap - Google Maps Javascript API - Javascript - Java Server Pages



# Lessons Learned

This project solidified my understanding of the persistence, service, and presentation layers. Using various methods for mapping and rendering data from MySql using Java expression language enabled a dynamic, responsive application which easily anticipates the user's needs and provided multiple navigation options. 

The toughest obstacle I faced during this project build was figuring out how to incorporate the Google Maps API and feed the database coordinates to it. It involved executing javascript from within a .jsp file, which took a bit of research to get right. For the locations which have accurate coordinates, the map function works well. Some of the coordinates are incorrect in the database, which would require additional user input and verification methods which I did not have time to include in this cycle. All in all, this was an excellent learning experience and I feel as though I have a much deeper grasp of full stack applications.
