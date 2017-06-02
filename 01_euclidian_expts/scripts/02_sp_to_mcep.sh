

for file in ../feats/sp/*.sp
do
 fname=$(basename "$file" ".sp")
 echo $fname
 cat $file | $SPTKDIR/bin/x2x +af -o| $SPTKDIR/bin/mgcep -a 0.42 -m 24 -l 1024 -e 1.0E-08 -j 0 -f 0.0 -q 3 | $SPTKDIR/bin/x2x +fa  | awk '{printf("%s ",$1); if ((NR%25) == 0) printf("\n")}' > feats/mgcep/$fname.mgcep
done

