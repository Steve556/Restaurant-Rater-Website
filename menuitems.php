<?php
	include_once 'dbh.php';
	include_once 'header.php';
	include_once 'controls.php';
	
	$sqlget = "SELECT * FROM $project_name.menuitem";
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	
	echo "
			<table class='wrapper'>
				<thead>
					<tr>
						<th>Item name</th>
						<th>Item type</th>
						<th>Item category</th>
						<th>Item description</th>
						<th>Item price</th>
						<th>Controls</th>
					</tr>
				</thead>
				<tbody>
		";
		
	while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){ // fetches the data row by row
				
		echo "<tr><td>";
		if (isset($_SESSION['u_id'])){
			echo "<a href='menuitem.php?itemid=".$row['itemid']."&useridloggedin=".$_SESSION['u_id']."'>$row[itemname] </a>";
		} else {
			echo "<a href='menuitem.php?itemid=".$row['itemid']."&useridloggedin=0'>$row[itemname] </a>";
		}
		echo "</td><td>";
		echo $row['itemtype'];
		echo "</td><td>";
		echo $row['itemcategory'];
		echo "</td><td>";
		echo $row['itemdescription'];
		echo "</td><td>";
		echo $row['itemprice'];
		echo "</td><td>";
		if (isset($_SESSION['u_id'])){
			echo "<form action='includes/deleteMenuitem.php' method=POST>";
			echo "<input type=hidden name=hidden value='" . $row['itemid'] . "' </td>";
			echo "<input type=submit name=delete value=delete>";
			echo "</form>";
		}
		echo "</td></tr>";	
	}
	
	echo "</tbody></table>";