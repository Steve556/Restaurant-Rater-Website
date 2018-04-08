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
	
	$sqlgetratings = "	SELECT * 
						FROM php_project.RATINGITEM AS R 
							INNER JOIN php_project.RATER AS RAT ON RAT.userid = R.userid 
						WHERE R.itemid = $_GET[itemid]";
	$sqlratingdata = pg_query($conn, $sqlgetratings) or die('error getting data');
	
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
					<br>
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
		";
			while($row2 = pg_fetch_array($sqlratingdata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the ratings of the restaurant
				echo "	<div class = 'commentbox clear'>
						<img src='https://png.pngtree.com/element_origin_min_pic/17/07/21/7507595ce4bd95c7f36f43332c6a5647.jpg' alt='Smiley face' height='42' width='42' align='left'>
						<br>$row2[firstname] $row2[lastname] (<b>$row2[username]</b>) <br><br><br>
						<b>Rated</b>: &nbsp $row2[rating] <br><br>
						<p><b>Commented:</b> <br><br> '' $row2[ratingcomment] ''
						</p>
						</div><br>";
			}
		echo "


				
            </div>
		
            
        </div>
	";