#####################
#################################################
#Script Name:         picking_genomes.sh
#Description:         Script to pick 50 genomes randomly from 1001 genomes project in arabidopsis
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################



#################################################
###Get Accession Info

#download the table of all available sequenced accessions from the 1001 genomes project
#at https://1001genomes.org/accessions.html




#################################################
###Pick 50 Random Accessions (for testing purposes)

#Layout of shuf command 
#shuf -n numberoflines_topick inputfile.csv > output.txt


shuf -n 50 seqdata_list1001.csv > data_foranalyses.csv


###Or if on computer with zsh + homebrew -- 
#brew install coreutils
#gshuf -n 50 seqdata_list1001.csv > testtwo.csv
