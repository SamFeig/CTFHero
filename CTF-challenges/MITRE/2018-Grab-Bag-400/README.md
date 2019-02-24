# FAT Chance
Flash drive image split into 50kb chunks and then chunks randomly shuffled and then half the chunks sent over HTTP and other half over FTP. Users must look at pcap and reverse the process

## About

**Description for Competitors:** Data exfiltration has been a problem in our organization recently. Just this week we saw more suspect traffic come across the wire. The problem is, information security can't figure out what was transmitted. We need your help!

*Here's some information that will help you during the investigation.* Due to employee outrage at SSL break/inspect, our information security department decided to "patch" the kernel and seed random values with timestamps so that users don't complain about HTTPS warnings when they browse the web and they can still decrypt all the traffic. It's genius!

**Description for White Cell/Solution:** Start with an image of a "flash drive", formatted FAT. Then, create a picture with the flag in it (large enough picture that we have a good probability the data will be split up sufficiently in the next steps) and store the picture on the flash drive image along with various other files of your choosing. Strip the FAT headers from the disk image and then pad to nearest 50kb with zeros.

Now, the disk image is going to be transported ‘randomly’ by giving a bad seed value (timestamp) to an easily accessible RNG (Python? Java?). Give the competitors a range of times to brute force through a hint from the challenge description.

Chunk the disk image into 50kb portions. These chunks will get rearranged/shuffled based on this "bad random" algorithm as follows:
Assume we have 200kb image.
That's 4 x 50kb portions.
Seed the random generator.
Use something like the following code to get the shuffled order (Ruby) `(0..4).to_a.shuffle.take(5)`
Suppose the output is `4 1 2 0 3`. The shuffle would be as follows.

```
Example:
Position 0 1 2 3 4
Data a b c d e
Rannum 4 1 2 0 3
Final d b c e a
```

Transmit chunks through 3 different methods (ftp 50%, http 50%). It is important to preserve the order they were transported (first % is ftp, middle % is ssh, last % is http).

IF we are feeling up to it we can have a weak key attack embedded in the ssh portion of the PCAP if we feel we can get it working.

Participants will have to reassemble transport based on chronological order. Rebuild, then reverse the random algorithm, and attach FAT headers to get the flag.

## How To Solve
Look at the http pcap and find the servers index page. On it is server time which will say GMT: Thursday, March 22, 2018 6:37:04 PM. This is the time to use from epoch, so epoch should be 1521743824 seconds. This is the seed value to use for caluclations. In python, take the chunks and unsort then, below is the sample soloution function

```
def decrypt(message, key):
	for i in range(0,len(message)):
		message[i] = str(message[i])

	random.seed(key)
	l = list(range(len(message)))
	random.shuffle(l)
	return "".join(message[i] for i, x in sorted(enumerate(l), key=lambda x: x[1]))
```

combine the chunks and then the flash drive image is create as a .img file. Mount the .img file and open the picture called "Desktop Background.bmp"

# Flag

MCA{obesogenic32_storage_device}