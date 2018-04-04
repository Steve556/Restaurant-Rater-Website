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
				header('Location: ../index.php?login=here');
				exit();			
			} else {
				if ($row = pg_fetch_assoc($result)){
					//Dehashing password
					$hashedPwdCheck = password_verify($pwd, $row['password']);
					if (hashedPwdCheck == false) {
						header('Location: ../index.php?login=error');
						exit();
					} else if ($hashedPwdCheck == true){
						//Login user
						$_SESSION['u_id'] = $row['userid'];
						$_SESSION['u_first'] = $row['userid'];
						$_SESSION['u_last'] = $row['userid'];
						$_SESSION['u_email'] = $row['userid'];
						$_SESSION['u_uid'] = $row['userid'];
						header('Location: ../index.php?login=success');
						exit();
					}
				}
			}
		}
	} else {
		header('Location: ../index.php?login=error');
		exit();
	}      