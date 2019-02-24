<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
	<link rel="stylesheet" href="main.css"/>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Network Switch Admin Console</h2>
		</div>
		<div id="entry">
			<form action="login.php" method="POST">
				<table>
					<tr>
						<td><span>Login ID</span></td>
						<td><input name="uid" type="text" maxlength="30"/></td>
					</tr>
					<tr>
						<td><span>Password</span></td>
						<td><input name="pass" type="password" maxlength="30"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Login"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>

