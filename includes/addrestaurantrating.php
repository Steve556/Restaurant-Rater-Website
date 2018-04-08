<?php

include_once '../dbh.php';

$pricerating = $_POST['pricerating'];
$foodrating = $_POST['foodrating'];
$moodrating = $_POST['moodrating'];
$staffrating = $_POST['staffrating'];
$comments = $_POST['comments'];

if(empty($pricerating) || empty($foodrating) || empty($moodrating) || empty($staffrating) || empty($comments)){
    header("Location: ../restaurant.php?restaurantid=$_GET[restaurantid]&userid=$_GET[userid]&error=emptyFormSubmitted");
    exit();
} else {    
	if(!preg_match("/^[1-5]*$/", $pricerating) || !preg_match("/^[1-5]*$/", $foodrating) || !preg_match("/^[1-5]*$/", $moodrating) || !preg_match("/^[1-5]*$/", $staffrating)){
		header("Location: ../restaurant.php?restaurantid=$_GET[restaurantid]&userid=$_GET[userid]&error=emptyFormSubmitted");
		exit();
	} else {
		//Insert user into database
		$sql = "INSERT INTO $project_name.rating (userid, ratingdate, price, food, mood, staff, comments, restaurantid) VALUES ($_GET[userid] ,CURRENT_DATE, '$pricerating', '$foodrating', '$moodrating', '$staffrating', '$comments', $_GET[restaurantid])";
		$result = pg_query($conn, $sql);
		header("Location: ../restaurant.php?restaurantid=$_GET[restaurantid]&userid=$_GET[userid]&add=successInAddingRestaurantRating");
	}
} 