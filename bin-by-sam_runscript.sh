#####################
#################################################
#Script Name:         bin-by-sam_runscript.sh
#Description:         Script to run the Comai lab bin-by-sam script to plot read mapping densities
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################


#################################################
##documentation + dl page http://comailab.genomecenter.ucdavis.edu/index.php/Bin-by-sam
##detailed map page http://comailab.genomecenter.ucdavis.edu/images/3/30/README-bin-by-sam.pdf

#################################################
##command to run:

python bin-by-sam_2.0.py -o binnedmaps.txt -s 100000 
#-o flag indicates the outfile to save to 
#-s flag indicates 100kb bin size
