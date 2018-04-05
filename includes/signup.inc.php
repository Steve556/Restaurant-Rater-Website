<?php

include_once '../dbh.php';

$firstname = $_POST['first'];
$lastname = $_POST['last'];
$username = $_POST['uid'];
$password1 = $_POST['pwd1'];
$password2 = $_POST['pwd2'];
$emailaddress1 = $_POST['email1'];
$emailaddress2 = $_POST['email2'];
$usertype = $_POST['type'];

        
if(empty($firstname) || empty($lastname) || empty($username) || empty($password1) || empty($password2) || empty($emailaddress1) || empty($emailaddress2) || empty($usertype)){
    header('Location: ../signup.php?error=empty');
    exit();
} else {
    $sql = "SELECT username FROM $project_name.rater WHERE username='$username'";
    $result = pg_query($conn, $sql);
    $uidcheck = pg_num_rows($result);
    if ($uidcheck > 0){
        header('Location: ../signup.php?error=usernameExists');
        exit();   
    } else {
		if(!preg_match("/^[a-zA-Z]*$/", $firstname) || !preg_match("/^[a-zA-Z]*$/", $lastname)){
			header('Location: ../signup.php?error=invalidFirstOrLastName');
			exit();
		} else {
			if (!filter_var($emailaddress2, FILTER_VALIDATE_EMAIL)){
				header('Location: ../signup.php?error=invalidEmail');
				exit();
			} else if ($emailaddress1 != $emailaddress2) {
				header('Location: ../signup.php?error=emailsNotMatching');
				exit();
			} else {
				if ($pwd1 != $pwd2){
					header('Location: ../signup.php?error=passwordsNotMatching');
					exit();
				} else {
					//Hash password
					$hashedPwd = password_hash($password2, PASSWORD_DEFAULT);
					//Insert user into database
					$sql = "INSERT INTO $project_name.rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('$emailaddress','$firstname', '$lastname', CURRENT_DATE,'$usertype', '1', '$hashedPwd', '$username')";
					$result = pg_query($conn, $sql);
					header('Location: ../index.php');
				}
			}
		}
        
    }
}   