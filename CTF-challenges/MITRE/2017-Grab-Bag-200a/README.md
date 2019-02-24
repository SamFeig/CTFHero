# gyroscope Microphone

## How to Solve
1. run the python solver script 
OR 
1.make one yourself
I used this link for reference
https://stackoverflow.com/questions/10357992/how-to-generate-audio-from-a-numpy-array
I modified the code a bit and tweaked it until I got sound and then changed the numbers until I could hear the audio

## how challenge was made/premise
Microphone data was sent into an Arduino analog to digital converter giving arbitrary values around 270. The range of values for the Arduino digital to analog converter is 10 bit so 2^10 or from 0-1023. The audio data is technically in an amplitude modulation. Data from the Arduino was sent over a serial port and copied and pasted into the data text file.
All the users need is the data file and a brief description for the challenge, perhaps the paragraph below
“A recent exploit was discovered that allows malicious apps to read data from the gyroscope of a phone fast enough for it to pick up the faint vibrations of audio, attached is a list of the data that was obtained from the gyroscope sensor. “

# Flag

MCA-flag is: MCA{audio_is_fun_sometimes}


