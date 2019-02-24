# RECOMMENDED DESCRIPTION TO PARTICIPANTS #
We found these two suspicious files, "_1._" and "_2._", on one of our ICS-connected devices following an incident response investigation. We can't figure out what they are. Can you?

# DESCRIPTION FOR WHITE CELL #
This challenge ships with two binaries, "_1._" and "_2._"-- both are located in the "Custom-Challenge Files.zip" file. 
The first binary, "_1._" is the application that was used to generate the second program, "_2._". 
The first binary is a 'packer' that simply encrypts a payload using AES-128 in CBC mode.

# FLAG FORMAT #
flag{...flag...}, where the flag text is contained within the curly braces.

# FLAG #
scada_is_better_with_aes

# ENCRYPTION PARAMETERS #
key[KEYLEN] = { 0xde, 0xc0, 0xde, 0xc0, 0xff, 0xee, 0xfe, 0xed, 0xde, 0xc0, 0xde, 0xc0, 0xff, 0xee, 0xfe, 0xed };
iv[16]      = { 0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff };

# SOLUTION STEPS #
1. Examine the first binary and identify that AES-128 is being used in CBC mode with the appropriate key and IV.  NOTE: AES can be identified by finding the magic numbers used in the S-Boxes.
2. Load the first binary into a debugger and single-step to just before the calling of the encryption function; this will show the key and IV (NOTE: this can also be observed by using static analysis, as the key and IV are not obfuscated within the file).
3. Write a simple python script to decrypt the second binary. Once decrypted, the second binary is a simple payload that decrypts and displays the flag at run time.

# AUTHORSHIP CREDITS #
Samuel "Slam" Cappella