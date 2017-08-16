import os,sys
import numpy
from sklearn.neighbors import KDTree
import numpy as np
import cPickle

tamil_file = 'tamil_frames'
classifier_name = 'tamil_KDTree.pkl'
tamil_file_strs = 'tamil_frames_str'

###### Load the mceps and strs
# I find that sometimes np.loadtxt fails, so am using the old fashionned line by line method instead of a single line : tamil_frames = np.loadtxt(tamil_file)
tamil_frames = []
f = open(tamil_file)
for line in f:
    line = line.split('\n')[0].split()
    tamil_frames.append(np.asarray(line))
f.close()

tamil_strs = []
f = open(tamil_file_strs)
for line in f: 
    line = line.split('\n')[0].split()
    tamil_strs.append(np.asarray(line))
f.close()

###############################


def get_tamiltree():
   if os.path.exists(classifier_name):
     with open(classifier_name, 'rb') as fid:
        kdt = cPickle.load(fid)
        print "Found model, so returning directly"
   else:     
      print "Building KDT Tree"
      kdt = KDTree(tamil_frames,  metric='euclidean')
      print "Built KDT Tree"
      with open('hindi_KDTtree.pkl', 'wb') as fid:
         cPickle.dump(kdt, fid)    
   return kdt

english_folder = 'mcep_deltas_ascii'
output_folder_mcep = 'mcep_deltas_replaced_ascii'  ### If this folder doesnt exist, we have bigger problems
output_folder_str = 'str_replaced_ascii'

files = sorted(os.listdir(english_folder))
tamil_tree = get_tamiltree()

for file in files:
 if os.path.exists(output_folder_mcep + '/' + file):
   print "File exists ", file
 else:
   if 'arctic' in file:
    print file
    arctic_original = numpy.loadtxt(english_folder + '/' + file)
    dist, ind = tamil_tree.query(arctic_original, k=1)
    indices = numpy.ndarray.tolist(ind)
    index = [k[0] for k in indices]
    g = open(output_folder_mcep + '/' + file, 'w')
    h = open(output_folder_str + '/' + file.split('.')[0] + '.str', 'w')
    for i in index:
        g.write(' '.join(k for k in tamil_frames[i]) + '\n')
        h.write(' '.join(k for  k in tamil_strs[i]) + '\n')
    g.close()     
    h.close()
   
