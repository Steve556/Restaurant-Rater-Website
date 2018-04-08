<?php
	include_once 'dbh.php';
	
	if (isset($_POST['type'])){
		$sqlget = "SELECT * FROM $project_name.restaurant WHERE restauranttype='$_POST[type]'";
	} else if (isset($_POST['years']) && isset($_POST['months'])){
		$sqlget = "SELECT * 
				   FROM $project_name.restaurant AS R
                   WHERE R.restaurantid NOT IN (SELECT RA.restaurantid
						                    FROM $project_name.rating AS RA
						                    WHERE EXTRACT(YEAR FROM ratingdate) = '$_POST[years]' AND EXTRACT(MONTH FROM ratingdate) = '$_POST[months]');";
	} else if (isset($_GET['staffratingeffect'])){
		$int = (int)$_GET['staffratingeffect'];
		$sqlget = "	SELECT *
					FROM $project_name.restaurant AS R
					WHERE R.restaurantID IN (SELECT DISTINCT RA.restaurantid
												FROM $project_name.rating AS RA
												WHERE RA.staff < $int);
					";
	} else {
		$sqlget = "SELECT * FROM $project_name.restaurant";
	}
	
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	
	
	
	echo "
			<table class='wrapper'>
				<thead>
					<tr>
						<th>Restaurant Name</th>
						<th>Restaurant Food Rating</th>
						<th>Restaurant Mood Rating</th>
						<th>Restaurant Staff Rating</th>
						<th>Raters</th>
						<th>Restaurant Type</th>
						<th>Restaurant Location</th>
						<th>Manager name</th>
						<th>Established In</th>
						<th>Restaurant Website</th>
						<th>Controls</th>
					</tr>
				</thead>
				<tbody>
		";
		
	while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){ // fetches the data row by row
		$sqlgetraters = "SELECT R.restaurantid FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlratersdata = pg_query($conn, $sqlgetraters) or die('error getting data');
		$sqlgetfoodrating = "SELECT ROUND(AVG(RA.food), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlfoodratingdata = pg_query($conn, $sqlgetfoodrating) or die('error getting data');
		$sqlgetmoodrating = "SELECT ROUND(AVG(RA.mood), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlmoodratingdata = pg_query($conn, $sqlgetmoodrating) or die('error getting data');
		$sqlgetstaffrating = "SELECT ROUND(AVG(RA.staff), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlstaffratingdata = pg_query($conn, $sqlgetstaffrating) or die('error getting data');
		$sqlgetlocation = "SELECT * FROM $project_name.restaurant AS R INNER JOIN $project_name.location AS L ON R.restaurantid = L.restaurantid WHERE R.restaurantname ='$row[restaurantname]' AND R.restaurantid = '$row[restaurantid]'";
		$sqllocationdata = pg_query($conn, $sqlgetlocation) or die('error getting data');
		$row10 = pg_fetch_row($sqllocationdata);
		
		echo "<tr><td>";
		if (isset($_SESSION['u_id'])){
			echo "<a href='restaurant.php?restaurantid=".$row['restaurantid']."&userid=".$_SESSION['u_id']."'>$row[restaurantname] </a>";
		} else {
			echo "<a href='restaurant.php?restaurantid=".$row['restaurantid']."&userid=0'>$row[restaurantname] </a>";
		}
		echo "</td><td>";
		
		if(is_null(pg_fetch_result($sqlfoodratingdata, 0))){
			echo "No ratings";
		} else {
			echo pg_fetch_result($sqlfoodratingdata, 0);
		}
		echo "</td><td>";
		if(is_null(pg_fetch_result($sqlmoodratingdata, 0))){
			echo "No ratings";
		} else {
			echo pg_fetch_result($sqlmoodratingdata, 0);
		}
		echo "</td><td>";
		if(is_null(pg_fetch_result($sqlstaffratingdata, 0))){
			echo "No ratings";
		} else {
			echo pg_fetch_result($sqlstaffratingdata, 0);
		}
		echo "</td><td>";
		echo pg_num_rows($sqlratersdata);
		echo "</td><td>";
		echo $row['restauranttype'];
		echo "</td><td>";
		echo $row10[8];
		echo "</td><td>";
		echo $row10[6];
		echo "</td><td>";
		echo $row10[5];
		echo "</td><td>";
		echo $row['restaurantwebsite'];
		echo "</td><td>";
		if (isset($_SESSION['u_id'])){
			echo "<form action='includes/deleteRestaurant.php' method=POST>";
			echo "<input type=hidden name=hidden value='" . $row['restaurantid'] . "' </td>";
			echo "<input type=submit name=delete value=delete>";
			echo "</form>";
		}
		echo "</td></tr>";	
	}
	
	echo "</tbody></table>";
	
	echo "
			<br>
			<table class='wrapper'>
				<thead>
					<tr>
						<th>Restaurant Type</th>
		";
	$categories = array("Breakfast", "Lunch", "Soups", "Sides", "Starter", "Tacos", "NotTacos", "Dessert", "Cocktails", "Beer", "Wine", "Tequila", "Coffee", "Poutine", "Main");
	$restauranttypes = array("American", "British", "Canadian", "Caribbean", "Chinese", "French", "Greek", "Indian", "Italian" , "Japanese", "Mediterranean", "Mexican", "Moroccan", "Spanish", "Thai", "Turkish", "Vietnam");
	
	for ($x = 0; $x < sizeof($categories); $x++) {
		echo "<th>".$categories[$x]." Category</th>";
	}
	
	echo "</thead></tr><tbody>";
	
	for ($x = 0; $x < sizeof($restauranttypes); $x++){
		echo "<tr><td>".$restauranttypes[$x]."</td>";
		for ($y = 0; $y < sizeof($categories); $y++){
			$sqlstatement = "SELECT ROUND(AVG(avgprice),2) FROM (SELECT Menuitem.itemprice as avgprice, Menuitem.itemcategory as ItemCat FROM php_project.menuitem INNER JOIN php_project.restaurant ON Restaurant.restaurantid=MenuItem.restaurantID WHERE restauranttype='$restauranttypes[$x]' and itemcategory='$categories[$y]') menuitem";
			$sqldata1 = pg_query($conn, $sqlstatement) or die('error getting data');
			if (is_null(pg_fetch_result($sqldata1, 0))){
				echo "<td>0.00</td>";
			} else {
				echo "<td>".pg_fetch_result($sqldata1, 0)."</td>";
			}
		}
		echo "</tr>";		
	}
	echo "</tbody></table>";
	