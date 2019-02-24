from PIL import Image
img = Image.open("img.png")
pix = img.load()
s = ""
for i in range(0,9):
	for j in range(0,10):
		s = s + str(unichr(pix[j,i][2]))
print s