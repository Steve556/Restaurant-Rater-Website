<?php
    include_once 'header.php';
	include_once 'dbh.php';
	
	$sqlget = "SELECT * FROM $project_name.menuitem WHERE itemid = $_GET[itemid]";
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	$row = pg_fetch_row($sqldata);
	
	//make this find ratings for menuitem
	$sqlratings = "	SELECT R.userid 
					FROM php_project.rater AS R
						INNER JOIN php_project.ratingitem AS RA ON R.userid = RA.userid
					WHERE R.userid = 1";
	$sqlratingsdata = pg_query($conn, $sqlratings) or die('error getting data');
	
	//find restaurants that use this item
	$sqlrestaurants = "	SELECT *
						FROM php_project.menuitem AS M
							INNER JOIN php_project.ratingitem AS RA ON RA.itemid = M.itemid
							INNER JOIN php_project.restaurant AS R ON R.restaurantid = M.restaurantid
						WHERE M.itemid = $_GET[itemid]";
	$sqlrestaurantsdata = pg_query($conn, $sqlrestaurants);
	
	echo "
		<br>
        <br>
		<div class = 'wrapper'>
            <div class = 'layoutleft'>
                <div class = 'block'>
                    <text> <b>$row[1]</b> </text><br><br>
					<div id='restaurantimage'></div>
                </div>
				<div class = 'clear block userInfo'>
                    <ul>
                        <li>Number of ratings: &nbsp"; 
						echo pg_num_rows($sqlratingsdata);
	echo "				</li>
                        <li>Item type: $row[2]</li>
						<li>Item category: $row[3]</li>
                        <li>Item Description: $row[4]</li>
						<li>Item Price: $ $row[5]</li>
                    </ul>
                </div>
                <div class = 'clear block userActivity'>
                    <ul>
                        <li><b>Restaurants with item</b></li>
                    </ul>
		";
				//find restaurants that use menu item
				while($row1 = pg_fetch_array($sqlrestaurantsdata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the locations of restaurant
					echo "<li>$row1[restaurantname]</li>";
				}
    echo"       </div>
       
            </div>
            <div class = 'layoutcenter'>
                <div class = 'tabs'>
                    <text>Recent Reviews</text>
                </div>                
            </div>
            
        </div>
	";