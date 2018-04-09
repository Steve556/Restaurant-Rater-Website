<?php

	session_start();

	if (isset($_POST['submit'])){
		
		include_once '../dbh.php';
		
		$uid = $_POST['uid'];
		$pwd = $_POST['pwd'];
		
		if (empty($uid) || empty($pwd)){
			header('Location: ../index.php?login=empty');
			exit();
		} else {
			$sql = "SELECT * FROM $project_name.rater WHERE username='$uid'";
			$result = pg_query($conn, $sql);
			$resultCheck = pg_num_rows($result);
			if ($resultCheck < 1) {
				header('Location: ../index.php?login="notValidUsernameOrPassword"');
				exit();			
			} else {
				if ($row = pg_fetch_assoc($result)){
					//Dehashing password
					
					//$hashedPwdCheck = password_verify($pwd, $row['password']);
					if ($pwd != $row['password']){
						header('Location: ../index.php?login=error');
						exit();
					} else {
						$_SESSION['u_id'] = $row['userid'];
						$_SESSION['u_first'] = $row['firstname'];
						$_SESSION['u_last'] = $row['lastname'];
						$_SESSION['u_email'] = $row['emailaddress'];
						$_SESSION['u_uid'] = $row['username'];
						header('Location: ../index.php?login=success');
						exit();
					}
					
					/* Removed to make it easier to add rows into database in our script file
					if (hashedPwdCheck == false) {
						header('Location: ../index.php?login=error');
						exit();
					} else if ($hashedPwdCheck == true){
						//Login user
						$_SESSION['u_id'] = $row['userid'];
						$_SESSION['u_first'] = $row['firstname'];
						$_SESSION['u_last'] = $row['lastname'];
						$_SESSION['u_email'] = $row['emailaddress'];
						$_SESSION['u_uid'] = $row['username'];
						header('Location: ../index.php?login=success');
						exit();
					}
					*/
				}
			}
		}
	} else {
		header('Location: ../index.php?login=error');
		exit();
	}      