mkdir -p ../feats ../feats/f0 ../feats/sp ../feats/mgc ../feats/ap ../resynth ../test ../feats/spabs

# Step 01: Extract features
python 01_extract_feats.py

# Step 02: Convert this spectrum into mgc. Ideally this can be written here but writing it as a separate script as in future we can use different spectral transformation techniques. 
sh 02_sp_to_mcep.sh

# Step 03: Build a KD Tree with n=1 and m='euclidian'
cat ../feats/mgc/text* > hindi.mgc
python 03_replace_frames.py

# Step 04: Convert mgceps to straight spectrum
sh 04_mcep_to_sp.sh
python 05_resynth.py
