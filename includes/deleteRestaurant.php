<?php

include_once '../dbh.php';

if(isset($_POST['delete'])){
		$DeleteQuery = "DELETE FROM $project_name.restaurant WHERE restaurantid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
		$DeleteQuery = "DELETE FROM $project_name.location WHERE restaurantid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
		$DeleteQuery = "DELETE FROM $project_name.rating WHERE restaurantid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
		$DeleteQuery = "DELETE FROM $project_name.ratingitem WHERE itemid IN (	SELECT itemid
																				FROM php_project.menuitem
																				WHERE restaurantid ='$_POST[hidden]');";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
		$DeleteQuery = "DELETE FROM $project_name.menuitem WHERE restaurantid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
}

header('Location: ../index.php?restaurant=deleted');
exit();