<?php 

	$restauranttypes = array("American", "British", "Canadian", "Caribbean", "Chinese", "French", "Greek", "Indian", "Italian" , "Japanese", "Mediterranean", "Mexican", "Moroccan", "Spanish", "Thai", "Turkish", "Vietnam");
	$categories = array("Breakfast", "Lunch", "Soups", "Sides", "Starter", "Tacos", "NotTacos", "Dessert", "Cocktails", "Beer", "Wine", "Tequila", "Coffee", "Poutine", "Main");

	echo "
	
		<div class='wrapper controlBox'> 		
			<fieldset class='field_set'>
				<legend>Controls</legend>
		";
		if(isset($_SESSION['u_id'])){ // if user is logged in then allow him to see controls
				
			echo "
				<form action='index.php' method='POST'>
					<label for='addrestaurant'><b>Add a restaurant</b></label>
					<button type='submit' class='btn' name='addrestaurant'>Add restaurant</button>
				</form>
				
				<form action='index.php' method='POST'>
					<label for='addmenuitem'><b>Add a menu item</b></label>
					<button type='submit' class='btn' name='addmenuitem'>Add Menu Item</button>
				</form>
				
				<form action='index.php' method='POST'> 
					<label for='type'><b>Filter by restaurant type</b></label>
					<input list='restaurantType' name='type' placeholder='Type of Restaurant'>
						<datalist id='restaurantType'>
							<option value='American'>
							<option value='British'>
							<option value='Canadian'>
							<option value='Caribbean'>
							<option value='Chinese'>
							<option value='French'>
							<option value='Greek'>
							<option value='Indian'>
							<option value='Italian'>
							<option value='Japanese'>
							<option value='Mediterranean'>
							<option value='Mexican'>
							<option value='Moroccan'>
							<option value='Spanish'>
							<option value='Thai'>
							<option value='Turkish'>
							<option value='Vietnamese'>
						</datalist>
						<button type='submit'>FILTER</button>
				</form>
				
				<form action='index.php' method='POST'>
					<label for='yearwithnorating'><b>Filter restaurant by year and month with no rating</b></label>
					<input list='years' name='years' placeholder='Choose a year.'>
						<datalist id='years'>
							<option value='2018'>
							<option value='2017'>
							<option value='2016'>
							<option value='2015'>
							<option value='2014'>
							<option value='2013'>
							<option value='2012'>
							<option value='2011'>
							<option value='2010'>
							<option value='2009'>
							<option value='2008'>
						</datalist>
					<input list='months' name='months' placeholder='Choose a month.'>
						<datalist id='months'>
							<option value='1'>
							<option value='2'>
							<option value='3'>
							<option value='4'>
							<option value='5'>
							<option value='6'>
							<option value='7'>
							<option value='8'>
							<option value='9'>
							<option value='10'>
							<option value='11'>
							<option value='12'>
						</datalist>
						<button type='submit'>FILTER</button>	
				</form>
				
				<form action='index.php' method='POST'>
					<label for='staffratingeffectlabel'><b>Filter by staff rating less than </b></label>
					<input type='number' name='staffratingeffect' placeholder='1-5' min='1' max='5'></input>
					<button type='submit' class='btn' name='staffratingeffectbtn'>FILTER</button>
				</form>
				
				<form action='index.php' method='POST'>
					<label for='restaurantTypelabel'><b>Details of restaurant type with highest food rating</b></label>
					<input list='restaurantTypes' name='types' placeholder='Choose a restaurant type'>
						<datalist id='restaurantTypes'>
		";
					for ($x = 0; $x < sizeof($restauranttypes); $x++) {
						echo "<option value='".$restauranttypes[$x]."'>";
					}
		echo "
						</datalist>
					<button type='submit' class='btn' name='restaurantTypeBtn'>FILTER</button>
				</form>
				
				<form action='index.php' method='POST'>
					<label for='restauranttypemorepopularthanothers'><b>Is restaurant type X more popular than others? </b></label>
					<input list='restaurantTypes' name='restauranttypemorepopularthanothers' placeholder='Choose a restaurant type'>
					<button type='submit' class='btn' name='btn1'>ANSWER ME</button>
				</form>
				
				<form action='index.php' method='POST'>
					<text><b>Highest overall rating in terms of the Food and the Mood of restaurants for raters </b></text>
					<button type='submit' class='btn' name='btn5'>SHOW ME</button>
				</form>
				
				<form action='index.php' method='POST'>
					<text><b>Details of the raters that rated Restaurant X the most</b></text>
					<input list='restaurants' name='restaurant' placeholder='Choose a restaurant name' maxlength='31'>
					<datalist id='restaurants'>
			";
						include_once 'dbh.php';
						$sqlget = "	SELECT DISTINCT restaurantname
									FROM $project_name.restaurant 
									ORDER BY restaurantname ASC";
						$sqldata = pg_query($conn, $sqlget) or die('error getting data');
						while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){
							echo "<option value='".$row['restaurantname']."'>";
						}
		echo "
						</datalist>
					<button type='submit' class='btn' name='btn6'>SHOW ME</button>
				</form>
				
				<form action='index.php' method='POST'>
					<text><b>Raters with ratings below this rater's first name </b></text>
					<input list='firstnames' name='firstname' placeholder='Choose a first name' maxlength='31'>
					<datalist id='firstnames'>
			";
						include_once 'dbh.php';
						$sqlget = "	SELECT DISTINCT firstname
									FROM $project_name.rater 
									ORDER BY firstname ASC";
						$sqldata = pg_query($conn, $sqlget) or die('error getting data');
						while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){
							echo "<option value='".$row['firstname']."'>";
						}
		echo "
					</datalist>
					<button type='submit' class='btn' name='btn7'>SHOW ME</button>
				</form>
				
				<a href='index.php'>RESET A FILTER</a>
				<br>
				<br>
				";
		} else {
			echo "<b>You must be logged in to view controls to alter with database!<br><br></b>";
		}
	
	if(isset($_POST['addrestaurant'])){
		echo "
		<div class='fillableForm'>
			<form action='includes/addRestaurant.inc.php' method='POST'>
					<fieldset class='field_set'>
						<legend>Fill Form</legend>
						<p>Please fill in this form to add a <b>restaurant</b>.</p><br>
						<label for='name'><b>Restaurant name</b></label>
						<input type='text' name='name' placeholder='Enter restaurant name' maxlength='127'><br>
						<label for='type'><b>Restaurant type</b></label>
						<input list='restaurantType' name='type' placeholder='Type of Restaurant' maxlength='31'><br>
						<datalist id='restaurantType'>
							<option value='Blog'>
							<option value='Online'>
							<option value='Food Critic'>
						</datalist>
						<label for='website'><b>Restaurant website</b></label>
						<input type='text' name='website' placeholder='Enter restaurant website' maxlength='127'><br>
						<label for='address'><b>Restaurant address</b></label>
						<input type='text' name='address' placeholder='Enter restaurant address' maxlength='255'><br>
						<label for='establishedin'><b>Established In</b></label>
						<input type='date' name='establishedin'><br>
						<label for='managername'><b>Manager name</b></label>
						<input type='text' name='managername' placeholder='Enter his/her name' maxlength='127'><br>
						<label for='phonenumber'><b>Restaurant's phone number</b></label>
						<input type='text' name='phonenumber' placeholder='Enter phonenumber' maxlength='31'><br>
						<label for='openinghour'><b>Opening hour</b></label>
						<input type='text' name='openinghour' placeholder='Enter opening hours' maxlength='9'><br>
						<label for='closinghour'><b>Closing hour</b></label>
						<input type='text' name='closinghour' placeholder='Enter closing hours' maxlength='9'><br>
						<button type='submit' style='margin: 1%;'>ADD RESTAURANT</button>
					</fieldset>
				</form>
		</div>
		";
	} else if(isset($_POST['addmenuitem'])){
		echo "
		<div class='fillableForm'>
			<form action='includes/addMenuItem.inc.php' method='POST'>
					<fieldset class='field_set'>
						<legend>Fill Form</legend>
						<p>Please fill in this form to add a <b>menu item</b>.</p><br>
						<label for='itemName'><b>Item name</b></label>
						<input type='text' name='itemName' placeholder='Enter item name' maxlength='127'><br>
						<label for='itemType'><b>Restaurant type</b></label>
						<input list='itemType' name='itemType' placeholder='Type of item' maxlength='31'><br>
						<datalist id='itemType'>
							<option value='Food'>
							<option value='Drink'>
						</datalist>
						<label for='itemCategory'><b>Item category</b></label>
						<input list='itemCategory' name='itemCategory' placeholder='Category of item' maxlength='31'><br>
						<datalist id='itemCategory'>
		";
						for ($x = 0; $x < sizeof($categories); $x++) {
							echo "<option value='".$categories[$x]."'>";
						}
		echo "
						</datalist>
						<label for='itemDescription'><b>Item description</b></label>
						<input type='text' name='itemDescription' placeholder='Enter description of item' maxlength='419'><br>
						<label for='itemPrice'><b>Item price</b></label>
						<input type='text' name='itemPrice' placeholder='Enter price of item' maxlength='5'><br>
						<label for='restaurant'><b>Restaurant</b></label>
						<input list='restaurants' name='restaurant' placeholder='Choose a restaurant' maxlength='31'><br>
						<datalist id='restaurants'>
			";
						include_once 'dbh.php';
						$sqlget = "	SELECT DISTINCT restaurantname
									FROM $project_name.restaurant 
									ORDER BY restaurantname ASC";
						$sqldata = pg_query($conn, $sqlget) or die('error getting data');
						while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){
							echo "<option value='".$row['restaurantname']."'>";
						}
		echo "
						</datalist>
						<button type='submit' style='margin: 1%;'>ADD MENU ITEM</button>
					</fieldset>
			</form>
		</div>
		";		
	} else if(isset($_POST['types'])){
		echo "
			<table class='wrapper'>
				<thead>
					<tr>
						<th>Restaurant Type</th>
						<th>Restaurant Name</th>
						<th>Rater Name</th>
						<th>Food Ratings</th>
		";
		
		echo "</thead></tr><tbody>";
		
		$sqlstatement = "	SELECT DISTINCT Restaurant.restauranttype, Restaurant.restaurantname, Rater.firstname, Rater.lastname, Rating.food
									FROM php_project.rater
										INNER JOIN php_project.rating ON Rater.userid=Rating.userid
										INNER JOIN php_project.restaurant ON Rating.restaurantid=Restaurant.restaurantid
									WHERE Rating.food = (SELECT MAX(RA.food) FROM php_project.Rating AS RA) and Restaurant.restauranttype='".$_POST['types']."'";
		include_once 'dbh.php';
		$sqldata1 = pg_query($conn, $sqlstatement) or die('error getting data');
		
		while($row = pg_fetch_array($sqldata1, NULL, PGSQL_ASSOC)){ // fetches the data row by row
			echo "	<tr>
						<td>".$row['restauranttype']."</td>
						<td>".$row['restaurantname']."</td>
						<td>".$row['firstname']." ".$row['lastname']."</td>
						<td>".$row['food']."</td>
					</tr>						
				";
		}
		
		echo "</tbody></table>";		
	} else if (isset($_POST['restauranttypemorepopularthanothers'])){
		include_once 'dbh.php';
		$sqlget = "	SELECT * 
					FROM $project_name.restaurant";
		$sqldata = pg_query($conn, $sqlget) or die('error getting data');
		
		$arrayOfNumberOfRatings = array_fill(0, sizeof($restauranttypes), 0);
		$x = 0;		
		while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){
			$sqlgetraters = "	SELECT * 
								FROM $project_name.restaurant AS R 
									INNER JOIN $project_name.rating as RA ON R.restaurantid = RA.restaurantid 
								WHERE R.restauranttype = '$restauranttypes[$x]'";
			$sqlratersdata = pg_query($conn, $sqlgetraters) or die('error getting data');
			$arrayOfNumberOfRatings[$x] = pg_num_rows($sqlratersdata);
			$x++;
		}
		$x = array_search($_POST['restauranttypemorepopularthanothers'], $restauranttypes);
		
		if (max($arrayOfNumberOfRatings) ==  $arrayOfNumberOfRatings[$x]) {
			echo "<text style='color: red'><b>YES</b></text>";
		} else {
			echo "<text style='color: red'><b>NO</b></text>";
		}
	} else if (isset($_POST['btn5'])){
		include_once 'dbh.php';
		$sqlget = "	SELECT * 
					FROM $project_name.rater";
		$sqldata = pg_query($conn, $sqlget) or die('error getting data');
		
		$arrayOfUserIds = array_fill(0, pg_num_rows($sqldata), 0);
		$arrayOfAvgFoodRatings = array_fill(0, pg_num_rows($sqldata), 0);
		$arrayOfAvgMoodRatings = array_fill(0, pg_num_rows($sqldata), 0);
		$additionOfAverages = array_fill(0, pg_num_rows($sqldata), 0);
		
		
		$x = 0;
		while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){
			$arrayOfUserIds[$x] = $row['userid'];
			$sqlgetavgfoodrating = "SELECT AVG(RA.food) 
									FROM $project_name.rater AS R 
										INNER JOIN $project_name.rating as RA ON R.userid = RA.userid 
									WHERE R.userid = '$row[userid]'";
			$sqlavgfooddata = pg_query($conn, $sqlgetavgfoodrating) or die('error getting data');
			$row1 = pg_fetch_row($sqlavgfooddata);
			$arrayOfAvgFoodRatings[$x] = (int)$row1[0];
			$sqlgetavgmoodrating = "SELECT AVG(RA.mood) 
									FROM $project_name.rater AS R 
										INNER JOIN $project_name.rating as RA ON R.userid = RA.userid 
									WHERE R.userid = '$row[userid]'";
			$sqlavgmooddata = pg_query($conn, $sqlgetavgmoodrating) or die('error getting data');
			$row2 = pg_fetch_row($sqlavgmooddata);
			$arrayOfAvgMoodRatings[$x] = (int)$row2[0];
			$additionOfAverages[$x] = $arrayOfAvgMoodRatings[$x] + $arrayOfAvgFoodRatings[$x];
			$x++;
		}
		
		$new_array = array_keys($additionOfAverages, max($additionOfAverages));

		echo "
			<table class='wrapper'>
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Join Date</th>
						<th>Rater Reputation</th>
						<th>Restaurant name</th>
						<th>Rating Date</th>
		";
		
		echo "</thead></tr><tbody>";
		
		for ($x = 0; $x < sizeof($new_array); $x++){
			
			$sqlstatement = "	SELECT *
									FROM php_project.rater AS R
										INNER JOIN php_project.rating AS RA ON R.userid=RA.userid
										INNER JOIN php_project.restaurant AS RE ON RA.restaurantid=RE.restaurantid
									WHERE R.userid = '".$arrayOfUserIds[$new_array[$x]]."'";
			
			$sqldata1 = pg_query($conn, $sqlstatement) or die('error getting data');
			while($row3 = pg_fetch_array($sqldata1, NULL, PGSQL_ASSOC)){
				echo "	<tr>
						<td>".$row3['firstname']."</td>
						<td>".$row3['lastname']."</td>
						<td>".$row3['joindate']."</td>
						<td>".$row3['reputation']."</td>
						<td>".$row3['restaurantname']."</td>
						<td>".$row3['ratingdate']."</td>
						</tr>
						";				
			}
		}
		echo "</tbody></table>";
		
	} else if (isset($_POST['btn6'])){
		include_once 'dbh.php';
		$sqlget = "	SELECT * 
					FROM $project_name.rater";
		$sqldata = pg_query($conn, $sqlget) or die('error getting data');
		
		$arrayOfUserIds = array_fill(0, pg_num_rows($sqldata), 0);
		$arrayOfNumberOfRatings = array_fill(0, pg_num_rows($sqldata), 0);		
		
		$x = 0;
		while($row = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){
			$arrayOfUserIds[$x] = $row['userid'];
			$sqlnumberofratings = "SELECT * 
									FROM $project_name.rater AS R 
										INNER JOIN $project_name.rating as RA ON R.userid = RA.userid 
										INNER JOIN $project_name.restaurant AS RE ON RE.restaurantid = RA.restaurantid
									WHERE R.userid = '$row[userid]' AND RE.restaurantname='".$_POST['restaurant']."'";
			$sqlnumberofratingsdata = pg_query($conn, $sqlnumberofratings) or die('error getting data');
			$row1 = pg_fetch_row($sqlnumberofratingsdata);
			
			$arrayOfNumberOfRatings[$x] = (int)pg_num_rows($sqlnumberofratingsdata);
			$x++;
		}
		
		echo max($arrayOfNumberOfRatings);
		$new_array = array_keys($arrayOfNumberOfRatings, max($arrayOfNumberOfRatings));

		echo "
			<table class='wrapper'>
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Rater Reputation</th>
						<th>Rating comment </th>
						<th>Item name</th>
						<th>Item price</th>
		";
		
		echo "</thead></tr><tbody>";
		
		for ($x = 0; $x < sizeof($new_array); $x++){
												
			$sqlstatement = "		SELECT *
									FROM php_project.rater 
										INNER JOIN php_project.ratingitem ON Rater.userid=Ratingitem.userid
										INNER JOIN php_project.menuitem ON Ratingitem.itemid=Menuitem.itemid
										INNER JOIN php_project.restaurant ON Menuitem.restaurantid=Restaurant.restaurantid
									WHERE Rater.userid='".$arrayOfUserIds[$new_array[$x]]."' and Restaurant.restaurantname='".$_POST['restaurant']."'";
									
			$sqldata1 = pg_query($conn, $sqlstatement) or die('error getting data');
			while($row3 = pg_fetch_array($sqldata1, NULL, PGSQL_ASSOC)){
				echo "	<tr>
						<td>".$row3['firstname']."</td>
						<td>".$row3['lastname']."</td>
						<td>".$row3['reputation']."</td>
						<td>".$row3['ratingcomment']."</td>
						<td>".$row3['itemname']."</td>
						<td>".$row3['itemprice']."</td>
						</tr>
						";				
			}
		}
		echo "</tbody></table>";
	} else if (isset($_POST['btn7'])){
		$sql = "SELECT *
				FROM php_project.rater AS RAT
				WHERE RAT.userid IN (	SELECT RA.userid 
										FROM php_project.rating AS RA
										WHERE (RA.price+RA.food+RA.mood+RA.staff) < ANY(SELECT (RATE.price+RATE.food+RATE.mood+RATE.staff) 
																						FROM php_project.rating as RATE 
																						WHERE RATE.userid IN (	SELECT RATER.userid 
																												FROM php_project.rater AS RATER 
																												WHERE RATER.firstname='".$_POST['firstname']."')))";
		$sqldata = pg_query($conn, $sql) or die('error getting data');
		
		echo "
			<table class='wrapper'>
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
		";
		
		echo "</thead></tr><tbody>";
		
		while($row3 = pg_fetch_array($sqldata, NULL, PGSQL_ASSOC)){
				echo "	<tr>
						<td>".$row3['firstname']."</td>
						<td>".$row3['lastname']."</td>
						<td>".$row3['emailaddress']."</td>
						</tr>
						";				
		}
		echo "</tbody></table>";
	}
	
	echo "</fieldset></div><br><br>";
	
