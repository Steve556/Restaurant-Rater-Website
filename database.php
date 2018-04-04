<?php
	include_once 'dbh.php';
	
	$sqlget = "SELECT firstName FROM $project_name.rater";
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	
	echo "
			<br>
			<br>
			<table class='wrapper databaseTable'>
				<thead>
					<tr>
						<th>Restaurant Name</th>
						<th>Restaurant Rating</th>
						<th>Raters</th>
						<th>Restaurant Type</th>
						<th>Restaurant Website</th>
					<!--<th colspan='3'><a href='#'>Database</a></th>-->
					</tr>
				</thead>
				<tbody>
						";
	
	while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){ // fetches the data row by row
		echo "<tr><td>";
		echo $row['firstname'];
		//echo "</td><td>";
		//echo $row['restauranttype'];
		//echo "</td><td>";
		//echo $row['restaurantwebsite'];
		echo "</td></tr>";	
	}
	
	echo "</tbody></table>";	
	
	
?>