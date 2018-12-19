#####################
#################################################
#Script Name:         trimmingreads.sh
#Description:         Script to trim PE reads of their adaptors, low qual sequences, and to a min len of 25
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################


#################################################
###Trimmomatic Script

#on the bioinformatics core you can just load the trimmomatic module
module load trimmomatic/0.33

#build a loop to go through the runIDs for each sequencing run, and trim the PE reads for that sequencing run
#then because of the loop once that sample is done, go on to the next one listed in runIDs_fordl.txt
cat runIDs_fordl.txt | while read line; do
  NAME=$line
  #this saves the runID as a variable 'NAME' for use in the trimmomatic script
  java -jar /software/trimmomatic/0.33/static/trimmomatic-0.33.jar PE -threads 10 \
  #call on the trimmomatic software, and thread it to 10 processors
  "$NAME"_1.fastq.gz \
  "$NAME"_2.fastq.gz \
  #use NAME to find the PE reads files and use NAME to save the resulting trimmed files as well
  "$NAME"_forward_paired.fq.gz \
  "$NAME"_forward_unpaired.fq.gz \
  "$NAME"_reverse_paired.fq.gz \
  "$NAME"_reverse_unpaired.fq.gz \
  ILLUMINACLIP:/software/trimmomatic/0.33/static/adapters/TruSeq3-SE.fa:2:30:10 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:25
  #use standard QC parameters and a min length of 25 because of older short read technology used for sequencing
done



