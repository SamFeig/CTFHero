import random
from IPython import embed
import time


seed = round(time.time())
random.seed(seed)
print("Seed is: "+str(seed))

with open('HUGEthumbdrive.img', 'rb') as f:
	HUGEthumbdriveData = bytearray(f.read())
print(len(HUGEthumbdriveData))

numToSplit = 50000
chunksOfData = [HUGEthumbdriveData[i:i+numToSplit] for i in range(0, len(HUGEthumbdriveData), numToSplit)]
random.shuffle(chunksOfData)



rereadChunks = bytearray("")
for i in range(0,len(chunksOfData)):
	if len(chunksOfData[i]) < numToSplit:
		print("Problem detected with size on chunk "+str(i))
	with open('chunk'+str(i)+'.dat', 'wb') as f:
		f.write(str(chunksOfData[i]))
	with open('chunk'+str(i)+'.dat', 'rb') as f:
		rereadChunks += bytearray(f.read())
chunksOfDataNew = [rereadChunks[i:i+numToSplit] for i in range(0, len(rereadChunks), numToSplit)]
print(chunksOfDataNew == chunksOfData)

def decrypt(message, key):
	for i in range(0,len(message)):
		message[i] = str(message[i])

	random.seed(key)
	l = list(range(len(message)))
	random.shuffle(l)
	return "".join(message[i] for i, x in sorted(enumerate(l), key=lambda x: x[1]))

output = decrypt(chunksOfDataNew,seed)
with open('Reassembled.img', 'wb') as f:
	out = ''.join(map(str, output))
	f.write(out)
	print(out == HUGEthumbdriveData)


