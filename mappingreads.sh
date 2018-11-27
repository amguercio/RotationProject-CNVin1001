#mappingreads.sh

##mapping trimmed PE reads to the a. thal reference

## amguercio (Angelica Guercio) 2018


##	##BWA mem mapping Script##  ##


module load module load bwa/0.7.16a


cat runIDs_fordl.txt | while read line; do
  NAME=$line
  bwa mem \
  Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
  $NAME"_forward_paired.fq.gz \
  "$NAME"_reverse_paired.fq.gz \
  > "$NAME"_alns.sam
done



