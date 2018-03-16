<?php
session_start();
include '../dbh.php';

$firstname = $_POST['first'];
$lastname = $_POST['last'];
$username = $_POST['uid'];
$password = $_POST['pwd2'];
$emailaddress = $_POST['email2'];
$usertype = $_POST['type'];

        
if(empty($firstname) || empty($lastname) || empty($username) || empty($password) || empty($emailaddress) || empty($usertype)){
    header('Location: ../signup.php?error=empty');
    exit();
} else {
    $sql = "SELECT username FROM $project_name.rater WHERE username='$username'";
    $result = pg_query($conn, $sql);
    $uidcheck = pg_num_rows($result);
    if ($uidcheck > 0){
        header('Location: ../signup.php?error=username');
        exit();   
    } else {
        $sql = "INSERT INTO $project_name.rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('$emailaddress','$firstname', '$lastname', CURRENT_DATE,'$usertype', '1', '$password', '$username')";
        $result = pg_query($conn, $sql);
        header('Location: ../index.php');
    }
}



      