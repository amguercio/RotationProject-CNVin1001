#get_runID.py

##python script to extract runIDs from table of Accession information from Arabidopsis 1001 genomes project

## amguercio (Angelica Guercio) 2018


#https://www.ncbi.nlm.nih.gov/sra/?term=SRP056687
#https://www.ncbi.nlm.nih.gov/Traces/study/?WebEnv=NCID_1_101509539_130.14.22.33_5555_1542742816_1648241546_0MetA0_S_HStore&query_key=11


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
