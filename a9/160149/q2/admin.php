<!DOCTYPE html>
<html>
<body>
<h2>Records</h2>

<?php
$db = new SQLite3('mysqlitedb.db');

// define variables and set to empty values
$loginid = $passid = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $loginid = test_input($_POST["login"]);
  $passid = test_input($_POST["pass"]);
  $qstr = "insert into records values ('$name', '$email', '$website', '$gender')";
  $insres = $db->query($qstr);
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
  Login <input type="text" name="login">
  <br><br>
  Password <input type="password" name="pass">
  <br><br>
  <input type="submit" name="submit" value="Submit">  
</form>
</body>
</html>


<a href="basic.php">Another Registration</a>

<?php

if ($loginid=="arpitrag" and $passid=="cs251"){
	

	$results = $db->query('SELECT * FROM records');
	while ($row = $results->fetchArray()) {
	    echo "<br> $row[0] $row[1] $row[2] $row[3] $row[4] $row[5]";
}
}

