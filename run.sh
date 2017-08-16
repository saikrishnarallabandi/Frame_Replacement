#!/bin/bash

# Preprocessing
./bin/prune_silence etc/txt.done.data
./bin/prune_middle_silences etc/txt.done.data

# Text Processing
./bin/do_build build_prompts etc/txt.done.data
./bin/do_build label etc/txt.done.data
./bin/do_clustergen parallel build_utts etc/txt.done.data
./bin/do_clustergen generate_statenames etc/txt.done.data
./bin/do_clustergen generate_filters etc/txt.done.data

# Extract features
./bin/do_clustergen parallel f0_v_sptk etc/txt.done.data
./bin/do_clustergen parallel mcep_sptk etc/txt.done.data
./bin/do_clustergen str_sptk

# Project English features
cat etc/txt.done.data | grep "tam" > etc/txt.done.data.tamil
cat etc/txt.done.data | grep "arctic" > etc/txt.done.data.english
./bin/do_projection_str kdtree 

# Combine Coefficients
./bin/do_clustergen parallel combine_coeffs_me_strmodified etc/txt.done.data

# Indicate that you are using Mixed Excitation
mv festvox/clustergen.scm festvox/clustergen.scm.orig
cat festvox/clustergen.scm.orig |
sed 's/mixed_excitation nil/mixed_excitation t/' |
cat >festvox/clustergen.scm

# Split the data
./bin/traintest etc/txt.done.data

# Train
./bin/do_clustergen parallel cluster etc/txt.done.data.train
./bin/do_clustergen dur etc/txt.done.data.train

# Test
./bin/do_clustergen cg_test resynth cgp etc/txt.done.data.test
./bin/do_clustergen cg_test tts tts etc/txt.done.data.test





#### RF voice building

## Because I often make an error in not copying the flite specific
## dur feats, I'll copy them here if the current one equals the default
if cmp -s festival/dur/etc/statedur.feats $FESTVOXDIR/src/clustergen/statedur.feats
then
    echo updating duration feats for flite
    cp -p $FESTVOXDIR/src/clustergen/statedur.feats_flite festival/dur/etc/statedur.feats
fi


# Basic build stats and stuff


# Test initial build to get basic stats
$FESTVOXDIR/src/clustergen/cg_test resynth cgp_base etc/txt.done.data.test >mcd-base.out
# For historical compatibility we'll copy the predicted cgp files
cp -plr test/cgp_base test/cgp
mv dur.dur.S25.out dur.dur.S25.out-base

# TTS for this model
$FESTVOXDIR/src/clustergen/cg_test tts tts_base etc/txt.done.data.test 

exit

# Optimize number of states in hmms
./bin/do_clustergen nstates

# Optimize wagon stop values for mcep trees
./bin/do_clustergen wstop

# Do 10 iterations of move label to improve build
$FESTVOXDIR/src/clustergen/do_move_label $PARALLEL 20
# Select the best build
$FESTVOXDIR/src/clustergen/do_move_label select

# Rebuild with best labels
./bin/do_clustergen cluster etc/txt.done.data.train
./bin/do_clustergen dur etc/txt.done.data.train
mv dur.dur.S25.out dur.dur.S25.out-ml

# Final stats
$FESTVOXDIR/src/clustergen/cg_test resynth cgp_all >mcd-ml.out

exit

# Build a flite voice from this build
rm -rf flite
$FLITEDIR/tools/setup_flite
./bin/build_flite cg
cd flite
make




## Will (eventually) generate an MCD score in mcd-base.out
grep MCD mcd-base.out

## set mixed_excitation  [ 20 mins ]
#mv festvox/clustergen.scm festvox/clustergen.scm.xxx
#cat festvox/clustergen.scm.xxx |
#sed 's/mixed_excitation nil/mixed_excitation t/' |
#cat >festvox/clustergen.scm

#./bin/do_clustergen parallel str_sptk
#./bin/do_clustergen parallel combine_coeffs_me
./bin/do_clustergen parallel cluster etc/txt.done.data.train

## Improve the labels a bit   [ 5 hrs ] 
./bin/do_move_label_me parallel 10
./bin/do_move_label_me parallel select
./bin/do_clustergen parallel cluster etc/txt.done.data.train
## Will generate a summary of each pass in ml/summary
cat ml/summary

