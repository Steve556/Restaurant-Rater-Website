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
		";
		if (isset($_SESSION['u_id'])){					
			echo "
					<form action='restaurant.php?restaurantid=$_GET[restaurantid]' method='POST'>
						<button type='submit' class='btn' name='rate'>Rate Me!</button><br><br>
					</form>
				";
		}
		
	echo "
                    <text> <b>$row[1]</b></text>
					<br><br>
					<div id='restaurantimage'></div><br>
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
		";
			if(isset($_POST['rate'])){
				echo "
					<div class = 'layoutcenter'>
						<div class='fillableForm'>
							<form action='includes/addrestaurantrating.php?restaurantid=$_GET[restaurantid]&userid=$_SESSION[u_id]' method='POST'>
								<fieldset class='field_set'>
									<legend>Fill Form</legend>
									<p>Please fill in this form to rate the <b>restaurant</b>.</p><br>
									<label for='pricerating'><b>Restaurant Price </b></label>
									<input type='text' name='pricerating' placeholder='Answer from 1-5' maxlength='1'><br>
									<label for='foodrating'><b>Restaurant Food</b></label>
									<input type='text' name='foodrating' placeholder='Answer from 1-5' maxlength='1'><br>
									<label for='moodrating'><b>Restaurant Mood</b></label>
									<input type='text' name='moodrating' placeholder='Answer from 1-5' maxlength='1'><br>
									<label for='staffrating'><b>Restaurant Staff</b></label>
									<input type='text' name='staffrating' placeholder='Answer from 1-5' maxlength='1'><br>
									<label for='comments'><b>Comment</b></label>
									<input type='comments' name='comments' placeholder='Enter a comment' maxlength='419'><br>
									<button type='submit' style='margin: 1%;'>RATE RESTAURANT</button>
								</fieldset>
							</form>
						</div>
					</div>
				";			
			} else {
				echo "
					<div class = 'layoutcenter'>
						<div class = 'tabs'>
							<ul>
								<li><a href='restaurant.php?restaurantid=$_GET[restaurantid]'>Menu</a></li>
								<li><a href='restaurantwithreviews.php?restaurantid=$_GET[restaurantid]'>Recent Reviews</a></li>
							</ul>
						</div>
					</div>
				";
			}
    echo "
        </div>
	";
	
	