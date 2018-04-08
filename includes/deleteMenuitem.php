<?php

include_once '../dbh.php';

if(isset($_POST['delete'])){
		$DeleteQuery = "DELETE FROM $project_name.menuitem WHERE itemid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
		$DeleteQuery = "DELETE FROM $project_name.ratingitem WHERE itemid ='$_POST[hidden]';";       
		pg_query($conn , $DeleteQuery) or die('error getting data');
}

header('Location: ../menuitems.php?item=deleted');
exit();