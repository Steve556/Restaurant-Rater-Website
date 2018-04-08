<?php

include_once '../dbh.php';

$itemName = $_POST['itemName'];
$itemType = $_POST['itemType'];
$itemCategory = $_POST['itemCategory'];
$itemDescription = $_POST['itemDescription'];
$itemPrice = $_POST['itemPrice'];
$restaurant = $_POST['restaurant'];

if(empty($itemName) || empty($itemType) || empty($itemCategory) || empty($itemDescription) || empty($itemPrice) || empty($restaurant)){
    header('Location: ../index.php?error=emptyFormSubmitted');
    exit();
} else {
	$sql = "SELECT * 
			FROM $project_name.menuitem AS M
				INNER JOIN $project_name.restaurant AS R ON R.restaurantid = M.restaurantid
			WHERE M.itemname ='$itemName' AND R.restaurantname = '$restaurant'";
    $result = pg_query($conn, $sql);
	
	if (pg_num_rows($result) > 0){
		header('Location: ../menuitems.php?error=itemAlreadyExistsAtThisRestaurant');
		exit();
	} else {
		$sql = "SELECT restaurantid 
				FROM $project_name.restaurant AS R  
				WHERE restaurantname ='$restaurant'";
		$result = pg_query($conn, $sql);
		
		while($row = pg_fetch_array($result, NULL, PGSQL_ASSOC)){
			$sql1 = "	INSERT INTO $project_name.Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) 
						VALUES ('$itemName', '$itemType', '$itemCategory', '$itemDescription', '$itemPrice', ".(int)$row['restaurantid'].");";
			$result1 = pg_query($conn, $sql1);
		}
		header('Location: ../menuitems.php?add=successAddingNewMenuItem');
	}
}
 