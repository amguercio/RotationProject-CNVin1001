#reads_n_ref_dl.sh

##Script to download reads files randomly chosen from 50 accessions from the arabidopsis 1001 genomes project

## amguercio (Angelica Guercio) 2018


##To download the files from ENA (DON'T EVEN TRY WITH THE SRA BS--SERIOUSLY)
##Site = https://www.ebi.ac.uk/ena/data/view/PRJNA273563
##Project # = PRJNA273563

##just run the wget lines parsed using the 'getting_ENAftps.py' script via running the 'download_ftps.sh' script
#just run it with 
bash download_ftps.sh


#also download the reference genome from tair

wget ftp://ftp.ensemblgenomes.org/pub/plants/release-41/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz

