<?php
    include_once 'header.php';
	include_once 'dbh.php';
	
	$sql = "SELECT joindate FROM $project_name.rater WHERE userid = $_SESSION[u_id]";
	$sqldata = pg_query($conn, $sql) or die('error getting data');
	$row = pg_fetch_row($sqldata);
	
	
	echo "
		<br>
        <br>
		<div class = 'wrapper'>
            <div class = 'layoutleft'>
                <div class = 'block'>
                    <text> <b>$_SESSION[u_first] $_SESSION[u_last]</b> </text><br><br>
					<div id='avatar'></div>
                </div>
				<div class = 'clear block userInfo'>
                    <ul>
                        <li>Following:</li>
                        <li>Followers:</li>
                        <li>Reviews:</li>
                    </ul>
                </div>
                <div class = 'clear block userActivity'>
                    <ul>
                        <li>Date Joined: $row[0]</li>
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
              
                
                
                
            </div>
            
        </div>
	";