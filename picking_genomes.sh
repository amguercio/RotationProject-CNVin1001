#picking_genomes.sh

##Script to pick 50 genomes randomly from 1001 genomes project in arabidopsis

## amguercio (Angelica Guercio) 2018



###Get Accession Info

#download the table of all available sequenced accessions from the 1001 genomes project
#at https://1001genomes.org/accessions.html


###Pick 50 Random Accessions (for testing purposes)

#shuf -n numberoflines_topick inputfile.csv > output.txt

shuf -n 50 input > output

#or if on my comp with zsh + homebrew -- brew install coreutils
gshuf -n 50 seqdata_list1001.csv > testtwo.csv


#download them to the cluster

wget


#also download the reference genome from tair

