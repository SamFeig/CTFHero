<?php 
	error_reporting(0);
	session_start();
	
	if($_SESSION['token']){

		if($_SESSION['token'] == "1d0258c2440a8d19e716292b231e3190"){
			// If it actually works, load the page as planned	
		} else {
			$REDIR = '<script type="text/javascript">window.location = "index.php";</script>';
			print $REDIR;

			die();
		}
	} else {
		$REDIR = '<script type="text/javascript">window.location = "index.php";</script>';
		print $REDIR;

		die();
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
	<link rel="stylesheet" href="main.css"/>
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#gd").click(function(){
				alert("Hmmm....this isn't working right now. Sorry.");
			});
			$("#ad").click(function(){
				alert("Now why would you want to go in there? Come on now!");
			});
			$("#conf").click(function(){
				alert("You are already here!");
			});
		});
	</script>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Network Switch Admin Console</h2>
		</div>
		<div id="sidebar">
			<ul>
				<li>+ <a id="gd" href="#">Graphical Display</a></li>
				<li>+ <a id="ad" href="#">Administrator</a></li>
				<li>+ <a id="conf" href="#">Configuration</a></li>
			</ul>
		</div>
		<div id="content">
			<div id="innerHeader"><h3>Configuration</h3></div>
			<br/>
			<form action="upload.php" method="POST" enctype="multipart/form-data">
				<table>
					<tr>
						<td>Firmware Version: </td>
						<td>4.2.1</td>
					</tr>
					<tr>
						<td>Update Firmware:</td>
						<td><input type="file" name="firmware_img"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Update"/>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
