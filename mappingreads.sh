#mappingreads.sh

##mapping trimmed PE reads to the a. thal reference

## amguercio (Angelica Guercio) 2018


##	##BWA mem mapping Script##  ##


module load module load bwa/0.7.16a

#if not indexed: make index of reference
#bwa index Arabidopsis_thaliana.TAIR10.dna.toplevel.fa

cat runIDs_fordl.txt | while read line; do
  NAME=$line
  bwa mem \
  -t 10 \
  -R "@RG\tID:Athal_Analyses\tSM:"$NAME"\tPL:ILLUMINA" \
  Arabidopsis_thaliana.TAIR10.dna.toplevel.fa \
  "$NAME"_forward_paired.fq.gz \
  "$NAME"_reverse_paired.fq.gz \
  > "$NAME"_alns.sam
done



