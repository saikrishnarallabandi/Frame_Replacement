

for file in feats/iitm_mgc/arctic_a0001.mgcep
do
 fname=$(basename "$file" ".mgcep")
 echo $fname
 cat $file | awk '{for (i=1; i<=NF; i++)
         printf("%f ",$i*1.0);
      printf("\n");}' |
tee x1 | $SPTKDIR/bin/x2x +af |  
$SPTKDIR/bin/mgc2sp -a 0.42 -m 24 -l 1024 | $SPTKDIR/bin/x2x +fa | awk '{printf("%.4f ",$1); if ((NR%513) == 0) printf("\n")}' > feats/iitm_spabs/$fname.sp
done
