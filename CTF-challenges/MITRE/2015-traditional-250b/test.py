from Crypto.PublicKey import RSA
from Crypto import Random
from Crypto.Hash import SHA256

import random
random_generator=Random.new().read
key=RSA.generate(1024,random_generator)
public_key=key.publickey().exportKey('OpenSSH')
pubkey=RSA.importKey(public_key)
mes="jello"
hash=SHA256.new(mes).digest()
signature=key.sign(hash, '')
sig=signature[0]
if pubkey.verify(hash,(sig,"")):
	print "The signature is authentic"
else:
	print "The signature is not authentic"