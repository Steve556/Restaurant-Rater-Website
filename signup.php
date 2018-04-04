<?php 
    include_once 'header.php';

    $url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
    
    if(isset($_SESSION['id'])){
        echo "<p style='text-align: center;margin-top:10px; color: red; text-decoration:underline;'>You are already logged in!</p>";
    } else {
        echo "
			<div id='signupForm'>
				<form action='includes/signup.inc.php' method='POST'>
					<fieldset class='wrapper field_set'>
					<legend>Sign Up</legend>
					<p>Please fill in this form to create an account.</p><br>
					<label for='first'><b>First name</b></label>
					<input type='text' name='first' placeholder='Enter first name'><br>
					<label for='last'><b>Last name</b></label>
					<input type='text' name='last' placeholder='Enter last name'><br>
					<label for='email1'><b>Email</b></label>
					<input type='text' name='email1' placeholder='Enter email'><br>
					<label for='email2'><b>Repeat email</b></label>
					<input type='text' name='email2' placeholder='Confirm email'><br>
					<label for='type'><b>Rater type</b></label>
					<input list='raterType' name='type' placeholder='What type of rater are you?'><br>
					<datalist id='raterType'>
						<option value='Blog'>
						<option value='Online'>
						<option value='Food Critic'>
					</datalist>
					<label for='uid'><b>Username</b></label>
					<input type='text' name='uid' placeholder='Username'><br>
					<label for='pwd1'><b>Password</b></label>
					<input type='password' name='pwd1' placeholder='Enter password'><br>
					<label for='pwd2'><b>Repeat password</b></label>
					<input type='password' name='pwd2' placeholder='Confirm password'><br>
					<button type='submit' style='margin: 1%;'>SIGNUP</button>
					</field_set>
				</form>
			</div>	";
			if (strpos($url, 'error=empty') !== false) {
				echo "<p style='text-align: center;margin-top:10px; color: red; text-decoration:underline;'>Fill out all the fields!</p>";
			} else if (strpos($url, 'error=username') !== false) {
				echo "<p style='text-align: center;margin-top:10px; color: red; text-decoration:underline;'>Username already exists</p>";
			}
    }
?>
    
