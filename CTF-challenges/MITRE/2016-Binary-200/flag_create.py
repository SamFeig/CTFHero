#! /usr/bin/env python

#----------------------------------------
#  Script to convert flags into
#  rustled string for dank_asm challenge
#  for the MITRE CTF 2016
#
#  Written by: kierk
#  Contact at: apellitieri@mitre.org
#----------------------------------------

#----------------------------------------
#  For usage example try:
#	ezpZ_f1Ag
#	result: g~wQOp,dI
#
#  NOTE:  Not all flags work as some will
#	  produce unprintable bytes
#  NOTE2: If the flag is != 9 chars you
#    	  need to edit the MIPS addi -10
#	  instruction to be negative len+1
#----------------------------------------

from __future__ import print_function

# Get desired flag
ctf_flag = raw_input('What flag would you like to rustle: ')
orig_len = len(ctf_flag)

# Convert flag to 'rustled' format
# Written to mimic the MIPS code
t1 = 1
t2 = 1
t3 = 0
index = 0
rustled_array = []

# I need to adjust MIPS code if we want a flag other than lenth 9
while(index < orig_len):
	t2 = t2 + t1
	t1 = t1 + 1
	rustled_array.append(t2 ^ ord(ctf_flag[index]))
	index += 1

# Print resulting rustled flag
print("Rustled Flag: ", end="")
for i in rustled_array:
	print(chr(i), end="")
print("")

