<!DOCTYPE html>
<html>
<body>

<?php
$user = $_POST['Username'];
if (strpos(strtolower($user),'select')!==false){
	echo "Sorry, 'select' not allowed in search terms.";
	echo "Please contact administrator if your name contains this string.";
}
elseif (strpos(strtolower($user),'update')!==false){
	echo "Sorry, 'update' not allowed in search terms.";
	echo "Please contact administrator if your name contains this string.";
}
elseif (strpos(strtolower($user),'insert')!==false){
	echo "Sorry, 'insert' not allowed in search terms.";
	echo "Please contact administrator if your name contains this string.";
}
elseif (strpos(strtolower($user),'delete')!==false){
	echo "Sorry, 'delete' not allowed in search terms.";
	echo "Please contact administrator if your name contains this string.";
}
else {
	$query="SELECT COUNT(*) as total FROM users WHERE username='".$user."'";
	
	include '../utils/cred.php';

	// Create connection
	$conn = new mysqli($servername, $username, $password,$dbname);

	// Check connection
	if ($conn->connect_error) {
		echo "Something went wrong with the connection!";
		die("Connection failed: " . $conn->connect_error);
	} 
	
	$result = $conn->query($query);
	$count = mysqli_fetch_assoc($result)['total'];
	
	if ($count==0) {
		echo "Username not found. Please enter another username and try again.";
	}
	if ($count>1) {
		echo "More than one entry with this username was found.";
		echo "This should not happen. System administrators have been contacted.";
	}
	if ($count==1) {
		echo "Thank you for your request. A password will be sent to your email soon.";
	}
}
?>

</body>
</html>