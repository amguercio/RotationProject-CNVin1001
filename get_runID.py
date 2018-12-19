#####################
#################################################
#Script Name:         get_runID.py
#Description:         python script to extract runIDs from table of Accession information from Arabidopsis 1001 genomes project
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################

###From table created using 'picking_genomes.sh', extract the 'runID' number into a new file for use in subsequent analyses 

#################################################
###Extract run IDs into a separate file

Infile = open("/scratch/amguercio-rotation/data_foranalyses.csv", "r")
#open .csv file containing table of accession information
Outfile = open("/scratch/amguercio-rotation/runIDs_fordl.txt", "w")

for line in Infile:
  line = line.strip()
  parts = line.split(",")
  runID = parts[8]
  Outfile.write(runID + "\n")
  
Infile.close()
Outfile.close()
