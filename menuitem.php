<?php
    include_once 'header.php';
	include_once 'dbh.php';
	
	$sqlget = "SELECT * FROM $project_name.menuitem WHERE itemid = $_GET[itemid]";
	$sqldata = pg_query($conn, $sqlget) or die('error getting data');
	$row = pg_fetch_row($sqldata);
	
	//make this find ratings for menuitem
	$sqlratings = "	SELECT R.userid 
					FROM $project_name.rater AS R
						INNER JOIN $project_name.ratingitem AS RA ON R.userid = RA.userid
						WHERE RA.itemid = ".$_GET['itemid']."";
	$sqlratingsdata = pg_query($conn, $sqlratings) or die('error getting data');
	
	//find restaurants that use this item
	$sqlrestaurants = "	SELECT *
						FROM $project_name.menuitem AS M
							INNER JOIN $project_name.restaurant AS R ON R.restaurantid = M.restaurantid
						WHERE M.itemname =  (SELECT DISTINCT itemname
											FROM $project_name.menuitem AS L
										    WHERE L.itemid = $_GET[itemid])";
	$sqlrestaurantsdata = pg_query($conn, $sqlrestaurants);
	
	$sqlgetratings = "	SELECT * 
						FROM $project_name.RATINGITEM AS R 
							INNER JOIN $project_name.RATER AS RAT ON RAT.userid = R.userid 
						WHERE R.itemid = $_GET[itemid]";
	$sqlratingdata = pg_query($conn, $sqlgetratings) or die('error getting data');
	
	$sqlgetuserrating = "	SELECT * 
							FROM $project_name.ratingitem AS R
								INNER JOIN $project_name.rater as RA ON R.userid = RA.userid
							WHERE RA.userid = $_GET[useridloggedin] AND R.itemid = $_GET[itemid]";
	$sqluserratingdata = pg_query($conn, $sqlgetuserrating) or die('error getting data');
	
	echo "
		<br>
        <br>
		<div class = 'wrapper'>
            <div class = 'layoutleft'>
                <div class = 'block'>
		";
					if (isset($_SESSION['u_id']) & pg_num_rows($sqluserratingdata) < 1){					
						echo "
								<form action='menuitem.php?itemid=$_GET[itemid]&useridloggedin=$_GET[useridloggedin]' method='POST'>
									<button type='submit' class='btn' name='rate'>Rate Me!</button><br><br>
								</form>
							";
					}
	echo "
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
    echo"       </div></div>";
       
			if(isset($_POST['rate'])){
					echo "
						<div class = 'layoutcenter'>
							<div class='fillableForm'>
								<form action='includes/addmenuitemrating.php?itemid=$_GET[itemid]&userid=$_SESSION[u_id]' method='POST'>
									<fieldset class='field_set'>
										<legend>Fill Form</legend>
										<p>Please fill in this form to rate the <b>menu item</b>.</p><br>
										<label for='rating'><b>Rating </b></label>
										<input type='text' name='rating' placeholder='Answer from 1-5' maxlength='1'><br>
										<label for='comments'><b>Comment</b></label>
										<input type='comments' name='comments' placeholder='Enter a comment' maxlength='419'><br>
										<button type='submit' style='margin: 1%;'>RATE MENU ITEM</button>
									</fieldset>
								</form>
							</div>
						</div>
					";			
			} else {
				echo "
				<div class = 'layoutcenter'>
					<div class = 'tabs'>
						<text>Recent Reviews</text>
					</div>  
					";
				while($row2 = pg_fetch_array($sqlratingdata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the ratings of the restaurant
					echo "	<div class = 'commentbox clear'>
							<img src='https://png.pngtree.com/element_origin_min_pic/17/07/21/7507595ce4bd95c7f36f43332c6a5647.jpg' alt='Smiley face' height='42' width='42' align='left'>
							<br>$row2[firstname] $row2[lastname] (<b>$row2[username]</b>) <br><br><br>
							<b>Rating Date: &nbsp</b> $row2[ratingdate] <br><br>
							<b>Rated</b>: &nbsp $row2[rating] <br><br>
							<p><b>Commented:</b> <br><br> '' $row2[ratingcomment] ''
							</p>
							</div><br>";
				}
				echo "</div>";
			}
	echo "</div>";