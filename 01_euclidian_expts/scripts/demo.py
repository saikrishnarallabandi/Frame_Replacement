from __future__ import division, print_function

import os
from shutil import rmtree
import argparse

import numpy as np

import matplotlib      # Remove this line if you don't need them
matplotlib.use('Agg')  # Remove this line if you don't need them
import matplotlib.pyplot as plt

import soundfile as sf
# import librosa
import pyworld as pw

import numpy as np


parser = argparse.ArgumentParser()
parser.add_argument("-f", "--frame_period", type=float, default=5.0)
parser.add_argument("-s", "--speed", type=int, default=1)


EPSILON = 1e-8


def main(args):
    if os.path.isdir('test'):
        rmtree('test')
    os.mkdir('test')
    
    files = sorted(os.listdir('../iitm_wav'))
    for file in files:
      #if 'text' in file:  
        print(file)
        fname = file.split('.wav')[0]
        x, fs = sf.read('../iitm_wav/' + file)

        # Extract Features
        f0, sp, ap = pw.wav2world(x, fs)    # use default options
        y = pw.synthesize(f0, sp, ap, 16000, args.frame_period)    
        print("ABS without saving file")
        sf.write('test/' + fname + '.wav',y,16000)

        # Save Features
        np.savetxt('feats/iitm_f0/' + fname + '.f0', f0)
        np.savetxt('feats/iitm_sp/' + fname + '.sp', sp)
        np.savetxt('feats/iitm_ap/' + fname + '.ap', ap)
    
        # Load Features
        f0 = np.loadtxt('feats/iitm_f0/' + fname + '.f0')
        ap = np.loadtxt('feats/iitm_ap/' + fname + '.ap')
        sp = np.loadtxt('feats/iitm_sp/' + fname + '.sp')  
        y = pw.synthesize(f0, sp, ap, 16000, args.frame_period)    
        print("ABS after saving file")
        sf.write('resynth/' + fname + '.wav',y,16000)


if __name__ == '__main__':
    args = parser.parse_args()
    main(args)
