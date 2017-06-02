 1275  cat ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/run.sh
 1276  ls
 1277  ls local
 1278  cat ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/t.sh 
 1279  nano t.sh
 1280  cat ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/run.sh
 1281  ./run.sh 
 1282  chmod +x t.sh
 1283  ./run.sh 
 1284  nano t.sh 
 1285  cat ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/lexicalize_words.py .
 1286  nano t.sh 
 1287  nano local/lexicalize_words.py
 1288  ./run.sh 
 1289  ls data/local/
 1290  ls
 1291  nano txt.done.data_codemixed 
 1292  cp /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/tools/kaldi/egs/arctic/s5/data/local/dict/cmudict-plain.txt data/local/lexicon.txt
 1293  ./run.sh 
 1294  ls local/
 1295  cp ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/local/prepare_lexicon.pl locla
 1296  mv locla local/prepare_lexicon.pl
 1297  ./run.sh 
 1298  rm data/local/filtered_lexicon.txt 
 1299  ./run.sh 
 1300  nano data/local/filtered_lexicon.txt 
 1301  cat ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/run.sh
 1302  ls utils
 1303  ./run.sh 
 1304  rm data/lang/L.fst 
 1305  ./run.sh 
 1306  grep "<unk>" *
 1307  rm data/lang/L.fst 
 1308  ./run.sh 
 1309  cat ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/run.sh
 1310  ls */subset*
 1311  nano utils/subset_data_dir_tr_cv.sh
 1312  ./utils/subset_data_dir_tr_cv.sh 
 1313  ./utils/subset_data_dir_tr_cv.sh --cv-utt-percent 10 data/train data/train_tr90 data/train_cv10
 1314  ls data
 1315  ls local
 1316  ls data/local/
 1317  nano run.sh 
 1318  nano local/arctic_make_ctc_dictphn.sh
 1319  chmod +x local/arctic_make_ctc_dictphn.sh 
 1320  ./local/arctic_make_ctc_dictphn.sh 
 1321  chmod +x local/*
 1322  ./local/ctc_compile_dict_phn.sh 
 1323  ./local/ctc_compile_dict_phn.sh data/local/dict_phn data/lang_phn
 1324  nano local/ctc_token_fst.py
 1325  chmod +x local/*
 1326  ./local/ctc_compile_dict_phn.sh data/local/dict_phn data/lang_phn
 1327  chmod +x local/*nano local/arctic_decode_graph.sh
 1328  nano local/arctic_decode_graph.sh
 1329  ls local/arctic_make_ctc_dictphn.sh 
 1330  cat local/arctic_make_ctc_dictphn.sh 
 1331  ./run.sh 
 1332  scp -r srallaba@rocks.is.cs.cmu.edu:/data/ASR5/srallaba/eesen/asr_egs/expts_ASRlab/rsk_baseline_arctic/local/model_topo.py .
 1333  scp -r srallaba@rocks.is.cs.cmu.edu:/data/ASR5/srallaba/eesen/asr_egs/expts_ASRlab/rsk_baseline_arctic/local/prep_ctc_trans.py .
 1334  scp -r srallaba@rocks.is.cs.cmu.edu:/data/ASR5/srallaba/eesen/asr_egs/expts_ASRlab/rsk_baseline_arctic/local/train_ctc_parallel.sh .
 1335  ./run.sh 
 1336  ls
 1337  mv model_topo.py prep_ctc_trans.py train_ctc_parallel.sh local
 1338  chmod +x local/*
 1339  ./run.sh 
 1340  nano data/lang_phn/lexicon_numbers.txt 
 1341  ./local/prep_ctc_trans.py data/lang_phn/lexicon_numbers.txt data/train_cv10/text '<unk>' 
 1342  nano local/prep_ctc_trans.py 
 1343  ./local/prep_ctc_trans.py data/lang_phn/lexicon_numbers.txt data/train_cv10/text '<unk>' 
 1344  nano local/prep_ctc_trans.py 
 1345  ./local/prep_ctc_trans.py data/lang_phn/lexicon_numbers.txt data/train_cv10/text '<unk>' 
 1346  nano data/lang_phn/lexicon_numbers.txt 
 1347  ./local/prep_ctc_trans.py data/lang_phn/lexicon_numbers.txt data/train_cv10/text '<unk>' 
 1348  ./run.sh 
 1349  ls
 1350  nano exp/train_l4_c240_eta0.04/log/tr.iter1.log 
 1351  nvidia-smi 
 1352  ./local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr90 data/train_cv10 exp/train_l4_c240_eta0.04
 1353  sudo kill -9 27064
 1354  nvidia-smi 
 1355  ./local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr90 data/train_cv10 exp/train_l4_c240_eta0.04
 1356  nano exp/train_l4_c240_eta0.04/log/tr.iter1.log 
 1357  cd ..
 1358  ls
 1359  du sh arctic_baseline/
 1360  du -sh arctic_baseline/
 1361  scp -r arctic_baseline srallaba@rocks.is.cs.cmu.edu:/data/ASR5/srallaba/eesen/asr_egs/expts_ASRlab
 1362  nvidia-smi 
 1363  ./local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr90 data/train_cv10 exp/train_l4_c240_eta0.04
 1364  cd arctic_baseline/
 1365  ./local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr90 data/train_cv10 exp/train_l4_c240_eta0.04
 1366  sudo sh /local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr90 data/train_cv10 exp/train_l4_c240_eta0.04
 1367  sudo sh local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr90 data/train_cv10 exp/train_l4_c240_eta0.04
 1368  cat exp/train_l4_c240_eta0.04/log/initialize_model.log 
 1369  cat exp/train_l4_c240_eta0.04/log/tr.iter1.log 
 1370  nano path.sh 
 1371  cat ~/.bashrc 
 1372  nano ~/.bashrc 
 1373  source ~/.bashrc 
 1374  sudo sh local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr90 data/train_cv10 exp/train_l4_c240_eta0.04
 1375  nano local/train_ctc_parallel.sh
 1376  cat ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/path.sh 
 1377  cat path.sh 
 1378  cd ../../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap
 1379  ./run.sh 
 1380  cd ..
 1381  cd rsk_baseline_codemixed_phonemap_cv/
 1382  ./run.sh 
 1383  cat run.sh 
 1384  sudo sh local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr95 data/train_cv05 exp/train_l4_c240_eta0.04
 1385  ls data/
 1386  sudo sh local/train_ctc_parallel.sh --add-deltas false --num-sequence 10 --frame-num-limit 12000 --learn-rate 0.0004 --report-step 1000 --halving-after-epoch 12 data/train_tr75 data/train_cv25 exp/train_l4_c240_eta0.04
 1387  cat exp/train_l4_c240_eta0.04/log/initialize_model.log 
 1388  ls exp/
 1389  ls
 1390  ./train_1layer.sh 
 1391  nano train_1layer.sh 
 1392  ./train_1layer.sh 
 1393  cat exp/train_l1_c1024_eta0.04/log/tr.iter1.log 
 1394  cd ..
 1395  cd arctic/
 1396  ls
 1397  history | grep "cp"
 1398  scp -r arctic_baseline srallaba@rocks.is.cs.cmu.edu:/data/ASR5/srallaba/eesen/asr_egs/
 1399  ls
 1400  ls  arctic_baseline/
 1401  ls ../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap
 1402  cat ../codemixed/rsk_baseline/rsk_baseline_codemixed_phonemap/change_paths.py 
 1403  ssh srallaba@rocks.is.cs.cmu.edu
 1404  python
 1405  sudo apt-get install libboost-all-dev cmake mercurial
 1406  cd
 1407  cd hacks/repos/dynet-base/
 1408  ls
 1409  cd dynet/
 1410  ls
 1411  ./examples/train_xor
 1412  cd examples/python/
 1413  ls
 1414  python xor.py --dynet-gpu
 1415  ls
 1416  nano xor.py 
 1417  nvidia-smi 
 1418  cd
 1419  cd Documents/Courses/ASRLab/
 1420  ls
 1421  cd cmu_indic_hin_codemixed/
 1422  ls
 1423  ssh srallaba@hindi.speech.cs.cmu.edu
 1424  cd exp/train_l4_c240_eta0.04/log/
 1425  ls
 1426  ls -altr
 1427  cat tr.iter1.log 
 1428  cd ..
 1429  ls
 1430  cd ..
 1431  ls
 1432  du -sh *
 1433  cd arctic_single_articulatory_baseline_vowelheight/
 1434  ls
 1435  rm -r data_old
 1436  cd ..
 1437  du -sh *
 1438  scp -r arctic_single_articulatory_baseline_vowelheight srallaba@rocks.is.cs.cmu.edu:/data/ASR5/srallaba/eesen/asr_egs
 1439  ssh srallaba@hindi.speech.cs.cmu.edu
 1440  sh run.sh 
 1441  nano conf 
 1442  sh run.sh 
 1443  nano conf 
 1444  sh run.sh 
 1445  sh run.sh --dynet-gpu
 1446  nano run.sh 
 1447  sh run.sh 
 1448  aon run.sh 
 1449  sh run.sh 
 1450  nvidia-smi 
 1451  sudo kill -9 4291
 1452  nvidia-smi 
 1453  sh run.sh 
 1454  nvidia-smi 
 1455  sudo kill -9 4572
 1456  sh run.sh 
 1457  nvidia-smi 
 1458  sudo kill -9 4592
 1459  nvidia-smi 
 1460  sh run.sh 
 1461  nvidia-smi 
 1462  sudo kill -9 4861
 1463  nvidia-smi 
 1464  sh run.sh 
 1465  nvidia-smi 
 1466  sudo kill -9 4945
 1467  sh run.sh 
 1468  nvidia-smi 
 1469  sudo kill -9 5126
 1470  sh run.sh 
 1471  nvidia-smi 
 1472  sudo kill -9 5205
 1473  sh run.sh 
 1474  nvidia-smi 
 1475  sudo kill -9 7546
 1476  sh run.sh 
 1477  nvidia-smi 
 1478  sudo kill -9 8007
 1479  sh run.sh 
 1480  nvidia-smi 
 1481  sudo kill -9 12107
 1482  sh run.sh 
 1483  nvidia-smi 
 1484  sudo kill -9 15107
 1485  sh run.sh 
 1486  nvidia-smi 
 1487  sudo kill -9 15313
 1488  sh run.sh 
 1489  nohup sh run.sh > log_run_15May2017 2>&1^
 1490  jobs -l
 1491  nohup sh run.sh > log_run_15May2017 2>&1
 1492  jobs -l
 1493  nohup sh run.sh > log_run_15May2017 2>&1&
 1494  jobs -l
 1495  nano log_run_15May2017 
 1496  nvidia-s
 1497  nvidia-smi 
 1498  sudo kill -9 15548
 1499  nohup sh run.sh > log_run_15May2017 2>&1&
 1500  jobs -l
 1501  tail log_run_15May2017 
 1502  tail -40 log_run_15May2017 
 1503  nano log_run_15May2017 
 1504  top
 1505  sh run.sh 
 1506  nano scripts/seq2seq_transliteration.py
 1507  nvidia-smi 
 1508  sudo kill -9 18984
 1509  nvidia-smi 
 1510  sh run.sh 
 1511  nvidia-smi 
 1512  sudo kill -9 19200
 1513  nvidia-smi 
 1514  sh run.sh 
 1515  nvidia-smi 
 1516  sh run.sh 
 1517  nano words.txt 
 1518  ls -altr words.txt 
 1519  nano words.txt 
 1520  cat log_run_15May2017 
 1521  cd
 1522  cd Documents/Courses/ASRLab/cmu_us_arctic/
 1523  ls
 1524  history | grep "awk"
 1525  cat radio_phones | awk '{print $1 $4}'
 1526  cat radio_phones | awk '{print $1 ' ' $4}'
 1527  cat radio_phones | awk '{print $1 " " $4}'
 1528  cat radio_phones | awk '{print $1 " " $4}' > phone_map_vowelfront
 1529  vi phone_map_vowelfront 
 1530  cat phone_map_vowelfront 
 1531  ls
 1532  cat radio_phones | awk '{print $1 " " $6}'
 1533  cat radio_phones 
 1534  cat /home/saikrishnalticmu/tools/Festival/festival/lib/radio_phones.scm 
 1535  cat radio_phones | awk '{print $1 " " $7}'
 1536  cat radio_phones | awk '{print $1 " " $7}' > phone_map_consonanttype
 1537  vi phone_map_consonanttype 
 1538  cat phone_map_consonanttype 
 1539  cd Documents/Courses/EXPTS/
 1540  ls
 1541  kate run.sh 
 1542  ls
 1543  cd ..
 1544  scp -r EXPTS srallaba@hindi.speech.cs.cmu.edu:~.transliteration
 1545  scp -r EXPTS srallaba@hindi.speech.cs.cmu.edu:~/transliteration
 1546  ssh srallaba@hindi.speech.cs.cmu.edu
 1547  ssh srallaba@rocks.is.cs.cmu.edu
 1548  cat local/generate_prompts.py 
 1549  grep "soxi" */*.sh
 1550  cat local/copy_data.sh 
 1551  ssh srallaba@hindi.speech.cs.cmu.edu
 1552  cd Documents/Courses/
 1553  ls
 1554  cd EXPTS/
 1555  ls
 1556  sh run.sh 
 1557  nvidia-smi 
 1558  sudo kill -9 2181
 1559  sh run.sh 
 1560  cp -r scripts scripts_backup
 1561  sh run.sh 
 1562  cp -r scripts_backup/seq2seq_transliteration.py scripts
 1563  sh run.sh 
 1564  nvidia-smi 
 1565  sh run.sh 
 1566  mv ~/Documents/srallaba_projectreport_transliteration_11731_15May2017.pdf .
 1567  cd
 1568  cd hacks/repos/kaldi/egs/
 1569  ls
 1570  ls arctic/
 1571  cd arctic/arctic_single_articulatory_baseline_vowelheight/
 1572  ls
 1573  kate run.sh 
 1574  pwd
 1575  cat local/arctic_prepare_data.py 
 1576  cd ..
 1577  cd codemixed/
 1578  ls
 1579  ls rsk_baseline/
 1580  mkdir rsk_topline
 1581  cd rsk_
 1582  cd rsk_topline/
 1583  ls
 1584  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/cmd.sh .
 1585  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/conf/ .
 1586  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/lang.conf .
 1587  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/path.sh .
 1588  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/utils .
 1589  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/local .
 1590  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/steps .
 1591  cp -r /home/saikrishnalticmu/hacks/repos/kaldi/egs/arctic/arctic_single_articulatory_baseline_vowelheight/run.sh .
 1592  scp -r srallaba@hindi.speech.cs.cmu.edu:utterance_and_spk .
 1593  cut -d ' ' -f 1 utterance_and_spk | head
 1594  mkdir data
 1595  mkdir data/raw_full_data
 1596  mkdir data/raw_full_data/audio
 1597  mkdir data/raw_full_data/transcription
 1598  cut -d ' ' -f 1 utterance_and_spk | while read line; do touch data/raw_full_data/audio/$line.wav; touch data/raw_full_data/transcription/$line.txt; echo $line; done
 1599  ./utils/spk2utt_to_utt2spk.pl 
 1600  head ./utils/spk2utt_to_utt2spk.pl 
 1601  cat ./utils/spk2utt_to_utt2spk.pl 
 1602  scp -r srallaba@hindi.speech.cs.cmu.edu:codemixed_data.tar.gz .
 1603  tar xvzf codemixed_data.tar.gz 
 1604  ls
 1605  ls data/
 1606  ls data/raw_full_data/
 1607  ls data/raw_full_data/audio/
 1608  rm -r data/raw_full_data/audio/*
 1609  mv wav/* data/raw_full_data/audio/
 1610  for file in wav/*.wav; do mv $file data/raw_full_data/audio; done
 1611  for file in transcripts/*.snt; do fname=$(basename "$file" .snt); mv $file data/raw_full_data/transcription/$fname.txt; done
 1612  rm data/raw_full_data/transcription/*.snt
 1613  ls data/raw_full_data/transcription/|head
 1614  ls data/raw_full_data/transcription/|head | cat
 1615  ls data/raw_full_data/transcription/|head | cat data/raw_full_data/transcription/STSC-20160516-0151.61938-1462929955289-0002.61938-1462929955289-1119-45272-Transcript-1119-45319.hi-IN.txt
 1616  mkdir data/raw_full_data/transcription_pruned
 1617  nano local/prune_transcriptions.py 
 1618  python local/prune_transcriptions.py 
 1619  head local/prune_transcriptions.py 
 1620  python local/prune_transcriptions.py data/raw_full_data/transcription data/raw_full_data/transcription_pruned/
 1621  cat local/prune_transcriptions.py 
 1622  aplay data/raw_full_data/audio/STSC-20160714-1446.978-1463488935766-450-23755.hi-IN.wav
 1623  ssh srallaba@hindi.speech.cs.cmu.edu
 1624  ssh srallaba@rocks.is.cs.cmu.edu
 1625  ssh srallaba@hindi.speech.cs.cmu.edu
 1626  ssh srallaba@hindi.speech.cs.cmu.edu
 1627  cd hacks/repos/kaldi/egs/codemixed/
 1628  ls
 1629  cd rsk_topline/
 1630  ls
 1631  kate utils/validate_data_dir.sh 
 1632  ssh srallaba@hindi.speech.cs.cmu.edu
 1633  ls local
 1634  cat local/prepare_lexicon.pl 
 1635  ssh srallaba@rocks.is.cs.cmu.edu
 1636  ls /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/tools/Festival/builds/
 1637  sudo cp /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/tools/Festival/builds/festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz $FESTDIR 
 1638  locate scripts_test
 1639  cd
 1640  cd Documents/Project_CMU/
 1641  ls
 1642  mkdir Blizzard_2017
 1643  cd Blizzard_2017/
 1644  scp -r srallaba@hindi.speech.cs.cmu.edu:CMU_EH1.tar.gz 
 1645  scp -r srallaba@hindi.speech.cs.cmu.edu:CMU_EH1.tar.gz .
 1646  tar xvzf CMU_EH1.tar.gz 
 1647  cd 2017-EH1_submission_directory/
 1648  ls
 1649  ls 2013
 1650  ls 2013/audiobook_paragraphs/
 1651  ls 2013/audiobook_paragraphs/wav/bookpara_2013_0*
 1652  aplay 2013/audiobook_paragraphs/wav/bookpara_2013_0*
 1653  aplay 2017/audiobook/wav_chapter/*
 1654  aplay 2017/audiobook/wav_audiobook/*
 1655  aplay 2017/audiobook/wav_line/*
 1656  aplay 2016/audiobook/wav_chapter/*
 1657  cat english_2016_booktext_with_prefixes
 1658  cat 2016/audiobook/english_2016_booktext_with_prefixes
 1659  ls
 1660  locate 2017-EH1_submission_directory
 1661  locate 2017-EH1_submission_directory
 1662  locate sus
 1663  locate news
 1664  locate audiobook
 1665  locate amidsummernightsdream
 1666  cd
 1667  cd /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/
 1668  ls
 1669  ls Documents/
 1670  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" *.py
 1671  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" */*.py
 1672  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" */*/*.py
 1673  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" */*/*/*.py
 1674  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" /media/saikrishnalticmu/TOSHIBA\ EXT/backups/May_2017/to_backup/*
 1675  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" /media/saikrishnalticmu/TOSHIBA\ EXT/backups/May_2017/to_backup/*.py
 1676  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" /media/saikrishnalticmu/TOSHIBA\ EXT/backups/May_2017/to_backup/*/*.py
 1677  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" /media/saikrishnalticmu/TOSHIBA\ EXT/backups/May_2017/to_backup/*/*/*.py
 1678  grep "festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz" /media/saikrishnalticmu/TOSHIBA\ EXT/backups/May_2017/to_backup/*/*/*/*.py
 1679  locate 2013_audiobook_synthesizer.py
 1680  cd
 1681  cd Documents/
 1682  ls
 1683  nano valid_word2phone 
 1684  nano valid_transliterate
 1685  wc -l valid_*
 1686  nano valid_word2phone 
 1687  nano valid_union
 1688  mv valid_word2phone valid_phone2phone
 1689  ls
 1690  wc -l *
 1691  /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789//usr/bin/matlab
 1692  /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/usr/bin/matlab
 1693  /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/usr/local/MATLAB/R2012b/bin/matlab 
 1694  festival
 1695  ls
 1696  cd Courses/
 1697  ls
 1698  mkdir LSMM
 1699  cd LSMM/
 1700  rm ~/Downloads/speech-text-alignment*
 1701  mv ~/Downloads/speech-text-alignment.pdf .
 1702  rm ~/Downloads/Copy\ of\ Speech\ to\ Phoneme\ Alignment\ using\ Sequence\ to\ Sequence\ Networks\ May\ 2017*
 1703  cp ~/Downloads/Copy\ of\ Speech\ to\ Phoneme\ Alignment\ using\ Sequence\ to\ Sequence\ Networks\ May\ 2017.pdf Seq2Seq_for_CMData_srallaba.pdf
 1704  ls
 1705  ssh srallaba@hindi.speech.cs.cmu.edu
 1706  cd
 1707  cd Documents/
 1708  ls
 1709  cd Project_CMU/
 1710  ls
 1711  cd 2017-EH1_submission_directory/
 1712  ls
 1713  cd  scripts_test/
 1714  ls
 1715  nano 2016_audiobook_pages_concat.py 
 1716  ls ../wav_audiobook_2016
 1717  ls ../wav_all/
 1718  cd ..
 1719  ls
 1720  sudo chown 
 1721  sudo chown --help
 1722  sudo chown -R $USER: $HOME
 1723  ls
 1724  sudo chown -R $USER: 2017-EH1_submission_directory
 1725  ls
 1726  sudo chown -R saikrishnalticmu: 2017-EH1_submission_directory
 1727  ls
 1728  sudo chmod -F 755 *
 1729  sudo chmod -R 755 *
 1730  ls
 1731  cd 2017-EH1_submission_directory/
 1732  ls
 1733  kate scripts_test/2016_audiobook_pages_concat.py 
 1734  ls
 1735  mkdir lab_all
 1736  cat  2017-EH1_submission_directory/2016/audiobook/english_2016_booktext_with_prefixes 
 1737  cat  2017-EH1_submission_directory/2016/audiobook/english_2016_booktext_with_prefixes  | while read line; do filename=`awk '{print $1}' $line`; text=`awk '{for(i=3;i<=NF;++i)print $i} $line'
 1738  echo $text > $filename
 1739  done
 1740  cat  2017-EH1_submission_directory/2016/audiobook/english_2016_booktext_with_prefixes  | while read line; do filename=`awk '{print $1}' $line`; text=`awk '{for(i=3;i<=NF;++i)print $i}' $line`; echo $text > $filename; done
 1741  ls
 1742  cat  2017-EH1_submission_directory/2016/audiobook/english_2016_booktext_with_prefixes  | while read line; do filename=`awk '{print $1}' $line`; text=`awk '{for(i=3;i<=NF;++i)print $i}' $line`; echo $text > lab_all/$filename.txt; done
 1743  ls
 1744  cat  2017-EH1_submission_directory/2016/audiobook/english_2016_booktext_with_prefixes  | while read line; do filename=`awk '{print $1}' $line`; text=`awk '{for(i=2;i<=NF;++i)print $i}' $line`; echo $text > lab_all/$filename.txt; done
 1745  cat  2017-EH1_submission_directory/2016/audiobook/english_2016_booktext_with_prefixes  | while read line; do filename=`awk '{print $1}' $line`; text=`awk '{for(i=2;i<=NF;++i)print $i}' $line`; echo $text ; done
 1746  cat  2017-EH1_submission_directory/2016/audiobook/english_2016_booktext_with_prefixes  | while read line; do filename=`cut -d ' ' -f 1 $line`; text=`cut -d ' ' -f 2- $line`; echo $text ; done
 1747  cd scripts_test/
 1748  mkdir make_labs.py
 1749  rm make_labs.py/
 1750  rm -r make_labs.py/
 1751  nano make_labs.py
 1752  python make_labs.py 
 1753  nano make_labs.py 
 1754  python make_labs.py 
 1755  ls ../lab_all/
 1756  cd ..
 1757  cd lab_all/
 1758  ls
 1759  mkdir AroundTheWorldIn80Days BrerRabbitAndTheBlackberryBush HanselAndGretel KnightsAndCastles TheFirebird TwelfthNight
 1760  cp -r AroundTheWorldIn80Days_0000* AroundTheWorldIn80Days
 1761  cp -r BrerRabbitAndTheBlackberryBush_00000_000* BrerRabbitAndTheBlackberryBush
 1762  cp -r HanselAndGretel_0000* HanselAndGretel
 1763  cp -r KnightsAndCastles_00000_000* KnightsAndCastles
 1764  cp -r TheFirebird_0000* TheFirebird
 1765  cp -r TwelfthNight_0000* TwelfthNight
 1766  ls
 1767  ls ..
 1768  ls
 1769  cd ..
 1770  ls
 1771  ls wav_all/
 1772  ls
 1773  locate pa_14.wav
 1774  locate pau_14.wav
 1775  ls
 1776  locate pau_14.wav
 1777  cd scripts_test/
 1778  ls
 1779  nano 2016-audiobook_segmentor.py 
 1780  $FESTDIR/../flite/bin/flite -t " "
 1781  locate units_all
 1782  aplay ~/Desktop/pau_14.wav 
 1783  cp ~/Desktop/pau_14.wav ../wav_all/
 1784  ls
 1785  python 2016_audiobook_pages_concat.py 
 1786  ls ../wav_all/
 1787  python 2017_audiobook_pages_concat.py 
 1788  ls
 1789  ssh srallaba@hindi.speech.cs.cmu.edu
 1790  cd
 1791  cd tools/Festival/
 1792  ls
 1793  sudo cp -r /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/tools/Festival/builds/festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz .
 1794  ls
 1795  tar xvzf festvox_cmu_us_blzrd2017_nointerslice_cg.tar.gz 
 1796  sudo cp -r /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/tools/Festival/builds/festvox_kallpc16k.tar.gz .
 1797  sudo cp -r /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/tools/Festival/builds/festvox_
 1798  tar xvzf festvox_kallpc16k.tar.gz 
 1799  tar xvzf festvox_rablpc16k.tar.gz 
 1800  sudo cp -r /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/home/saikrishnalticmu/tools/Festival/builds/festlex_* .
 1801  tar xvzf festlex_CMU.tar.gz 
 1802  tar xvzf festlex_OALD.tar.gz 
 1803  tar xvzf festlex_POSLEX.tar.gz 
 1804  cd Documents/Project_CMU/2017-EH1_submission_directory/
 1805  ls
 1806  cd scripts_test/
 1807  history
 1808  ls -altr
 1809  python 2016_audiobook_chapters_synthesizer.py 
 1810  ssh srallaba@rocks.is.cs.cmu.edu
 1811  ls
 1812  python 2017_audiobook_chapters_synthesizer.py 
 1813  aplay wav_chapters_2016/*
 1814  aplay wav_chapters_2017/*
 1815  cd ..
 1816  ls
 1817  cp -r 2017-EH1_submission_directory 2017-EH1_submission_directory_May2017
 1818  ls 2017-EH1_submission_directory_May2017/2016/audiobook/wav_chapter/
 1819  cp -r scripts_test/wav_chapters_2017/* 2017-EH1_submission_directory_May2017/2017/audiobook/wav_chapter/
 1820  cp -r scripts_test/wav_paras_2017/* 2017-EH1_submission_directory_May2017/2017/audiobook/wav_page/
 1821  cp -r scripts_test/wav_paras_2016/* 2017-EH1_submission_directory_May2017/2016/audiobook/wav_page/
 1822  cd 2017-EH1_submission_directory_May2017/
 1823  ls
 1824  aplay 2013/audiobook_paragraphs/wav/*
 1825  aplay 2013/audiobook_paragraphs/wav/bookpara_2013_0080.wav
 1826  aplay 2013/audiobook_sentences/wav/booksent_2013_0099.wav
 1827  aplay 2016/audiobook/wav_audiobook/*
 1828  aplay 2016/audiobook/wav_chapter/*
 1829  ls 2016/audiobook/wav_chapter/
 1830  mv 2016/audiobook/wav_chapter/wav_chapters_2016/* 2016/audiobook/wav_chapter
 1831  rm -r 2016/audiobook/wav_chapter/wav_chapters_2016/
 1832  aplay 2016/audiobook/wav_chapter/*
 1833  aplay 2016/audiobook/wav_chapter/TwelfthNight_00005.wav
 1834  aplay 2016/audiobook/wav_page/*
 1835  rm -r 2016/audiobook/wav_page/*
 1836  cp -r ../scripts_test/wav_paras_2016_ext/* 2016/audiobook/wav_page/
 1837  aplay 2016/audiobook/wav_page/*
 1838  aplay 2016/audiobook/wav_page/
 1839  aplay 2016/audiobook/wav_page/TwelfthNight_00006_00077.wav
 1840  aplay 2016/audiobook/wav_page/BrerRabbitAndTheBlackberryBush_00000_00003.wav
 1841  aplay 2016/audiobook/wav_page/BrerRabbitAndTheBlackberryBush_00000_00009.wav
 1842  aplay 2016/audiobook/wav_page/TheFirebird_00001_00010.wav
 1843  aplay 2016/audiobook/wav_line/*
 1844  aplay 2016/audiobook/wav_page/*
 1845  aplay 2016/audiobook/wav_chapter/TwelfthNight_00006.wav 
 1846  aplay 2017/audiobook/wav_chapter/*
 1847  aplay 2017/audiobook/wav_chapter/StoryOfCars_00001.wav
 1848  aplay 2017/audiobook/wav_page/*
 1849  rm -r 2017/audiobook/wav_page/*
 1850  cp -r ../scripts_test/wav_paras_2017_ext/* 2017/audiobook/wav_page/
 1851  aplay 2017/audiobook/wav_page/*
 1852  aplay 2017/audiobook/wav_page/StoryOfChocolate_00005_00083.wav
 1853  aplay 2017/audiobook/wav_page/StoryOfChocolate_00005_00086.wav
 1854  nano 2017/audiobook/english_2017_booktext_with_prefixes 
 1855  cd ..
 1856  ls
 1857  tar cvzf 2017-EH1_submission_directory_May2017 CMU_EH1_corrected.tar.gz 
 1858  tar cvzf  CMU_EH1_corrected.tar.gz 2017-EH1_submission_directory_May2017
 1859  du -sh *
 1860  cd 2017-EH1_submission_directory_May2017/
 1861  ls
 1862  aplay 2013/audiobook_paragraphs/wav/*
 1863  cd ..
 1864  aplay 2017-EH1_submission_directory/2013/audiobook_paragraphs/wav/*
 1865  aplay 2017-EH1_submission_directory_May2017/2013/audiobook_paragraphs/wav/*
 1866  aplay 2017-EH1_submission_directory/2016/audiobook_paragraphs/wav/*
 1867  aplay 2017-EH1_submission_directory/2016/audiobook/wav_chapter/*
 1868  aplay 2017-EH1_submission_directory_May2017/2016/audiobook/wav_chapter/*
 1869  aplay 2017-EH1_submission_directory/2016/audiobook/wav_page/*
 1870  aplay 2017-EH1_submission_directory_May2017/2016/audiobook/wav_page/*
 1871  aplay 2017-EH1_submission_directory_May2017/2017/audiobook/wav_page/*
 1872  aplay 2017-EH1_submission_directory/2017/audiobook/wav_page/*
 1873  aplay 2017-EH1_submission_directory/2017/audiobook/wav_chapter/*
 1874  aplay 2017-EH1_submission_directory_May2017/2017/audiobook/wav_chapter/*
 1875  scp -r CMU_EH1_corrected.tar.gz srallaba@hindi.speech.cs.cmu.edu:
 1876  ssh srallaba@hindi.speech.cs.cmu.edu
 1877  ssh siri@10.2.62.190
 1878  cd
 1879  cd Downloads/
 1880  ls
 1881  mkdir ~/Documents/To_Read
 1882  mv out.pdf ~/Documents/To_Read/
 1883  mv subword_unit_discovery.pdf ~/Documents/To_Read/
 1884  ls
 1885  clear
 1886  ssh srallaba@hindi.speech.cs.cmu.edu
 1887  ssh srallaba@hindi.speech.cs.cmu.edu
 1888  cdc
 1889  cd
 1890  cd Documents/
 1891  ls
 1892  nano union_train
 1893  sudo /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/usr/local/MATLAB/R2012b/bin/matlab 
 1894  ssh srallaba@rocks.is.cs.cmu.edu
 1895  cd
 1896  cd Documents/Project_CMU/Development/02_Bilingual/Frame_Level/
 1897  scp -r srallaba@hindi.speech.cs.cmu.edu:~arctic_original.wav
 1898  scp -r srallaba@hindi.speech.cs.cmu.edu:~arctic_original.wav .
 1899  scp -r srallaba@hindi.speech.cs.cmu.edu:~/arctic_original.wav .
 1900  aplay arctic_original.wav 
 1901  aplay arctic_replaced_0001.wav 
 1902  sudo /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/usr/local/MATLAB/R2012b/bin/matlab 
 1903  cd Documents/Project_CMU/Development/02_Bilingual/Frame_Level/
 1904  ls
 1905  nano Notes 
 1906  scp -r srallaba@hindi.speech.cs.cmu.edu:~/arctic_replaced_0001.wav .
 1907  aplay arctic_replaced_0001.wav 
 1908  aplay arctic_a0001_compresed.wav 
 1909  ssh srallaba@hindi.speech.cs.cmu.edu
 1910  cd
 1911  cd Documents/
 1912  ls
 1913  cd Project_CMU/
 1914  ls
 1915  cd Development/
 1916  ls
 1917  cd 02_Bilingual/
 1918  ls
 1919  cd Frame_Level/
 1920  ls
 1921  kate cg_do_abs.scm 
 1922  locate tt
 1923  locate tt 
 1924  cd
 1925  cd Documents/
 1926  ls
 1927  nano union_valid
 1928  vi union_*
 1929  cat union_*
 1930  vi union_valid 
 1931  locate synthesis
 1932  mkdir Project_CodeMixedASR
 1933  cd Project_CodeMixedASR
 1934  mv ~/Downloads/learning-pronunciation-variants.pdf .
 1935  sudo reboot
 1936  ssh srallaba@hindi.speech.cs.cmu.edu
 1937  cd
 1938  cd Downloads/
 1939  ls
 1940  sudo apt-get install texlive-full 
 1941  ssh  srallaba@hindi.speech.cs.cmu.edu
 1942  ls
 1943  ls -altr
 1944  ls
 1945  aplay t.wav 
 1946  soxi t.wav
 1947  soxi arctic_original.
 1948  soxi arctic_original.wav 
 1949  soxi t.wav
 1950  aplay arctic_original.
 1951  aplay arctic_original.wav 
 1952  aplay t.wav 
 1953  cd $FESTDIR/..
 1954  scp -r srallaba@hindi.speech.cs.cmu.edu:~/festvox_cmu_indic_hin_iitmMale_c_cg.tar.gz .
 1955  scp -r srallaba@hindi.speech.cs.cmu.edu:~/festvox_cmu_indic_hin_iitmMale_c_cg* .
 1956  mv festvox_cmu_indic_hin_iitmMale_c_cg.tar.gz_stable festvox_cmu_indic_hin_iitmMale_c_cg.tar.gz
 1957  tar xvzf festvox_cmu_indic_hin_iitmMale_c_cg.tar.gz 
 1958  cd festvox/
 1959  ls
 1960  ls src/
 1961  locate mlsa_resynthesis
 1962  kate /home/saikrishnalticmu/dependencies/festival/src/modules/clustergen/mlsa_resynthesis.cc
 1963  cd ..
 1964  cd festival/src/modules/
 1965  ls
 1966  ls clustergen/
 1967  ls ..
 1968  ls ../..
 1969  ls ../../bin/
 1970  cd
 1971  cd Documents/Project_CMU/Development/02_Bilingual/Frame_Level/
 1972  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav.
 1973  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1974  aplay arctic_abs_a0001.wav 
 1975  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1976  aplay arctic_abs_a0001.wav 
 1977  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1978  aplay arctic_abs_a0001.wav 
 1979  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1980  aplay arctic_abs_a0001.wav 
 1981  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1982  aplay arctic_abs_a0001.wav 
 1983  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1984  aplay arctic_abs_a0001.wav 
 1985  scp -r srallaba@hindi.speech.cs.cmu.edu:~/clustergen_build_abs.scm
 1986  scp -r srallaba@hindi.speech.cs.cmu.edu:~/clustergen_build_abs.scm .
 1987  kate clustergen_build_abs.scm 
 1988  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1989  aplay arctic_abs_a0001.wav 
 1990  scp -r  srallaba@hindi.speech.cs.cmu.edu:~/arctic_abs_a0001.wav .
 1991  aplay arctic_abs_a0001.wav 
 1992  festival
 1993  cd
 1994  cd Downloads/
 1995  vimdiff original.mgc pred_ARA_NORM_0002.mgc 
 1996  cd
 1997  cd hacks/repos/
 1998  git clone https://github.com/idiap/phonvoc
 1999  sudo /media/saikrishnalticmu/0890fe1f-aeca-42f8-8aeb-9c3d4d649789/usr/local/MATLAB/R2012b/bin/matlab
 2000  ssh srallaba@hindi.speech.cs.cmu.edu
 2001  cd
 2002  cd hacks/repos/
 2003  git clone  https://github.com/pbaljeka/world_merlin
 2004  cd world_merlin/
 2005  lsl
 2006  cd
 2007  cd tools/Festival/
 2008  ls
 2009  wget http://tts.speech.cs.cmu.edu/awb/sptk/SPTK-3.6.tar.gz
 2010  tar xvzf SPTK-3.6.tar.gz 
 2011  export SPTKDIR=`pwd`/SPTK
 2012  mkdir SPTK
 2013  patch -p0 <festvox/src/clustergen/SPTK-3.6.patch
 2014  cd SPTK-3.6
 2015  ./configure --prefix=$SPTKDIR
 2016  make
 2017  make install
 2018  cd ..
 2019  cp -r ~/hacks/repos/world_merlin /home/saikrishnalticmu/tools/Festival/festvox/src/
 2020  ls
 2021  cd
 2022  cd Documents/Project_Arabic/
 2023  ls
 2024  ls files/
 2025  mv ~/Downloads/ARA_NORM_0002* .
 2026  ls
 2027  mv ARA_NORM_0002* files
 2028  ls
 2029  nano merlin_resynthesis_v1.sh 
 2030  mkdir resynth
 2031  ls
 2032  sh merlin_resynthesis_v1.sh 
 2033  nano merlin_resynthesis_v1.sh 
 2034  sh merlin_resynthesis_v1.sh 
 2035  aplay resynth/ARA_NORM_0002.resyn.wav 
 2036  mv ~/Downloads/pred_ARA_NORM_0002_25may.mgc .
 2037  nano merlin_resynthesis_v1.sh 
 2038  ls files/
 2039  mv ls
 2040  ls
 2041  mv pred_ARA_NORM_0002_25may.mgc ARA_NORM_0002.predict.mgc
 2042  sh merlin_resynthesis_v1.sh 
 2043  echo $SPTKDIR 
 2044  nano merlin_resynthesis_v1.sh 
 2045  sh merlin_resynthesis_v1.sh 
 2046  aplay resynth/ARA_NORM_0002.resyn.wav 
 2047  vimdiff ARA_NORM_0002.predict.mgc files/ARA_NORM_0002.mgc 
 2048  ls files/ARA_NORM_0002.mgc 
 2049  nano files/ARA_NORM_0002.mgc 
 2050  ls
 2051  ls files/
 2052  vimdiff files/ARA_NORM_0002.predict.sp files/ARA_NORM_0002.sp 
 2053  cat merlin_resynthesis_v1.sh 
 2054  ls
 2055  ls files/
 2056  vi files/original.mgc 
 2057  nano merlin_resynthesis_v1.sh 
 2058  sh merlin_resynthesis_v1.sh 
 2059  aplay resynth/ARA_NORM_0002.resyn.wav 
 2060  cat merlin_resynthesis_v1.sh 
 2061  ch_track -i files/original.mgc -otype est_binary original_binary.mgc
 2062  ch_track -s 0.005 files/original.mgc -otype est_binary original_binary.mgc
 2063  ch_track -s 0.005 files/original.mgc -otype est_binary -o original_binary.mgc
 2064  ls
 2065  nano merlin_resynthesis_v1.sh 
 2066  sh merlin_resynthesis_v1.sh 
 2067  ch_track files/original.mgc 
 2068  ch_track files/original.mgc -s 0.005
 2069  ch_track files/original.mgc -s 0.005 | wc
 2070  soxi resynth/ARA_NORM_0002.resyn.wav 
 2071  nano files/original
 2072  nano files/original.mgc 
 2073  nano files/ARA_NORM_0002.mgc 
 2074  x2x +af files/original.mgc t.mgc
 2075  $SPTKDIR/bin/x2x +af files/original.mgc t.mgc
 2076  $SPTKDIR/bin/x2x +af files/original.mgc 
 2077  $SPTKDIR/bin/x2x +af files/original.mgc > t.mgc
 2078  cat merlin_resynthesis_v1.sh 
 2079  mv t.mgc original_binary.mgc 
 2080  sh merlin_resynthesis_v1.sh 
 2081  aplay resynth/ARA_NORM_0002.resyn.wav 
 2082  $SPTKDIR/bin/x2x +af ARA_NORM_0002.predict.mgc > original_binary.mgc 
 2083  sh merlin_resynthesis_v1.sh 
 2084  aplay resynth/ARA_NORM_0002.resyn.wav 
 2085  $SPTKDIR/bin/x2x +fa files/ARA_NORM_0002.mgc 
 2086  nano merlin_resynthesis_v1.sh 
 2087  sh  merlin_resynthesis_v1.sh 
 2088  aplay resynth/ARA_NORM_0002.resyn.wav 
 2089  nano merlin_resynthesis_v1.sh 
 2090  aplay resynth/ARA_NORM_0002.resyn.wav 
 2091  sh  merlin_resynthesis_v1.sh 
 2092  aplay resynth/ARA_NORM_0002.resyn.wav 
 2093  ch_track -s 0.005 original_binary.mgc | wc
 2094  $SPTKDIR/bin/x2x +fa original_binary.mgc 
 2095  $SPTKDIR/bin/x2x +fa original_binary.mgc > t
 2096  $SPTKDIR/bin/x2x +fa files/original.mgc > tt
 2097  vimdiff t tt
 2098  wc -l t tt
 2099  cp files/ARA_NORM_0002.mgc files/original.mgc 
 2100  nano merlin_resynthesis_v1.sh 
 2101  sh merlin_resynthesis_v1.sh 
 2102  aplay resynth/ARA_NORM_0002.resyn.wav 
 2103  cat merlin_resynthesis_v1.sh 
 2104  soxi resynth/ARA_NORM_0002.resyn.wav 
 2105  ls ~/data/
 2106  cp -r ~/data/cmu_us_awb_arctic/wav .
 2107  ls
 2108  nano extract_word.sh
 2109  mv extract_word.sh extract_world.sh 
 2110  sh extract_world.sh 
 2111  ls
 2112  ls world/
 2113  ls world/mgc/
 2114  ls world/mgc/arctic_a0001.mgc 
 2115  head world/mgc/arctic_a0001.mgc 
 2116  nano extract_world.sh 
 2117  ls
 2118  nano /home/saikrishnalticmu/tools/Festival/festvox/src/world_merlin/do_clustergen 
 2119  ls
 2120  ls world/
 2121  ls world/sp/
 2122  cp merlin_resynthesis_v1.sh world_resynth.sh
 2123  nano world
 2124  nano world_resynth.sh 
 2125  sh world_resynth.sh 
 2126  nano world_resynth.sh 
 2127  sh world_resynth.sh 
 2128  ls world/f0/
 2129  ls world/sp/
 2130  nano world_resynth.sh 
 2131  sh world_resynth.sh 
 2132  aplay resynth/arctic_a0001.resyn.wav 
 2133  head  -1 world/mgc/arctic_a0001.mgc 
 2134  ch_track -s 0.005 world/mgc/arctic_a0001.mgc 
 2135  nano world_resynth.sh 
 2136  sh world_resynth.sh 
 2137  aplay resynth/arctic_a0001.resyn.wav 
 2138  rm resynth/arctic_a0001.resyn.wav 
 2139  sh world_resynth.sh 
 2140  rm resynth/arctic_a0001.resyn.wav 
 2141  sh world_resynth.sh 
 2142  aplay resynth/arctic_a0001.resyn.wav 
 2143  $SPTKDIR/bin/x2x +fa world/mgc/arctic_a0001.mgc 
 2144  $SPTKDIR/bin/x2x +da world/mgc/arctic_a0001.mgc 
 2145  $SPTKDIR/bin/x2x -h
 2146  ls
 2147  nano world_resynth.sh 
 2148  nano extract_world.sh 
 2149  cat extract_world.sh 
 2150  $SPTKDIR/bin/x2x +fa world/mgc/arctic_a0001.mgc | 
 2151  $SPTKDIR/bin/x2x +fa world/mgc/arctic_a0001.mgc
 2152  $SPTKDIR/bin/x2x +fa world/mgc/arctic_a0001.mgc | awk '{printf("%s ",$1); if ((NR%60) == 0) printf("\n")}'
 2153  $SPTKDIR/bin/x2x +fa world/mgc/arctic_a0001.mgc | awk '{printf("%s ",$1); if ((NR%60) == 0) printf("\n")}' | head -1 | wc
 2154  $SPTKDIR/bin/x2x +fa world/mgc/arctic_a0001.mgc | awk '{printf("%s ",$1); if ((NR%60) == 0) printf("\n")}' | wc
 2155  soxi wav/arctic_a0001.wav 
 2156  ls world
 2157  cat world_resynth.sh 
 2158  nano extract_world.sh 
 2159  nano /home/saikrishnalticmu/tools/Festival/festvox/src/world_merlin/WORLD/analysis 
 2160  nano /home/saikrishnalticmu/tools/Festival/festvox/src/world_merlin/WORLD/synth 
 2161  cd
 2162  cd hacks/repos/
 2163  git clone https://github.com/mmorise/World
 2164  cd World/
 2165  ls
 2166  make
 2167  ls
 2168  ls build/
 2169  ls src/
 2170  cd ..
 2171  git clone https://github.com/JeremyCCHsu/Python-Wrapper-for-World-Vocoder
 2172  cd Python-Wrapper-for-World-Vocoder/
 2173  ls
 2174  sudo python setup.py install
 2175  git submodule update --init
 2176  pip install -U pip
 2177  pip install -r requirements.txt
 2178  sudo pip install -r requirements.txt
 2179  cd demo/
 2180  ls
 2181  python demo.py 
 2182  cd ..
 2183  sudo pip install .
 2184  cd demo/
 2185  python demo.py 
 2186  ls 
 2187  ls test/
 2188  aplay test/*
 2189  aplay test/*.wav
 2190  kate demo.py 
 2191  python demo.py 
 2192  ls
 2193  nano wave.ap 
 2194  nano wave.sp 
 2195  python demo.py 
 2196  nano wave.sp 
 2197  head -1 wave.sp 
 2198  head -1 wave.sp | wc
 2199  cat wave.sp 
 2200  cat wave.sp | $SPTKDIR/bin/x2x +af
 2201  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a $FREQWARP -m $ORDER -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa 
 2202  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a $FREQWARP -m $ORDER -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fd > tmp.mgcsp
 2203  nano tmp.mgcsp 
 2204  cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}'
 2205  cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' | head -1 | wc
 2206  cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' | tail-1 | wc
 2207  cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' | tail -1 | wc
 2208  cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' | tail -1 
 2209* cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da | awk '{printf("%s|
 2210  cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da 
 2211  cat tmp.mgcsp  | $SPTKDIR/bin/x2x +da | wc
 2212  wc -l wave.sp 
 2213* cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a $FREQWARP -m $ORDER -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | 
 2214  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a $FREQWARP -m $ORDER -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa 
 2215  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a $FREQWARP -m $ORDER -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa | wc
 2216  echo $ORDER
 2217  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 1024 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 
 2218  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 1024 -m 245 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 
 2219  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 245 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 
 2220  62;c
 2221  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 245 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa
 2222  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 245 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa | wc
 2223  cat wave.sp | wc
 2224  nano wave.
 2225  nano wave.sp 
 2226  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa | wc
 2227  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 25 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa | wc
 2228  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa | wc
 2229  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fd | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}'
 2230  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fd | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' | tail -1
 2231  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fd | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' | tail -1 | wc
 2232  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fd | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' 
 2233  cat wave.sp | $SPTKDIR/bin/x2x +af | $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fd | $SPTKDIR/bin/x2x +da | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' > wave.mgc
 2234  ls
 2235  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3
 2236  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 
 2237  62;c62;c62;c62;c62;c62;c62;c62;c62;c62;c62;c62;c
 2238  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 | $SPTKDIR/bin/sopr -d 32768.0 -P 
 2239  62;c62;c62;c62;c62;c62;c62;c62;c62;c62;c62;c62;c
 2240  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 | $SPTKDIR/bin/sopr -d 32768.0 -P | $SPTKDIR/bin/x2x +fa 
 2241  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 | $SPTKDIR/bin/sopr -d 32768.0 -P | $SPTKDIR/bin/x2x +fa  | wc
 2242  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 | $SPTKDIR/bin/x2x +fa  | wc
 2243  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -g 0 -m 512 -l 1024 -o 2 | $SPTKDIR/bin/x2x +fa 
 2244  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -g 0 -m 512 -l 1024 -o 2 | $SPTKDIR/bin/x2x +fa  | wc
 2245  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -g 0 -m 512 -l 1024  | $SPTKDIR/bin/x2x +fa  | wc
 2246  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -g 0 -m 24 -l 1024  | $SPTKDIR/bin/x2x +fa513  | wc
 2247  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -g 0 -m 24 -l 1024  | $SPTKDIR/bin/x2x +fa513  
 2248  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -g 0 -m 24 -l 1024  | $SPTKDIR/bin/x2x +fa513  | wc
 2249  cat wave.mgc | $SPTKDIR/bin/mgc2sp -a 0.42 -g 0 -m 24 -l 1024 -o 2 | $SPTKDIR/bin/x2x +fa513  | wc
 2250  $ESTDIR/bin/ch_track -c `perl -e 'for($i=1;$i <= 24;$i++){print "$i,";}print"25";'` wave.mgc 
 2251  ch_track -help
 2252  $ESTDIR/bin/ch_track -c `perl -e 'for($i=1;$i <= 24;$i++){print "$i,";}print"25";'` -s 0.005 wave.mgc 
 2253  $ESTDIR/bin/ch_track -c `perl -e 'for($i=1;$i <= 24;$i++){print "$i,";}print"25";'` -s 0.05 wave.mgc 
 2254  head -1 wave.mgc | wc
 2255  $ESTDIR/bin/ch_track -c `perl -e 'for($i=1;$i <= 24;$i++){print "$i,";}print"24";'` -s 0.05 wave.mgc 
 2256  awk '{for (i=1; i<=NF; i++)
         printf("%f ",$i*1.0);
      printf("\n");}'
 2257  cat wave.mgc | awk '{for (i=1; i<=NF; i++)
         printf("%f ",$i*1.0);
      printf("\n");}'
 2258  cat wave.mgc | awk '{for (i=1; i<=NF; i++)
         printf("%f ",$i*1.0);
      printf("\n");}' | tee x1
 2259  cat wave.mgc | awk '{for (i=1; i<=NF; i++)
         printf("%f ",$i*1.0);
      printf("\n");}' | tee x1 | $SPTKDIR/bin/x2x +af
 2260  cat wave.mgc | awk '{for (i=1; i<=NF; i++)
         printf("%f ",$i*1.0);
      printf("\n");}' | tee x1 | $SPTKDIR/bin/x2x +af > wave.mgcsp
 2261  $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 -o 2 wave.mgcsp | $SPTKDIR/bin/x2x +fa513  
 2262  $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 -o 2 wave.mgcsp | $SPTKDIR/bin/x2x +fa513  | tail
 2263  $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 -o 2 wave.mgcsp | $SPTKDIR/bin/x2x +fa513  | tail -1
 2264  $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 -o 2 wave.mgcsp | $SPTKDIR/bin/x2x +fa513  | tail -1 | wc
 2265  $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 -o 2 wave.mgcsp | $SPTKDIR/bin/x2x +fa513  | wc
 2266  $SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 -o 2 wave.mgcsp | $SPTKDIR/bin/x2x +fa513  > wave.sp_abs
 2267  cp demo.py demo_abs.py 
 2268  kate demo_abs.py 
 2269  python demo_abs.py 
 2270  ls
 2271  python demo_abs.py 
 2272  aplay test/*.wav
 2273  vimdiff wave.sp wave.sp_abs 
 2274  history > history.t
