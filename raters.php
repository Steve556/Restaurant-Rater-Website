<?php
	include_once 'dbh.php';
	include_once 'header.php';
	include_once 'controls.php';
	
	$sqlget = "SELECT * FROM $project_name.rater";
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	
	echo "
			<table class='wrapper'>
				<thead>
					<tr>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email Address</th>
						<th>User type</th>
						<th>Reputation</th>
						<th>Join-date</th>
						<th>Controls</th>
					</tr>
				</thead>
				<tbody>
		";
		
	while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){ // fetches the data row by row
		
		echo "<tr><td>";
		if (isset($_SESSION['u_id'])){
			echo "<a href='profile.php?userid=".$row['userid']."&useridloggedin=".$_SESSION['u_id']."'>$row[username] </a>";
		} else {
			echo "<a href='profile.php?userid=".$row['userid']."&useridloggedin=0'>$row[username] </a>";
		}
		echo "</td><td>";
		echo $row['firstname'];
		echo "</td><td>";
		echo $row['lastname'];
		echo "</td><td>";
		echo $row['emailaddress'];
		echo "</td><td>";
		echo $row['usertype'];
		echo "</td><td>";
		echo $row['reputation'];
		echo "</td><td>";
		echo $row['joindate'];
		echo "</td><td>";
		if (isset($_SESSION['u_id'])){
			echo "<form action='includes/deleteUser.php' method=POST>";
			echo "<input type=hidden name=hidden value='" . $row['userid'] . "' </td>";
			echo "<input type=submit name=delete value=delete>";
			echo "</form>";
		}
		echo "</td></tr>";	
	}
	
	echo "</tbody></table>";