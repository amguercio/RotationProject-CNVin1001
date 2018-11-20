#get_runID.py

##python script to extract runIDs from table of Accession information from Arabidopsis 1001 genomes project

## amguercio (Angelica Guercio) 2018



###Extract run IDs into a separate file

Infile = open("/scratch/amguercio-rotation/data_foranalyses.csv", "r")
Outfile = open("/scratch/amguercio-rotation/runIDs_fordl.txt", "w")

for line in Infile:
  line = line.strip()
  parts = line.split(",")
  runID = parts[8]
  Outfile.write(runID + "\n")
  
Infile.close()
Outfile.close()
