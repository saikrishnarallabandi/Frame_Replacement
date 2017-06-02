import os,sys
import numpy
from sklearn.neighbors import KDTree
import numpy as np
import cPickle

hindi_file = 'hindi.mgc'
classifier_name = 'hindi_KDTree.pkl'

### I find that sometimes np.loadtxt fails. 
hindi_frames = []
f = open(hindi_file)
#hindi_frames = np.loadtxt(hindi_file)
for line in f:
    line = line.split('\n')[0].split()
    hindi_frames.append(np.asarray(line))
f.close()

def get_hinditree(hindi_file):
   if os.path.exists(classifier_name):
     with open(classifier_name, 'rb') as fid:
        kdt = cPickle.load(fid)
        print "Found model, so returning directly"
   else:     
      print "Building KDT Tree"
      kdt = KDTree(hindi_frames,  metric='euclidean')
      print "Built KDT Tree"
      with open('hindi_KDTtree.pkl', 'wb') as fid:
         cPickle.dump(kdt, fid)    
   return kdt

english_folder = '../feats/mgcep'
output_folder = '../feats/mgcep_replaced'
files = sorted(os.listdir(english_folder))
get_hinditree()

for file in files:
  if 'arctic' in file:
    #if c > 0:
    #   sys.exit(0)
    print file
    arctic_original = numpy.loadtxt(english_folder + '/' + file)
    dist, ind = hindi_tree.query(arctic_original, k=1)
    indices = numpy.ndarray.tolist(ind)
    index = [k[0] for k in indices]
    g = open(output_folder + '/' + file, 'w')
    for i in index:
        g.write(' '.join(k for k in hindi_frames[i]) + '\n')
    g.close()     
   
   
