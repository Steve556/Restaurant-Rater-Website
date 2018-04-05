<?php

include_once '../dbh.php';

$restaurantName = $_POST['name'];
$restaurantType = $_POST['type'];
$restaurantWebsite = $_POST['website'];
//$restaurantAddress = $_POST['pwd1'];

if(empty($restaurantName) || empty($restaurantType) || empty($restaurantWebsite)){
    header('Location: ../index.php?error=emptyFormSubmitted');
    exit();
} else {
    $sql = "SELECT username FROM $project_name.restaurant WHERE restaurantName ='$restaurantName'";
    $result = pg_query($conn, $sql);
    $restaurantcheck = pg_num_rows($result);
    if ($restaurantcheck > 0){
		//check location
        header('Location: ../signup.php?error=usernameExists');
        exit();   
    } else {
		if(!preg_match("/^[a-zA-Z]*$/", $restaurantName) || !preg_match("/^[a-zA-Z]*$/", $restaurantType)){
			header('Location: ../index.php?error=invalidNameOrType');
			exit();
		} else {
			//Insert user into database
			$sql = "INSERT INTO $project_name.restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('$restaurantName','$restaurantType', '$restaurantWebsite')";
			$result = pg_query($conn, $sql);
			header('Location: ../index.php?add=success');
		}
    }
} 