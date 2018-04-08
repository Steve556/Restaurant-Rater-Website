<?php

include_once '../dbh.php';

if(isset($_POST['delete'])){
		$DeleteQuery = "DELETE FROM $project_name.rating WHERE userid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
		$DeleteQuery = "DELETE FROM $project_name.rater WHERE userid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
		$DeleteQuery = "DELETE FROM $project_name.ratingitem WHERE userid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
}

header('Location: ../raters.php?user=deleted');
exit();