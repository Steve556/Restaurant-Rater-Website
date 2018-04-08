<?php

include_once '../dbh.php';

$rating = $_POST['rating'];
$comments = $_POST['comments'];

if(empty($rating) || empty($comments)){
    header("Location: ../menuitem.php?itemid=$_GET[itemid]&useridloggedin=$_GET[userid]&error=emptyFormSubmitted");
    exit();
} else {    
	if(!preg_match("/^[1-5]*$/", $rating)){
		header("Location: ../menuitem.php?itemid=$_GET[itemid]&useridloggedin=$_GET[userid]&error=invalidInput");
		exit();
	} else {
		//Insert menu item into database
		$sql = "INSERT INTO $project_name.ratingitem (userid, ratingdate, itemid, rating, ratingcomment) 
				VALUES ($_GET[userid] , CURRENT_DATE, $_GET[itemid], '$rating', '$comments')";
		$result = pg_query($conn, $sql);
		header("Location: ../menuitem.php?itemid=$_GET[itemid]&useridloggedin=$_GET[userid]&add=successAddedNewMenuItemRating");
	}
} 