<?php
    include_once 'header.php';
	include_once 'dbh.php';
	
	$sql = "SELECT * FROM $project_name.restaurant WHERE restaurantid = $_GET[restaurantid]";
	$sqldata = pg_query($conn, $sql) or die('error getting data');
	$row = pg_fetch_row($sqldata);
	$sqlforlocationtable = "SELECT * FROM $project_name.location WHERE restaurantid = $_GET[restaurantid]";
	$sqllocationdata = pg_query($conn, $sqlforlocationtable) or die('error getting data');
	$locationrow = pg_fetch_row($sqllocationdata);
	$sqlgetotherlocations = "SELECT L.streetaddress FROM $project_name.restaurant AS R INNER JOIN $project_name.location AS L ON R.restaurantid = L.restaurantid WHERE R.restaurantid = $_GET[restaurantid] AND restaurantname ='$row[1]'";
	$sqlotherlocationsdata = pg_query($conn, $sqlgetotherlocations) or die('error getting data');
	$sqlgetratings = "SELECT * FROM $project_name.RATING AS R INNER JOIN $project_name.RESTAURANT AS RA ON R.restaurantid = RA.restaurantid INNER JOIN $project_name.RATER AS RAT ON RAT.userid = R.userid WHERE R.restaurantid = $_GET[restaurantid]";
	$sqlratingdata = pg_query($conn, $sqlgetratings) or die('error getting data');
	$sqlgetfoodrating = "SELECT ROUND(AVG(RA.food), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $_GET[restaurantid]";
	$sqlfoodratingdata = pg_query($conn, $sqlgetfoodrating) or die('error getting data');
	$sqlgetmoodrating = "SELECT ROUND(AVG(RA.mood), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $_GET[restaurantid]";	
	$sqlmoodratingdata = pg_query($conn, $sqlgetmoodrating) or die('error getting data');
	$sqlgetstaffrating = "SELECT ROUND(AVG(RA.staff), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $_GET[restaurantid]";
	$sqlstaffratingdata = pg_query($conn, $sqlgetstaffrating) or die('error getting data');
	
	echo "
		<br>
        <br>
		<div class = 'wrapper'>
            <div class = 'layoutleft'>
                <div class = 'block'>
                    <text> <b>$row[1]</b> </text><br><br>
					<div id='restaurantimage'></div>
                </div>
				<div class = 'clear block restaurantlocations'>
                    <ul>
                        <li><b>Restaurant Ratings</b></li>
		";
		if(is_null(pg_fetch_result($sqlfoodratingdata, 0))){
			echo "<li>No ratings</li>";
		} else {
			echo "<li>Food: ".pg_fetch_result($sqlfoodratingdata, 0)."</li>";
		}
		echo "</td><td>";
		if(is_null(pg_fetch_result($sqlmoodratingdata, 0))){
			echo "<li>No ratings</li>";
		} else {
			echo "<li>Mood: ".pg_fetch_result($sqlmoodratingdata, 0)."</li>";
		}
		echo "</td><td>";
		if(is_null(pg_fetch_result($sqlstaffratingdata, 0))){
			echo "<li>No ratings</li>";
		} else {
			echo "<li>Staff: ".pg_fetch_result($sqlstaffratingdata, 0)."</li>";
		}
	echo "	
					</ul>
                </div>
				<div class = 'clear block userInfo'>
                    <ul>
                        <li>Phone number: $locationrow[3]</li>
                        <li>Cuisines: $row[2]</li>
						<li>Opening hours: $locationrow[5] - $locationrow[6]</li>
						<li>Location: $locationrow[4]</li>
						<li>Website: <a href='$row[3]' target='_blank'>$row[3]</a></li>
						<li>Established in: $locationrow[1]</li>
                    </ul>
                </div>
                <div class = 'clear block restaurantlocations'>
                    <ul>
                        <li><b>All locations</b></li>
		";
					while($row1 = pg_fetch_array($sqlotherlocationsdata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the locations of restaurant
						echo "<li>$row1[streetaddress]</li>";
					}
	echo "
                    </ul>
                </div>
            
            </div>
            <div class = 'layoutcenter'>
                <div class = 'tabs'>
                    <ul>
                        <li><a href='restaurant.php?restaurantid=$_GET[restaurantid]'>Menu</a></li>
                        <li><a href='restaurantwithreviews.php?restaurantid=$_GET[restaurantid]'>Recent Reviews</a></li>
                    </ul>
                </div>				
		";
				while($row2 = pg_fetch_array($sqlratingdata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the ratings of the restaurant
						echo "<div class = 'commentbox clear'>
								<img src='https://png.pngtree.com/element_origin_min_pic/17/07/21/7507595ce4bd95c7f36f43332c6a5647.jpg' alt='Smiley face' height='42' width='42' align='left'>
								<br>$row2[firstname] $row2[lastname] (<b>$row2[username]</b>)<br><br><br>
								<b>Rated</b>: &nbsp <u>Price</u>: $row2[price] &nbsp <u>Food</u>: $row2[food] &nbsp <u>Mood</u>: $row2[mood] &nbsp <u>Staff</u>: $row2[staff] <br><br>
								
								<p><b>Commented:</b> <br><br> '' $row2[comments] ''
								</p>
								</div><br>";
				}
	echo "
                
            </div>
            
        </div>
	";
	
	