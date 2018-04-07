-- Part D

--First Statement is used in Query from Pgadmin, the second is used in the actual SQL/PHP
SELECT Menuitem.itemname as ItemName, MenuItem.itemprice as MaxPrice, Location.managername as ManagerName, Location.openinghour as OpenHours, Restaurant.restaurantwebsite as RestURL FROM php_project.menuitem INNER JOIN php_project.Location ON Menuitem.restaurantid=Location.restaurantid INNER JOIN php_project.Restaurant ON Menuitem.restaurantid=Restaurant.restaurantid WHERE Menuitem.restaurantid = '$_GET[restaurantid]' and itemprice = (SELECT MAX(itemprice) FROM php_project.menuitem WHERE restaurantid = '$_GET[restaurantid]')  
SELECT Menuitem.itemname as ItemName, MenuItem.itemprice as MaxPrice, Location.managername as ManagerName, Location.openinghour as OpenHours, Restaurant.restaurantwebsite as RestURL FROM $php_project.menuitem INNER JOIN $php_project.Location ON Menuitem.restaurantid=Location.restaurantid INNER JOIN $php_project.Restaurant ON Menuitem.restaurantid=Restaurant.restaurantid WHERE Menuitem.restaurantid = '$_GET[restaurantid]' and itemprice = (SELECT MAX(itemprice) FROM $php_project.menuitem WHERE restaurantid = '$_GET[restaurantid]')  

-- Part E

SELECT ROUND(AVG(avgprice),2) FROM (SELECT Menuitem.itemprice as avgprice, Menuitem.itemcategory as ItemCat FROM php_project.menuitem INNER JOIN php_project.restaurant ON Restaurant.restaurantid=MenuItem.restaurantID WHERE restauranttype='Italian' and itemcategory='Breakfast') menuitem