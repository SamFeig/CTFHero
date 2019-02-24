import xml.etree.ElementTree as ET
from Crypto.PublicKey import RSA
from Crypto import Random
from Crypto.Hash import SHA256


pubkey=RSA.importKey('ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCbT3x5Uk2aQuExM/mozvXZvoZ3HC5hsHgG18FLAmb2mESHm2ZvPveqDt/dqOop+5hSoY5L5zsfi61Xec9kCKTn6AgVDWMG7EHyr4jyQ5bL6je+jdcIEVgCL+WqkWR16RNZzPIkdkPzxl+6h5DF1vplWggStvZOv5DVvkpFWHMLMQ==')

inbox=ET.parse('email.xml').getroot()

for email in inbox.findall('email'):
	for signature in email.findall('signature'):
		for message in email.findall('message'):
			mes=message.text
			hash = SHA256.new(mes).digest()
			sig=long(signature.text)
			if pubkey.verify(hash, (sig,"")):
				print 'verified message: '+mes
				break