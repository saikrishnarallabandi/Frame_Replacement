#!/usr/bin/python
import numpy as np
import os

telugu_f0_frames = np.loadtxt("tamil_f0")
english_f0_frames = np.loadtxt("english_f0")


mu_telugu = np.mean(np.sort(telugu_f0_frames))
mu_english = np.mean(np.sort(english_f0_frames))


std_telugu = np.std(telugu_f0_frames)
std_english = np.std(english_f0_frames)


f0_files = sorted(os.listdir('f0_ascii'))
for file in f0_files:
    if 'arctic' in file:
        print file
        orig_f0 = np.loadtxt('f0_ascii/' + file)
        mapped_f0 = ( std_telugu * 1.0 / std_english ) * ( orig_f0 - mu_english) + mu_telugu 
        mapped_f0[mapped_f0 < 0] = 0.0
        np.savetxt('f0_replaced_ascii/' + file, mapped_f0, fmt='%.3f')

print mu_telugu, std_telugu
print mu_english, std_english














