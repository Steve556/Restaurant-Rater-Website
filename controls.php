<?php 

	$restauranttypes = array("American", "British", "Canadian", "Caribbean", "Chinese", "French", "Greek", "Indian", "Italian" , "Japanese", "Mediterranean", "Mexican", "Moroccan", "Spanish", "Thai", "Turkish", "Vietnam");

	echo "
	
		<div class='wrapper controlBox'> 		
			<fieldset class='field_set'>
				<legend>Controls</legend>
		";
		if(isset($_SESSION['u_id'])){ // if user is logged in then allow him to see controls
				
			echo "
				<form action='index.php' method='POST'>
					<label for='add'><b>Add a restaurant</b></label>
					<button type='submit' class='btn' name='add'>Add restaurant</button>
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
					<label for='yearwithnorating'><b>Filter restaurant by year with no rating</b></label>
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
					<label for='staffratingeffectlabel'><b>Filter by staff rating</b></label>
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
				
				<a href='index.php'>RESET A FILTER</a>
				<br>
				<br>
				";
		} else {
			echo "<b>You must be logged in to view controls to alter with database!<br><br></b>";
		}
	
	if(isset($_POST['add'])){
		echo "
		<div class='fillableForm'>
			<form action='includes/addRestaurant.inc.php' method='POST'>
					<fieldset class='field_set'>
						<legend>Fill Form</legend>
						<p>Please fill in this form to add a <b>restaurant</b>.</p><br>
						<label for='name'><b>Restaurant name</b></label>
						<input type='text' name='name' placeholder='Enter restaurant name'><br>
						<label for='type'><b>Restaurant type</b></label>
						<input list='restaurantType' name='type' placeholder='Type of Restaurant'><br>
						<datalist id='restaurantType'>
							<option value='Blog'>
							<option value='Online'>
							<option value='Food Critic'>
						</datalist>
						<label for='website'><b>Restaurant website</b></label>
						<input type='text' name='website' placeholder='Enter restaurant website'><br>
						<label for='address'><b>Restaurant address</b></label>
						<input type='text' name='address' placeholder='Enter restaurant address'><br>
						<button type='submit' style='margin: 1%;'>ADD RESTAURANT</button>
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
	}
	
	echo "</fieldset></div><br><br>";
	
