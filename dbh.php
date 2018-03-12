<?php
	$host="localhost";
	$user="postgres";
	$password="123321";
	$dbname = "Project";
	$port = "5432";
	$conn = pg_connect("host=$host dbname=$dbname user=$user password=$password port=$port");
	if(!$conn) {
		die("Connection failed: ".mysqli_connect_error());
	}
?>