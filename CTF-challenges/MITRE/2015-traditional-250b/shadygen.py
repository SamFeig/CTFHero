from Crypto.PublicKey import RSA
from Crypto import Random
from Crypto.Hash import SHA256
from Crypto.PublicKey import RSA

import random

#Variables
random_generator=Random.new().read
minMessages=10000
maxMessages=20000
outEmail="email.xml"
outPubKeys="pubkeys.txt"

#Open text files
email=open(outEmail,'w')
pubkeys=open(outPubKeys, 'w')

email.write('<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<inbox>\n')

#determine how many "emails" we are going to have
numMessages=2000

#decide which of the messages are going to be from good imposters and from the legitimate artist
goodMessages=random.sample(range(0,numMessages),5)
print goodMessages

#Generate a message from each of these people.
for i in range (0,numMessages):
	#randomly decide whether the message will have a signature, be encrypted, or neither
	encType=random.randint(0,1)

	#Overwrite this to make the message have a signature if it is a good message
	if i in goodMessages:
		encType=1

	#Generate the email out of a random item from a set of message titles and bodies.
	titles=["Password","The Password", "Got you the password","That thing you needed","Here it is"]
	greetings=["Yo, ","Hey, ","Wassup, ", ""]
	intros=["It's me, ","Its me, "]
	name=["Slim.","Shady.","Slim Shady.","Eminem.","Marshall.","Marshall Mathers.","M&amp;M.","Double M."]
	message1=["I got you ","I heard you needed ", "Here is ", "I'm sending you ", "This is ", "I sent you ", "Attached is "]
	articles=["the ","my ","a "]
	pwvariants=["password","pw","passcode","pass"]

	title=titles[random.randint(0,4)]
	message=greetings[random.randint(0,3)]+intros[random.randint(0,1)]+name[random.randint(0,7)]+message1[random.randint(0,6)]+articles[random.randint(0,2)]+pwvariants[random.randint(0,3)]+'\n'

	#Generate a random flag
	flagdec=random.randint(268435456,4294967295)
	flaghex=hex(flagdec)
	flag="MCA-"+str(flaghex[2:])
	flag=flag[:12]
	message=message+flag	

	signature="none"	

	#If the message is supposed to be signed or encrypted, generate a random pk.
	#Then sign or encrypt the message.
	if encType != 0:
		key=RSA.generate(1024,random_generator)
		public_key=key.publickey()
		if encType==1:
			hash=SHA256.new(message).digest()
			signature=key.sign(hash, '')
	

	#If the message is a 'goodMessage', save the public key
	if i in goodMessages:
		readfrompage=open("shady"+str(goodMessages.index(i)+1)+"blank.html",'r')
		pagecontent=readfrompage.read()
		shadypage=open("shady"+str(goodMessages.index(i)+1)+".html",'w')
		pubkeys.write(public_key.exportKey('OpenSSH')+'\n')
		shadypage.write(pagecontent+" "+public_key.exportKey('OpenSSH')+'</p>\n</body>\n</html>')
		shadypage.close()
		readfrompage.close()

	#If the message comes from the actual artist, also save the flag.
	if i == goodMessages[3]:
		pubkeys.write(flag+'\n')

	#Format the message portions in XML and save to the set of emails.
	emailmsg='\t<email>\n\t\t<from>shady@imtherealshady.com</from>\n\t\t<topic>'+title+'</topic>\n\t\t<message>'+message+'</message>'
	if encType==1:
		emailmsg=emailmsg+'\n\t\t<signature>'+str(signature[0])+'</signature>'
		emailmsg=emailmsg+'\n\t</email>\n'
		email.write(emailmsg)

email.write('</inbox>')
#Save and close the set of emails.
email.close()

#Save and close the set of public keys.
pubkeys.close()
