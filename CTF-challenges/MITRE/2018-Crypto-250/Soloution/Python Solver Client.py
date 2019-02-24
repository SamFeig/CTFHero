import socket
import sys

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect the socket to the port where the server is listening
server_address = ('192.168.106.130', 6901)
print >>sys.stderr, 'connecting to %s port %s' % server_address
sock.connect(server_address)
# The AES key used for encrytp/decrypt is "7AA2701864CB9C4F"
#(old version used "3DF2104AB016B2DE" )
# below room is 3
message = ('{ "command": "main", "x": ' 
		'"701EA1EE8727AB76E26DBCC712560F2C",'
		' "y": "75B517D10F0335A04D0BC99A1A681B2B",'
		' "room":"D3D0083B6462A288CF36DA26A21ACBC5' 	
		'"}')
print >>sys.stderr, 'sending "%s"' % message
sock.sendall(message)

# Look for the response
amount_received = 0
amount_expected = 400
    
while amount_received < amount_expected:
   data = sock.recv(16)
   amount_received += len(data)
   print >>sys.stderr, 'received "%s"' % data


print >>sys.stderr, 'closing socket'
sock.close()










