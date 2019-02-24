<?php

$firstfile=fopen("first.txt","r") or die("Unable to open first.txt");
$lastfile=fopen("last.txt","r") or die ("Unable to open last.txt");
$firstnames=fread($firstfile,filesize("first.txt"));
$lastnames=fread($lastfile,filesize("last.txt"));
$firstnames=preg_replace("/[^A-Za-z ]/",'',$firstnames);
$lastnames=preg_replace("/[^A-Za-z ]/",'',$lastnames);

$fns=preg_split('/\s+/',$firstnames);
$lns=preg_split('/\s+/',$lastnames);

$servername = "localhost";
$username = "root";
$password = "thA4RaT3stubaz2w2ethAnu4ruquphev";
$dbname="sql_injection";

// Create connection
$conn = new mysqli($servername, $username, $password,$dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";

$chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890-_!?@#$%^&*";
for($i=0;$i<300;++$i){
	for($h=0;$h<300;++$h){
		$username=$fns[$i]."_".$lns[$h];
		$password="";
		for($j=0;$j<12;++$j){
			$password=$password.substr($chars,rand(0,strlen($chars)-1),1);
		}
		if ($i==202&&$h==213){
			$username="Bethany_Griswold";
			$password="MCA-05021991";
		}
		$sql="INSERT INTO users (username,password) VALUES ('".$username."','".$password."')";
		if ($conn->query($sql) === TRUE) {
			echo "New record created successfully";
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
	}
}
$conn->close();

?>