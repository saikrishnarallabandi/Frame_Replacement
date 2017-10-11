import sys,os
import numpy as np
from sklearn.neighbors import KDTree
import numpy as np
import cPickle

## We want to minimize the unit selection search criterion : Target cost and Join cost

classifier_join = 'KDTree.pkl'
classifier_target = 'KDTree_target.pkl'
surrogate_file = sys.argv[1]
str_file = sys.argv[2]
spectrum_file = sys.argv[3]
target_file = sys.argv[4]
target_str = sys.argv[5]
g = open(target_file,'w')
h = open(target_str,'w')

neighbours = 10


surrogate = np.loadtxt(surrogate_file,usecols=range(50))
spectrum = np.loadtxt(spectrum_file, usecols=range(50))



def get_KDTree(spectrum, filename):
   if os.path.exists(filename):
     with open(filename, 'rb') as fid:
        kdt = cPickle.load(fid)
        print "Found model, so returning directly"
   else:     
      print "Building KDT Tree"
      kdt = KDTree(spectrum,  metric='euclidean')
      print "Built KDT Tree"
      with open('KDTree.pkl', 'wb') as fid:
         cPickle.dump(kdt, fid)    
   return kdt

def get_target_cost(previous_frame, ind_join):
   target_cost_array = []
   for idx in ind_join:
      target_cost_array.append(np.sum(np.abs(previous_frame - spectrum[idx])))
   return np.asarray(target_cost_array)


spectral_frames = []
f = open(spectrum_file)
for line in f:
    line = line.split('\n')[0].split()
    spectral_frames.append(' '.join(k for k in line))
f.close()

str_frames = []
f = open(str_file)
for line in f:
    line = line.split('\n')[0].split()
    str_frames.append(' '.join(k for k in line))
f.close()

tree_join = get_KDTree(spectrum, classifier_join)
tree_target = get_KDTree(surrogate, classifier_target)
c = 0
for frame in surrogate:
   dist_join,ind_join = tree_join.query(frame,k=neighbours)
   if c == 0:
      c += 1
      target_cost = 0
      previous_frame = frame
   else:
      target_cost = get_target_cost(previous_frame, ind_join[0])
      for k in range(len(target_cost)):
           if target_cost[k] == 0:
                target_cost[k] = 10000
      dist_join = 0.6 * dist_join + 0.4 * target_cost
      previous_frame = frame      
   print ind_join, dist_join
   c = [ x for x,y in sorted(zip(ind_join, dist_join))]
   print ind_join, dist_join
   index_desired = c[0]
   index_desired = index_desired[0]
   g.write(spectral_frames[index_desired] + '\n')
   h.write(str_frames[index_desired] + '\n')
g.close()
h.close()
		
