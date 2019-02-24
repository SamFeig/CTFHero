# OS X keychain decryption

Based off http://juusosalonen.com/post/30923743427/breaking-into-the-os-x-keychain

Create an OS X keychain with several saved passwords, one of the passwords being the flag. Get a memory dump of the securityd process and give it to competitors. They will have to 1) recognize the format of the memory 2) write a script to scan the memory for master key candidates 3) follow the decryption process mentioned in the paper mentioned in the article. 4) once the process is complete, scan the list of passwords for the flag. 

https://drive.google.com/drive/folders/0B48Lv30KB1seVnZEX2Q2blJhNWM?usp=sharing
