#####################
#################################################
#Script Name:         reads_n_ref_dl.sh
#Description:         Script to download reads files from 50 accessions from the arabidopsis 1001 genomes project and thaliana reference
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################



##To download the files from ENA (DON'T EVEN TRY WITH THE SRA BS--SERIOUSLY)
##Site = https://www.ebi.ac.uk/ena/data/view/PRJNA273563
##Project # = PRJNA273563

#use the runIDs chosen to 'build' the ftp address using the 'getting_ENAftps.py' + add wget to the lines so it's all r3ady 
#Then just do it via running the 'download_ftps.sh' script
#run it with 
bash download_ftps.sh


#also download the reference genome from tair

wget ftp://ftp.ensemblgenomes.org/pub/plants/release-41/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz

