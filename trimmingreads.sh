#trimmingreads.sh

##trimming PE reads of their adaptors, low qual sequences, and a min len of 25

## amguercio (Angelica Guercio) 2018


##	##Trimmomatic Script##  ##


module load trimmomatic/0.33


cat testrunID.txt | while read line; do
  NAME=$line
  java -jar /software/trimmomatic/0.33/static/trimmomatic-0.33.jar PE -threads 4 \
  "$NAME"_1.fastq.gz \
  "$NAME"_2.fastq.gz \
  "$NAME"_forward_paired.fq.gz \
  "$NAME"_forward_unpaired.fq.gz \
  "$NAME"_reverse_paired.fq.gz \
  "$NAME"_reverse_unpaired.fq.gz \
  ILLUMINACLIP:/software/trimmomatic/0.33/static/adapters/TruSeq3-SE.fa:2:30:10 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:25
done



