#! /usr/bin/env python

#------------------------------------------
#  Simple script to calculate solution for
#  MITRE CTF dank_asm challenge 2016
#
#  Written by: kierk
#  Contact at apellitieri@mitre.org
#------------------------------------------

from __future__ import print_function

rustled = "g~wQOp,dI"

t1 = 1
t2 = 1
t3 = 0
index = 0
result_array = []

while (t1 - 10 != t3):
	t2 = t2 + t1
	t1 = t1 + 1

	print ("Modifying original character: ", rustled[index])
	numeric_letter = ord(rustled[index])
	xor_result = t2 ^ numeric_letter
	result_array.append(xor_result)

	index += 1

for i in result_array:
	print(chr(i), end="")

print("")
