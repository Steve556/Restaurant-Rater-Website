We got noticed last day that we were supposed to submit a separate SQL sheet.
We didn't have time to do it but we did implement everything to website.
The project description says that we are only supposed to submit the source code...

HOW TO USE PROJECT

-Load up script.sql to pgadmin
-Use xampp or have apache installed to start project
-Everything should be working fine. All users have password as 'password'


-------------------------------------------------------------------------------------------------------------

SQL Query for Part F /w test case restaurantname='Allium'

SELECT ROUND(AVG(total.price),2), ROUND(AVG(total.food),2), ROUND(AVG(total.mood),2), ROUND(AVG(total.staff),2) FROM (SELECT * FROM php_project.rating 
	INNER JOIN php_project.rater ON Rater.userid=Rating.userid
		INNER JOIN php_project.restaurant ON Rating.restaurantid=Restaurant.restaurantid
			WHERE restaurantname='Allium') as total

-- Displays total of the ratings between food,price,staff and mood of a particular restaurant.