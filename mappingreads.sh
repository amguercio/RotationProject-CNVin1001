#####################
#################################################
#Script Name:         mappingreads.sh
#Description:         Script to map trimmed PE reads to the a. thaliana reference
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################

#################################################
###TBWA mem Mapping Script

#on the bioinformatics core you can just load the trimmomatic module
module load module load bwa/0.7.16a


#if not indexed: make index of reference
#bwa index Arabidopsis_thaliana.TAIR10.dna.toplevel.fa

#build a loop to go through the runIDs for each sequencing run, and map the trimmed reads for that sequencing run
#then because of the loop once that sample is done, go on to the next one listed in runIDs_fordl.txt
cat runIDs_fordl.txt | while read line; do
  NAME=$line
  #this saves the runID as a variable 'NAME' for use in the mapping script
  bwa mem \
  -t 10 \
  #call on the bwa software, give it the mem function, and thread it to 10 processors
  -R "@RG\tID:Athal_Analyses\tSM:"$NAME"\tPL:ILLUMINA" \
  Arabidopsis_thaliana.TAIR10.dna.toplevel.fa \
  #use NAME to find the trimmed reads files and use NAME to save the resulting alignment file as well
  "$NAME"_forward_paired.fq.gz \
  "$NAME"_reverse_paired.fq.gz \
  > "$NAME"_alns.sam
done



