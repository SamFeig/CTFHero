# RECOMMENDED DESCRIPTION FOR PARTICIPANTS #
Can you reverse this file?

# DESCRIPTION FOR WHITE CELL #
Participants will be presented with a single 64-bit ELF file (statically linked and stripped).  If executed, the binary presents 3 hints to the user:
1.	Now there's a file somewhere on your system.
	.galf eht dnif dna ti nep0
2.	Do you like reversing?
	.ereh uoy pleh thgim tI
3.  Were you able to open the file?
	?drowssap a evah ti seoD
If run under a debugger (e.g. GDB), execution terminates with the message:
"Debuggers make me giggle.  Why don't you try some REAL reversing?"

# FLAG FORMAT #
flag{...flag...}, where the actual flag text is contained within curly braces.

# FLAG #
I_DON'T_THINK_IT_MEANS_WHAT_YOU_THINK_IT_MEANS...

# FILE SUMMARY #
The binary is essentially trollware with "reversing" as its theme.  
Appended to the end of the ELF file (EOF-stego style) is a password-protected ZIP file, whose password is "drowssap" (i.e. "password" in reverse).
After opening the ZIP file, the user can extract a single file "gpjret.off" (i.e. "footer.jpg" in reverse).
That file is a JPG whose bytes have been wholly reversed.  
When returned to normal (i.e. wholly reversed a second time), the Inigo Montoya meme JPG reveals the flag message.

# SOLUTION STEPS#
1. Open the ELF in a hex editor and search for the hex bytes "50 4B 03 04", which is the magic number string for a PKZIP file.
2. Extract all bytes from the beginning of the 50 4B 03 04 magic number to the end of the file and write them to an empty file object.
3. Use the password "drowssap" to extract the "gpjret.off" file.
4. Reverse all of the bytes in the file and save that stream to another file object.  NOTE: the included reverse-2.py file will reverse the bytes of the binary file.
5. Open the file to find the flag I_DON'T_THINK_IT_MEANS_WHAT_YOU_THINK_IT_MEANS...

# AUTHORSHIP CREDITS #
Original author: John Aruta
Updated by: Kenneth Zahn