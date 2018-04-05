<?php
	include_once 'dbh.php';
	
	$sqlget = "SELECT * FROM $project_name.restaurant";
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	
	echo "
			<table class='wrapper databaseTable'>
				<thead>
					<tr>
						<th>Restaurant Name</th>
						<th>Restaurant Food Rating</th>
						<th>Restaurant Mood Rating</th>
						<th>Restaurant Staff Rating</th>
						<th>Raters</th>
						<th>Restaurant Type</th>
						<th>Restaurant Website</th>
					<!--<th colspan='3'><a href='#'>Database</a></th>-->
					</tr>
				</thead>
				<tbody>
						";
	
	while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){ // fetches the data row by row
		$sqlgetraters = "SELECT R.restaurantid FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlratersdata = pg_query($conn, $sqlgetraters) or die('error getting data');
		$sqlgetfoodrating = "SELECT RA.food FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlfoodratingdata = pg_query($conn, $sqlgetfoodrating) or die('error getting data');
		$sqlgetmoodrating = "SELECT RA.mood FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlmoodratingdata = pg_query($conn, $sqlgetmoodrating) or die('error getting data');
		$sqlgetstaffrating = "SELECT RA.staff FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $row[restaurantid]";
		$sqlstaffratingdata = pg_query($conn, $sqlgetstaffrating) or die('error getting data');
		
		echo "<tr><td>";
		echo $row['restaurantname'];
		echo "</td><td>";
		echo pg_num_rows($sqlfoodratingdata);
		echo "</td><td>";
		echo pg_num_rows($sqlmoodratingdata);
		echo "</td><td>";
		echo pg_num_rows($sqlstaffratingdata);
		echo "</td><td>";
		echo pg_num_rows($sqlratersdata);
		echo "</td><td>";
		echo $row['restauranttype'];
		echo "</td><td>";
		echo $row['restaurantwebsite'];
		echo "</td><td>";
		echo "<button type=submit name=update value=update>EDIT</button></td>";
		echo "<td>" . "<button type=submit name=delete value=delete>DELETE</button></td>";
		echo "</td></tr>";	
	}
	
	echo "</tbody></table>";
	