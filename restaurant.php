<?php
    include_once 'header.php';
	include_once 'dbh.php';
	
	$sql = "SELECT * FROM $project_name.restaurant WHERE restaurantid = $_GET[restaurantid]";
	$sqldata = pg_query($conn, $sql) or die('error getting data');
	$row = pg_fetch_row($sqldata);
	$sqlforlocationtable = "SELECT * FROM $project_name.location WHERE restaurantid = $_GET[restaurantid]";
	$sqllocationdata = pg_query($conn, $sqlforlocationtable) or die('error getting data');
	$locationrow = pg_fetch_row($sqllocationdata);
	$sqlololol = "SELECT DISTINCT restaurantname FROM $project_name.restaurant WHERE restaurantid = $_GET[restaurantid]";
	$sqldatallololol = pg_query($conn, $sqlololol) or die('error getting data');
	$rowlololol = pg_fetch_row($sqldatallololol);
	$sqlgetotherlocations = "	SELECT L.streetaddress 
								FROM php_project.restaurant AS R 
									INNER JOIN php_project.location AS L ON R.restaurantid = L.restaurantid 
								WHERE R.restaurantname = '$rowlololol[0]'";
	$sqlotherlocationsdata = pg_query($conn, $sqlgetotherlocations) or die('error getting data');
	
	$sqlgetratings = "SELECT * FROM $project_name.RATING AS R INNER JOIN $project_name.RESTAURANT AS RA ON R.restaurantid = RA.restaurantid INNER JOIN $project_name.RATER AS RAT ON RAT.userid = R.userid WHERE R.restaurantid = $_GET[restaurantid]";
	$sqlratingdata = pg_query($conn, $sqlgetratings) or die('error getting data');
	$sqlgetfoodrating = "SELECT ROUND(AVG(RA.food), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $_GET[restaurantid]";
	$sqlfoodratingdata = pg_query($conn, $sqlgetfoodrating) or die('error getting data');
	$sqlgetmoodrating = "SELECT ROUND(AVG(RA.mood), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $_GET[restaurantid]";	
	$sqlmoodratingdata = pg_query($conn, $sqlgetmoodrating) or die('error getting data');
	$sqlgetstaffrating = "SELECT ROUND(AVG(RA.staff), 2) FROM $project_name.restaurant AS R INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid WHERE RA.restaurantid = $_GET[restaurantid]";
	$sqlstaffratingdata = pg_query($conn, $sqlgetstaffrating) or die('error getting data');
	$sqlgetuserrating = "SELECT * FROM $project_name.rating AS R INNER JOIN $project_name.rater as RA ON R.userid = RA.userid WHERE RA.userid = $_GET[userid] AND R.restaurantid = $_GET[restaurantid]";
	$sqluserratingdata = pg_query($conn, $sqlgetuserrating) or die('error getting data');
	
	if(isset($_POST['category'])){
		$sqlmaxpriceditem = "SELECT Menuitem.itemname as ItemName, MenuItem.itemprice as MaxPrice, Location.managername as ManagerName, Location.openinghour as OpenHours, Restaurant.restaurantwebsite as RestURL FROM $project_name.menuitem INNER JOIN $project_name.Location ON Menuitem.restaurantid=Location.restaurantid INNER JOIN $project_name.Restaurant ON Menuitem.restaurantid=Restaurant.restaurantid WHERE Menuitem.itemcategory = '".$_POST['category']."' AND Menuitem.restaurantid = '$_GET[restaurantid]' and itemprice = (SELECT MAX(itemprice) FROM $project_name.menuitem WHERE restaurantid = '$_GET[restaurantid]' AND Menuitem.itemcategory = '".$_POST['category']."');";
		$sqlgetmenuitems = "SELECT * FROM $project_name.restaurant AS R INNER JOIN $project_name.menuitem AS M ON R.restaurantid = M.restaurantid WHERE R.restaurantid = $_GET[restaurantid] AND M.itemcategory='".$_POST['category']."'";
	} else {
		//PART D SQL
		$sqlmaxpriceditem = "SELECT Menuitem.itemname as ItemName, MenuItem.itemprice as MaxPrice, Location.managername as ManagerName, Location.openinghour as OpenHours, Restaurant.restaurantwebsite as RestURL FROM $project_name.menuitem INNER JOIN $project_name.Location ON Menuitem.restaurantid=Location.restaurantid INNER JOIN $project_name.Restaurant ON Menuitem.restaurantid=Restaurant.restaurantid WHERE Menuitem.restaurantid = '$_GET[restaurantid]' and itemprice = (SELECT MAX(itemprice) FROM $project_name.menuitem WHERE restaurantid = '$_GET[restaurantid]');";
		$sqlgetmenuitems = "SELECT * FROM $project_name.restaurant AS R INNER JOIN $project_name.menuitem AS M ON R.restaurantid = M.restaurantid WHERE R.restaurantid = $_GET[restaurantid]";
	}
	//PART B SQL
	$sqlmenudata = pg_query($conn, $sqlgetmenuitems) or die('error getting data');
	$sqlgetcategorytypes = "SELECT DISTINCT itemcategory FROM $project_name.restaurant AS R INNER JOIN $project_name.menuitem AS M ON R.restaurantid = M.restaurantid WHERE R.restaurantid = $_GET[restaurantid]";
	$sqlcategorydata = pg_query($conn, $sqlgetcategorytypes) or die('error getting data');
	$sqlmaxpricedata = pg_query($conn, $sqlmaxpriceditem) or die('error getting data');
	$row11 = pg_fetch_row($sqlmaxpricedata);
	
	echo "
		<br>
        <br>
		<div class = 'wrapper'>
            <div class = 'layoutleft'>
                <div class = 'block'>
		";
		if (isset($_SESSION['u_id']) & pg_num_rows($sqluserratingdata) < 1){					
			echo "
					<form action='restaurant.php?restaurantid=$_GET[restaurantid]&userid=$_GET[userid]' method='POST'>
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
		//////////////
		if(is_null(pg_fetch_result($sqlratingdata, 0))){
			echo "<li>No ratings</li>";
		} else {
			echo "<li>Number of ratings: ".pg_num_rows($sqlratingdata)."</li>";
		}
	echo "	
					</ul>
                </div>
				<div class = 'clear block userInfo'>
                    <ul>
                        <li>Phone number: <text style='color:green'><b>$locationrow[3]</text></b></li>
                        <li>Restaurant type: $row[2]</li>
						<li>Opening hours: $locationrow[5] - $locationrow[6]</li>
						<li>Location: $locationrow[4]</li>
						<li>Manager name: $locationrow[2]</li>
						<li>Established in: $locationrow[1]</li>
						<li>Website: <a href='$row[3]' target='_blank'>$row[3]</a></li>
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
								<li><a href='restaurant.php?restaurantid=$_GET[restaurantid]&userid=$_GET[userid]'>Menu</a></li>
								<li><a href='restaurantwithreviews.php?restaurantid=$_GET[restaurantid]&userid=$_GET[userid]'>Recent Reviews</a></li>
							</ul>
						</div>
					<div class = 'menubox clear'>
						<form action='restaurant.php?restaurantid=$_GET[restaurantid]&userid=$_GET[userid]' method='POST'> 
							<label for='category'><b>Choose a category type to filter menu: </b></label>
							<input list='raterType' name='category' placeholder='Type of item category?'>
							<datalist id='raterType'>
					";
							while($row3 = pg_fetch_array($sqlcategorydata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the locations of restaurant
								echo "<option value='".$row3['itemcategory']."'>";
							}
				echo"
							</datalist>
							<button type='submit'>FILTER</button>
						</form>
						<text style ='color: red;'><b>To reset filter click on menu in tab!!</b></text><br>
					";
					
				echo "
					<h1>MENU</h1>
					<text><b>Maxed price item:</b></text> ".$row11[0]." with a price of: $".$row11[1]."
					";
				$num = 1;
				echo "	<table>
							<thead>
								<tr>
									<th></th>
									<th>Item name</th>
									<th>Item type</th>
									<th>Item category</th>
									<th>Item description</th>
									<th>Item price</th>
								</tr>
							</thead>
							<tbody>";
				while($row2 = pg_fetch_array($sqlmenudata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the ratings of the restaurant
					echo "
						<tr>
							<td>
								$num.
							</td>
							<td>
						";
								if (isset($_SESSION['u_id'])){
									echo "<a href='menuitem.php?itemid=".$row2['itemid']."&useridloggedin=".$_SESSION['u_id']."'>$row2[itemname] </a>";
								} else {
									echo "<a href='menuitem.php?itemid=".$row2['itemid']."&useridloggedin=0'>$row2[itemname] </a>";
								}
					echo "
							</td>
							<td>
								$row2[itemtype]
							</td>
							<td>
								$row2[itemcategory]
							</td>
							<td>
								$row2[itemdescription]
							</td>
							<td>
								$$row2[itemprice]
							</td>
						</tr>
						";
					$num++;
				}
				echo "</tbody></table></div>";
			}
    echo "
        </div>
	";