#  Generate some test examples
./bin/do_clustergen parallel utt_by_utt_tts etc/txt.done.data.test tts_base
rm -rf test/tts_base
mv test/all test/tts_base

## Build basic flite voice
$FLITEDIR/tools/setup_flite
./bin/build_flite
( cd flite;
  make;
  make voicedump;
  $FLITEDIR/bin/flite -voice ./*.flitevox "hello world" hw.wav;
  # Should give a flitevox voice file and a generated waveform file
  ls -al *.flitevox *.wav;
  cd ..
)
mv flite flite_base

## Build 20 random forests on params  [ 2 hrs ]
mv festvox/clustergen.scm festvox/clustergen.scm.xxx
cat festvox/clustergen.scm.xxx |
sed 's/mcep_clustersize 50/mcep_clustersize 15/' |
sed 's/f0_clustersize 200/f0_clustersize 150/' |
sed 's/cg:rfs nil/cg:rfs 20/' |
cat >festvox/clustergen.scm
./bin/do_clustergen parallel cluster etc/txt.done.data.train
## Will generate 20 trees for each HMM state in all_rf/
## Put the random forests together into full models (and duplicate
## trees if there are any missing)
./bin/build_rfs rf_post_build

## Do 20 random forests on duration [ 1 hrs 30min ]
## note we don't need to set anything in clustergen.scm to do the build
## but lets limit how many (param) rf_models are loaded during the
## duration build
echo "01" >rf_models/mlist
echo "01" >rf_models/mlistf0
./bin/build_rfs build_dur_rfs
## Will generate 20 models in dur_rf_models/

## Find best subset of trees for duration   [ 10 mins ]
./bin/build_rfs minimize_rfs_dur
## Will generate scores for best N models in mlist_dur.betters
## Take best 3 dur models (this might not be optimal)
tail -6 mlist_dur.betters | head -1 >dur_rf_models/mlist

## Find best 3 trees for params             [ 2 hrs / 10 hrs ]
./bin/build_rfs minimize_rfs_mcep_3
## Take best 3 param models (this might not be optimal)
tail -1 mlist.best.all | awk '{print $1,$2,$3}' >rf_models/mlist

## Find best 3 trees for f0             [ 2 hrs / 10 hrs ]
./bin/build_rfs minimize_rfs_f0_3
## Take best 3 f0 models (this might not be optimal)
tail -1 mlistf0.best.all | awk '{print $1,$2,$3}' >rf_models/mlistf0

## This second one (optional to above technique) does a greater search
## but gives the same results as the above -- but it'll give you information
## to know if you want 4 or 5 models rather than 3
#./bin/build_rfs minimize_rfs_mcep
## Will generate scores for best N models in mlist.best.all/mlist.betters
## Selection line if you used minimize_rfs_mcep rather than minimize_rfs_mcep_3
#tail -6 mlist.betters | head -1 >rf_models/mlist

# Now we can switch on rf dur, it'll get the name/number of models to load
# from dur_rf_models/mlist which is set above
mv festvox/clustergen.scm festvox/clustergen.scm.xxx
cat festvox/clustergen.scm.xxx |
sed 's/cg:rfs_dur nil/cg:rfs_dur 20/' |
cat >festvox/clustergen.scm

#  Generate some test examples
./bin/do_clustergen cg_test resynth cgp_rf3 etc/txt.done.data.test >mcd-rf3.out
./bin/do_clustergen parallel utt_by_utt_tts etc/txt.done.data.test tts_rf3
rm -rf test/tts_rf3
mv test/all test/tts_rf3

# Build flite rf3 voice [ 15 mins ]
$FLITEDIR/tools/setup_flite
./bin/build_flite
( cd flite;
  make;
  make voicedump;
  make add_feats;
  $FLITEDIR/bin/flite -voice ./*.flitevox "hello world" hw.wav;
  # Should give a flitevox voice file and a generated waveform file
  ls -al *.flitevox *.wav;
  cd ..
)
# Build a distributable Festival voice
./bin/do_clustergen festvox_dist

# OK, let's show some stats at the end
grep MCD mcd-base.out
grep MCD mcd-rf3.out
ls -al flite_base/*.wav flite_base/*.flitevox
ls -al flite/*.wav flite/*.flitevox

