# RECOMMENDED DESCRIPTION FOR PARTICIPANTS #
Your Network Security Team presents you with a PCAP file and states that it contains evidence of data exfiltration.  Can you find the flag that was exfiltrated along with the data?

# DESCRIPTION FOR WHITE CELL #
Participants will be presented with a PCAP file containing what appears to be a large JPG file that was exfil'ed using some HTTP trickery (NOTE: the JPG file was exfil'ed randomly, so the packets are out of order).  Appended to the JPG file is a LUKS-encrypted partition image file.

Participants must reconstitute the transferred file, use the password stored in the JPG image file to unlock the LUKS partition, and recover the deleted PNG file from the ext4 filesystem within the LUKS image file.

# FLAG FORMAT #
flag={...flag...}, where the actual flag text is contained within curly braces.

# FLAG #
ZOMG_4ll_Th3_L4y3rs

# SOLUTION STEPS #
1.  Use wireshark to filter the PCAP down to the responses to the get requests for the JPG file.
2.  Export the filtered packets.
3.  Write a script with python and scapy to sort the partial request responses by byte indices.
4.  Trim the extra byte off of the response data and concatenate the responses together.
5.  Write the concatenated data to a file
6.  Remove the jpeg image from the beginning of the file from either dd or a hex editor.
7.  Identify the file which was after the jpeg trailer as a LUKS encrypted file.
8.  Locate the password for the LUKS encrypted file in the jpeg image (password is "ENIGMA").
9.  Mount the encrypted file using cryptsetup
10.  Use any data file carving tool (e.g. scalpel, foremost, FTK, etc) and carve the ext4 filesystem inside the LUKS encrypted file to extract the deleted png file which has a the flag in it.

NOTE:  The reconstruct_jpg_from_pcap.py and extract_luks_from_jpg.py python scripts should recover both files, leaving only steps 9 and 10 to be performed.

# AUTHORSHIP CREDITS #
Author: Bob Roberson