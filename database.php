<?php
	include 'dbh.php';
	
	$sqlget = "SELECT firstName FROM $project_name.rater";
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	
	echo "
			<table class='wrapper databaseTable'>
				<thead>
					<th colspan='1'><a href='#'>Advanced tools</a></th>
				</thead>
				<tbody>
					<tr>
						<th>Restaurant Name</th>
						<th>Restaurant Type</th>
						<th>Restaurant Website</th>";
	
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