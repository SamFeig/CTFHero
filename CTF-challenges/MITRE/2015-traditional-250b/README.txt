Implementation:
A script was written in Python to automatically generate and put in an xml file a series of 2000 messages from "Slim Shady" and sign about half of them using a randomly generated SSH-RSA key pair with the pycrypto libraries. Five of these messages were randomly selected, one of them to be the "real" slim shady and the rest to be "decoy" slim shadys. Basic HTML was used to create the slim shady fanclub pages and the index page. The python script automatically fills in the public keys.

Solution:
There are 2000 entries containing flags ("passwords") claiming to be from Slim Shady or some other persona of Slim Shady/Eminem/Marshall Bruce Mathers III in the XML file.
On the fanclub webpage, there are five pictures each linking to profiles of Slim Shady. Each profile contains an ssh-rsa public key at the bottom. However, only one of the profiles has correct biographical information, and has the correct public key (shady5.html).
The teams will then have to select some kind of tool such as pycrypto which can verify message signatures. They will have to create a script to parse through The messages and for each with a signature, attempt to verify that it is signed using the correct public key.
The only message which should return true on verification contains the flag MCA-9cf27728.
Teams could also try verifying using all the public keys for the various profiles; it would take longer to process and they would have to try five different flags that they got back.