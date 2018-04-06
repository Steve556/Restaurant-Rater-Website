<?php

include_once '../dbh.php';

$restaurantName = $_POST['name'];
$restaurantType = $_POST['type'];
$restaurantWebsite = $_POST['website'];
$restaurantAddress = $_POST['address'];

if(empty($restaurantName) || empty($restaurantType) || empty($restaurantWebsite)){
    header('Location: ../index.php?error=emptyFormSubmitted');
    exit();
} else {
    $sql = "SELECT * FROM $project_name.restaurant AS R INNER JOIN $project_name.location AS L ON R.restaurantid = L.restaurantid WHERE restaurantname ='$restaurantName'";
    $result = pg_query($conn, $sql);
    $restaurantcheck = pg_num_rows($result);
    if ($restaurantcheck > 0){ // checks if restaurant exists already
		//check location
		$sql = "SELECT * FROM $project_name.restaurant AS R INNER JOIN $project_name.location AS L ON R.restaurantid = L.restaurantid WHERE L.streetaddress = '$restaurantAddress' AND restaurantname ='$restaurantName'";
		$result = pg_query($conn, $sql);
		$locationcheck = pg_num_rows($result);
		if($locationcheck > 0) { // checks if the location already exists
			header('Location: ../index.php?error=restaurantLocationAlreadyExists');
			exit(); 
		} else {
			//Insert user into database
			$sql = "INSERT INTO $project_name.restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('$restaurantName','$restaurantType', '$restaurantWebsite')";
			$result = pg_query($conn, $sql);
			$sql = "SELECT restaurantid FROM $project_name.restaurant AS R WHERE R.restaurantname ='$restaurantName' ORDER BY R.restaurantid DESC;";
			$result = pg_query($conn, $sql);
			$restaurantid = pg_fetch_result($result, 0);
			echo $restaurantid;
			$sql = "INSERT INTO $project_name.location (firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES ('04/05/2018','lol', '613', '$restaurantAddress', 6, 12, '$restaurantid')";
			$result = pg_query($conn, $sql);		
			header('Location: ../index.php?add=successInAddingOtherLocation');
		}          
    } else {
		if(!preg_match("/^[a-zA-Z]*$/", $restaurantName) || !preg_match("/^[a-zA-Z]*$/", $restaurantType)){
			header('Location: ../index.php?error=invalidNameOrType');
			exit();
		} else {
			//Insert user into database
			$sql = "INSERT INTO $project_name.restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('$restaurantName','$restaurantType', '$restaurantWebsite')";
			$result = pg_query($conn, $sql);
			$sql = "SELECT restaurantid FROM $project_name.restaurant AS R WHERE R.restaurantname ='$restaurantName'";
			$result = pg_query($conn, $sql);
			$restaurantid = pg_fetch_result($result, 0);
			$sql = "INSERT INTO $project_name.location (firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES ('04/05/2018','lol', '613', '$restaurantAddress', 6, 12, '$restaurantid')";
			$result = pg_query($conn, $sql);
			header('Location: ../index.php?add=successAddingNewRestaurant');
		}
    }
} 