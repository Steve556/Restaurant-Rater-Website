<?php
session_start();
include '../dbh.php';

$uid = $_POST['uid'];
$pwd = $_POST['pwd'];
        
$sql = "SELECT username,password FROM $project_name.rater WHERE username='$uid' AND password='$pwd'";
$result = pg_query($conn, $sql);

if (!$row = pg_fetch_assoc($result)){
    echo "Your username or password is incorrect!";
} else {
    $_SESSION['id'] = $row['id'];
}

header('Location: ../index.php');
      