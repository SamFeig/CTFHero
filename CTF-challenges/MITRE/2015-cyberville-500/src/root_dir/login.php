<?php
	error_reporting(0);
	session_start();

	if(isset($_POST['uid']) && isset($_POST['pass'])){
		$test1 = (md5($_POST['uid']) == "1d0258c2440a8d19e716292b231e3190");
		$test2 = (md5($_POST['pass']) == "1d0258c2440a8d19e716292b231e3190");

		if($test1 && $test2){
			$_SESSION['token'] = "1d0258c2440a8d19e716292b231e3190";

			$REDIR = '<script type="text/javascript">window.location = "configuration_management.php";</script>';
			print $REDIR;
		} else {
			$REDIR = '<script type="text/javascript">window.location = "index.php";</script>';
			print $REDIR;
		}
	} else {
		$REDIR = '<script type="text/javascript">window.location = "index.php";</script>';
		print $REDIR;
	}
?>