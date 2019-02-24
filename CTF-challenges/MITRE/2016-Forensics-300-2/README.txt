-----------------challenge-----------------------
Attached is a Pcap from wireshark containing a print job from one computer on a network to another.
The print job contains a PNG image that was printed to a PDF printer on the other computer with the MCA key on it.
The goal is to find the packet that contains the print and reconstruct it to view the MCA key



-----------------soloution
It can be obtained by finding the packet that contains post script information. Headers need to be cleaned up from the data and the nthe file can be saved as a .ps files

The Key to this challenge is MCA-F231BC1B