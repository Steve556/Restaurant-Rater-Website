<?php

//$int = var_dump(filter_var($_POST['staffratingeffect'],FILTER_SANITIZE_NUMBER_INT));
$int = (int)$_GET['staffratingeffects'];
echo $int;
