<?php 

	error_reporting(0);

	session_start();

	if($_SESSION['token']){

		if($_SESSION['token'] == "1d0258c2440a8d19e716292b231e3190"){
			
			if(!empty($_FILES['firmware_img'])){
				if($_FILES['firmware_img']['size'] < 2000000){

					if(md5_file($_FILES['firmware_img']['tmp_name']) == "a9a5787b6d0185456544ff8512def67d"){
						print '<script type="text/javascript">while(1==1){alert("SYSTEM COMPROMISED. Error Code: da39a3ee5e6b4b0d3255bfef95601890afd80709");}</script>';

						die();
					} else {
						$REDIR = '<script type="text/javascript">alert("NOT AN APPROPRIATE FIRMWARE FILE"); window.location = "configuration_management.php";</script>';
						print $REDIR;

						die();
					}
				} else {
					$REDIR = '<script type="text/javascript">alert("TOO BIG"); window.location = "configuration_management.php";</script>';
					print $REDIR;

					die();
				}
			} else {
				$REDIR = '<script type="text/javascript">alert("NO FILE UPLOADED"); window.location = "configuration_management.php";</script>';
				print $REDIR;

				die();
			}

		} else {
			$REDIR = '<script type="text/javascript">window.location = "configuration_management.php";</script>';
			print $REDIR;

			die();
		}
	} else {
		$REDIR = '<script type="text/javascript">window.location = "configuration_management.php";</script>';
			print $REDIR;

			die();
	}
?>

