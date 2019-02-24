# Cyberville Level 6 (500pt Challenge)

This challenge requires the competitor to use advanced networking and binary forensics in order to upload a trojan firmware image to a network switch, which will cause the city's power grid to malfunction and black out. The challenge is based off of a talk given by Eireann Leverett called [Switches Get Stitches](https://www.youtube.com/watch?v=CWZjQ4BTD0k) where an exploit to the GE ML800 network switch is revealed in the way the device uses SSL to encrypt all traffic except for updating the firmware. In this challenge, the competitor is given a pcap of this transaction during which the switch's firmware is being upgraded, which allows the competitor to decrypt the SSL by obtaining a private key in the unencrypted file transfers. From there, the user can obtain the uid and pass of the device's admin page, where the competitor can upload the trojan firmware to exploit the city's power grid.

Note that to prevent the competitors from finding the talk, all references of the brand and model of network switch have been removed.

#### To build
1. Pull the repository
2. Change directory into ```src```.
3. Run ```docker build -t blackout .```.
4. Run ```docker run -p 80:80 blackout```.

#### Solution
To view in-depth information about the logical steps that go into reverse engineering the transfer, look at ```Multilink-Blog.txt```.

1. Download ```firmware-update.pcapng``` and ```trojan_firmware.bin``` from the dstr directory.
2. Run ```tcptrace -n -e firmware-update.pcapng```. This will carve out all of the files in the transfer. The outlier in this set of transfers is the one that occurs on ports ```1356``` and ```971``` while all of the other transfers happen on ports of much lower number.
3. Run ```strings bm2bn_contents.dat | less```. This will run strings on the contents of the specific file transfer that happened on those high-numbered ports. Hold down the "Page Down" key on the keyboard until you notice something that appears to be readable text. There are two very import strings in this text: 
- inflate 1.1.3 Copyright 1995-1998 Mark Adler
- deflate 1.1.3 Copyright 1995-1998 Jean-loup Gailly
The presence of ```inflate``` and ```deflate``` mean there is a compressed file somewhere in that transfer.
4. Make a copy of ```bm2bn_contents.dat``` and call it ```bm2bn.bin```.
5. Because the whole stream is not a compressed file, a script must be written to brute-force the location of the compressed file ([example python script](solution/ZLIB-finder.py)).
6. Once the portion of the stream that is compressed is found, run ```dd if=bm2bn_contents.dat of=compressed.bin skip=[STARTING SECTION] bs=1 count=[ENDING SECTION]``` to get the compressed part of the stream.
7. This alone cannnot be unzipped by gzip. The bytes that are unique to gzip must be added. Run ```printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" | cat - compressed.bin | gzip -dc > decomp.bin```. Note that it may give you a few warnings, but should still work.
8. Now we have the file. Run ```strings decomp.bin | less```, and hold "Page Down" to look through the file.
9. When you come across the RSA Private Key, copy it down in a file ("key" for example).
10. Open ```firmware-upgrade.pcapng``` in wireshark.
11. Go to ```Edit -> Preferences -> Protocols -> SSL```. Click on ```Edit``` in the "RSA keys list", and add a new key for IP address ```192.168.0.12``` (found in the pcap) for port ```443``` and protocol ```http```. Set the key file to be the one you saved with the RSA Key that was obtained from the compressed file. Leave the password field blank and hit "okay".

12. Filter with something like ```tcp.stream eq 1```. Right click a packet and follow the SSL stream. Type "find" and search for "pass". Repeat this process by incrementing the number after "eq" until you find ```pass=manager```.
13. Login in the interface with the uid and pass found in the ssl stream.
14. Upload trojan_firmware.bin to the webserver.
15. Obtain the key and put it in the scoreboard for 500pts.

Key: da39a3ee5e6b4b0d3255bfef95601890afd80709
