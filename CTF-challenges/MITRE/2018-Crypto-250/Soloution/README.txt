Step 1) run the python script
Step 2) done...

if it doesn't work....
make sure server address and port are updated
server_address = ('192.168.106.130', 6901)


------how it works-----------

Python client sends the below packet to the server, in the packet it has the x and y and room index for the 3rd level at the flags cordinates, 
it is already encoded with AES key "7AA2701864CB9C4F" (the old version used key "3DF2104AB016B2DE") which could have been found by runing the "strings" command to the game files on linux.
When the server decodes this data and sees that the "player" is on the flag of the 3rd level it will send a packet back saying to go to room 4 and will also
send the flag packet with the encoded MCA flag data which can be decoded with the same AES key. 

message = ('{ "command": "main", "x": ' 
		'"701EA1EE8727AB76E26DBCC712560F2C",'
		' "y": "75B517D10F0335A04D0BC99A1A681B2B",'
		' "room":"D3D0083B6462A288CF36DA26A21ACBC5' 	
		'"}')

which is 
900nnnnnnnnnnnnn
700nnnnnnnnnnnnn
3nnnnnnnnnnnnnnn

for each variable respectively
