from __future__ import division, print_function

import os
import argparse
import numpy as np
import soundfile as sf
import pyworld as pw
import numpy as np


parser = argparse.ArgumentParser()
parser.add_argument("-f", "--frame_period", type=float, default=5.0)
parser.add_argument("-s", "--speed", type=int, default=1)


EPSILON = 1e-8


def main(args):
    
    '''
    #if os.path.isdir('../feats'):
    #    pass # Ideally we have to clear the tree here but leaving it as is for now, for easy replication of expts
    #else:
    #    os.mkdir('../feats')
    '''
    files = sorted(os.listdir('../../wav'))
    for file in files:
      #if 'text' in file:   # Enable if you want to extract feats only for hindi sentences. Saves time
        print(file)
        fname = file.split('.wav')[0]
        x, fs = sf.read('../../wav/' + file)

        # Extract Features
        f0, sp, ap = pw.wav2world(x, fs)    # use default options

        # Save Features
        np.savetxt('../feats/f0/' + fname + '.f0', f0)
        np.savetxt('../feats/sp/' + fname + '.sp', sp)
        np.savetxt('../feats/ap/' + fname + '.ap', ap)
    
        # Optionally resynthesize to check quality
        y = pw.synthesize(f0, sp, ap, 16000, args.frame_period)    
        sf.write('../resynth/' + fname + '.wav',y,16000)        

if __name__ == '__main__':
    args = parser.parse_args()
    main(args)
