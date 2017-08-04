#!/bin/bash

# Preprocessing

./bin/do_build build_prompts etc/txt.done.data
./bin/do_build label etc/txt.done.data
./bin/do_clustergen parallel build_utts etc/txt.done.data
./bin/do_clustergen generate_statenames etc/txt.done.data
./bin/do_clustergen generate_filters etc/txt.done.data

# Extract features
./bin/do_clustergen parallel f0_v_sptk etc/txt.done.data
./bin/do_clustergen parallel mcep_sptk etc/txt.done.data

# Project English features
cat etc/txt.done.data | grep "tel" > etc/txt.done.data.telugu
cat etc/txt.done.data | grep "arctic" > etc/txt.done.data.english
./bin/do_projection kdtree etc/txt.done.data.english

# Combine coeffs 
./bin/do_clustergen parallel combine_coeffs_v etc/txt.done.data
 
# Split the data
./bin/traintest etc/txt.done.data

# Train
./bin/do_clustergen parallel cluster etc/txt.done.data.train
./bin/do_clustergen dur etc/txt.done.data.train

# Test
./bin/do_clustergen cg_test resynth cgp etc/txt.done.data.test
./bin/do_clustergen cg_test tts tts etc/txt.done.data.test

#nohup ./bin/build_cg_rfs_voice

