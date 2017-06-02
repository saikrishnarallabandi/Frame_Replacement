from __future__ import division, print_function

import os
from shutil import rmtree
import argparse
import numpy as np
import matplotlib      # Remove this line if you don't need them
matplotlib.use('Agg')  # Remove this line if you don't need them
import matplotlib.pyplot as plt
import soundfile as sf
import pyworld as pw
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--frame_period", type=float, default=5.0)
parser.add_argument("-s", "--speed", type=int, default=1)

EPSILON = 1e-8

def main(args):
    if os.path.isdir('resynth'):
        rmtree('resynth')
    os.mkdir('resynth')
    
    files = sorted(os.listdir('feats/iitm_spabs'))
    for file in files:
      if '.arctic' in file:
          pass
      else:
        print(file)
        fname = file.split('.sp')[0]
        f0 = np.loadtxt('feats/iitm_f0/' + fname + '.fo')
        ap = np.loadtxt('feats/iitm_ap/' + fname + 'ap')
        #with open('feats/iitm_spabs/' + fname + '.sp') as f:
        #    lines = f.readlines()
        #arr = []
        #for line in lines:
        #    line = line.split('\n')[0].split()
        #    arr.append(np.asarray(line))
            #arr.append(' '.join(k for k in line))
        sp = np.loadtxt('feats/iitm_sp/' + fname + '.sp')  
        #sp = np.array(arr)
        #print(sp)
        y = pw.synthesize(f0, sp, ap, 16000, args.frame_period)    
        print("Generated file")
        sf.write('resynth/' + fname + '.wav',y,16000)

if __name__ == '__main__':
    args = parser.parse_args()
    main(args)
