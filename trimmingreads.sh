#trimmingreads.sh

##trimming PE reads of their adaptors, low qual sequences, and a min len of 25

## amguercio (Angelica Guercio) 2018


##	##Trimmomatic Script##  ##


module load trimmomatic/0.33


cat runIDs_fordl.txt | while read line; do
  NAME=$line
  java -jar /opt/linux/centos/7.x/x86_64/pkgs/trimmomatic/0.33/bin/trimmomatic.jar PE -threads 4\
  "$NAME"_1.fastq \
  "$NAME"_2.fastq \
  "$NAME"_forward_paired.fq.gz \
  "$NAME"_forward_unpaired.fq.gz \
  "$NAME"_reverse_paired.fq.gz \
  "$NAME"_reverse_unpaired.fq.gz \
  ILLUMINACLIP:/opt/linux/centos/7.x/x86_64/pkgs/trimmomatic/0.33/adapters\
  /TruSeq3-SE.fa:2:30:10 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:25
done


