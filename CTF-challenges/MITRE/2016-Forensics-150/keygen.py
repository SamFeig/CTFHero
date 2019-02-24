import os

key = raw_input("Enter the key: ")

for idx,c in enumerate(key):
  decimalValue = ord(c)+idx
  

  print "<item>" + str(decimalValue) + "</item>"  
