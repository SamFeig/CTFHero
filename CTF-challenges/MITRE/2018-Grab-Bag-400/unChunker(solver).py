import random
from IPython import embed
import time
import re



seed = 1521743824

import glob, os
allChunkFiles = os.listdir(".\\outputChunks")
for i, s in enumerate(allChunkFiles):
	allChunkFiles[i] = re.findall(r'\d+', allChunkFiles[i])[0]
allChunkFiles = sorted(allChunkFiles, key=int)

chunksOfData = []
for chunk in allChunkFiles:
	with open(".\\outputChunks\\chunk"+chunk+".dat", 'rb') as f:
		chunksOfData.append(bytearray(f.read()))



def decrypt(message, key):
	for i in range(0,len(message)):
		message[i] = str(message[i])

	random.seed(key)
	l = list(range(len(message)))
	random.shuffle(l)
	return "".join(message[i] for i, x in sorted(enumerate(l), key=lambda x: x[1]))

output = decrypt(chunksOfData,seed)
with open('Reassembled.img', 'wb') as f:
	out = ''.join(map(str, output))
	f.write(out)
	#print(out == HUGEthumbdriveData)


