import numpy as np
import sounddevice as sd

sd.default.samplerate = 2500

time = 2.0
frequency = 440

f = open('s_data.txt', 'r')
x = f.readlines()
x = map(lambda s: s.strip(), x)
for i in range(len(x)):
    x[i] = int(x[i])*50
data = x

# Generate time of samples between 0 and two seconds
samples = np.arange(44100 * time) / 44100.0
# Recall that a sinusoidal wave of frequency f has formula w(t) = A*sin(2*pi*f*t)
wave = 10000 * np.sin(4 * np.pi * frequency * samples)
wave = data
# Convert it to wav format (16 bits)

wav_wave = np.array(wave, dtype=np.int16)

sd.play(wav_wave, blocking=True)


