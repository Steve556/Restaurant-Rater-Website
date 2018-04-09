<?php
    include_once 'header.php';
	include_once 'dbh.php';
	
	$sql = "SELECT * FROM $project_name.rater WHERE userid = $_GET[userid]";
	$sqldata = pg_query($conn, $sql) or die('error getting data');
	$row = pg_fetch_row($sqldata);
	$sqlratings = "SELECT R.userid FROM $project_name.rater AS R INNER JOIN $project_name.rating AS RA ON R.userid = RA.userid WHERE R.userid = $_GET[userid]";
	$sqlratingsdata = pg_query($conn, $sqlratings) or die('error getting data');
	$sqlgetratings = "	SELECT * 
						FROM $project_name.RATING AS R 
							INNER JOIN $project_name.RESTAURANT AS RA ON R.restaurantid = RA.restaurantid 
							INNER JOIN $project_name.RATER AS RAT ON RAT.userid = R.userid 
						WHERE R.userid = $_GET[userid]";
	$sqlratingdata = pg_query($conn, $sqlgetratings) or die('error getting data');
	
	echo "
		<br>
        <br>
		<div class = 'wrapper'>
            <div class = 'layoutleft'>
                <div class = 'block'>
                    <text> <b>$row[2] $row[3]</b> </text><br><br>
					<div id='avatar'></div>
                </div>
				<div class = 'clear block userInfo'>
                    <ul>
                        <li>Number of ratings: &nbsp"; echo pg_num_rows($sqlratingsdata);
	echo "				</li>
                        <li>Followers:</li>
                        <li>Reviews:</li>
                    </ul>
                </div>
                <div class = 'clear block userActivity'>
                    <ul>
                        <li>Date Joined: $row[4]</li>
                    </ul>
                </div>
                <div class = 'subBlock clear'> 
                    <a href='#'>Friends</a>
                </div>
                <div class = 'clear block friendList'>

                </div>
                <div class = 'subBlock clear'> 
                    <a href='#'>Groups</a>
                </div>
                <div class = 'clear block friendList'>

                </div>
            
            </div>
            <div class = 'layoutcenter'>
                <div class = 'tabs'>
                    <text>Recent Reviews</text>
                </div>
		";
				while($row2 = pg_fetch_array($sqlratingdata, NULL, PGSQL_ASSOC)){ // fetches the data row by row for the ratings of the restaurant
						echo "<div class = 'commentbox clear'>
								<img src='https://www.zonkafeedback.com/wp-content/uploads/2015/01/survey-question.jpg' alt='Smiley face' height='42' width='42' align='left'>
								<br><b>$row2[restaurantname]</b><br><br><br>
								<b>Rating Date: &nbsp</b> $row2[ratingdate] <br><br>
								<b>Rated</b>: &nbsp <u>Price</u>: $row2[price] &nbsp <u>Food</u>: $row2[food] &nbsp <u>Mood</u>: $row2[mood] &nbsp <u>Staff</u>: $row2[staff] <br><br>
								<p><b>Commented:</b> <br><br> '' $row2[comments] ''
								</p>
								</div><br>";
				}
		echo "
              
                
                
                
            </div>
            
        </div>
	";