import os,sys
import numpy
from sklearn.neighbors import KDTree
import numpy as np
import cPickle

telugu_file = 'telugu_frames'
classifier_name = 'telugu_KDTree.pkl'
#telugu_str = 'telugu_strs'

###### Load the mceps and strs
# I find that sometimes np.loadtxt fails, so am using the old fashionned line by line method instead of a single line : telugu_frames = np.loadtxt(telugu_file)
telugu_frames = []
f = open(telugu_file)
for line in f:
    line = line.split('\n')[0].split()
    telugu_frames.append(np.asarray(line))
f.close()

#telugu_strs = []
#f = open(telugu_str)
#for line in f:
#    line = line.split('\n')[0].split()
#    telugu_strs.append(np.asarray(line))
#f.close()

###############################


def get_telugutree():
   if os.path.exists(classifier_name):
     with open(classifier_name, 'rb') as fid:
        kdt = cPickle.load(fid)
        print "Found model, so returning directly"
   else:     
      print "Building KDT Tree"
      kdt = KDTree(telugu_frames,  metric='euclidean')
      print "Built KDT Tree"
      with open('hindi_KDTtree.pkl', 'wb') as fid:
         cPickle.dump(kdt, fid)    
   return kdt

english_folder = 'mcep_deltas_ascii'
output_folder_mcep = 'mcep_deltas_replaced_ascii'  ### If this folder doesnt exist, we have bigger problems
#output_folder_str = 'str'
files = sorted(os.listdir(english_folder))
telugu_tree = get_telugutree()

for file in files:
  if 'arctic' in file:
    print file
    arctic_original = numpy.loadtxt(english_folder + '/' + file)
    dist, ind = telugu_tree.query(arctic_original, k=1)
    indices = numpy.ndarray.tolist(ind)
    index = [k[0] for k in indices]
    g = open(output_folder_mcep + '/' + file, 'w')
    #h = open(output_folder_str + '/' + file, 'w')
    for i in index:
        g.write(' '.join(k for k in telugu_frames[i]) + '\n')
        #h.write(' '.join(k for  k in str_frames[i]) + '\n')
    g.close()     
    #h.close()
   
