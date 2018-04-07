<?php 

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
					<label for='type'><b>Filter restaurant type</b></label>
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
						<a href='index.php'>RESET</a>
				</form>
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
	};
	
	echo "</fieldset></div><br><br>";
	
