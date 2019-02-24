This is differential power analysis on AES-128.
(Thanks to Gabriel P. for help in preparing this challenge)

Flag: MCA-9FDE15B1C325059E


Problem:

Our new car supports remote updates so that the manufacturer can
send firmware updates for bug fixes or new features.
The firmware update is always encrypted with AES-128 before being
sent out and the car decrypts it and checks for validity before installing.
Seems reasonable enough, right?!

Unfortunately, hackers are claiming that they've extracted our firmware
key through a power side-channel attack on the car's decryption system.
By recovering this key they are able to decrypt the firmware update to
see what's inside!

We can't believe this is real!  Please show us how it's done - we've attached
a set of power traces that were collected during the beginning of the car's
decryption process.  Is there actually enough information in these traces
to extract an AES key?!

Traces can be found [here](https://drive.google.com/file/d/0B48Lv30KB1sebFdGNG1weEoyQzg/view?usp=sharing).
