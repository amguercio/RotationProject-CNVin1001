#####################
#################################################
#Script Name:         getting_ENAftps.py
#Description:         Script using runIDs to build download link for downloading sequences
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################


#################################################
##To download the files from ENA (DON'T EVEN TRY WITH THE SRA BS--SERIOUSLY)
##Site = https://www.ebi.ac.uk/ena/data/view/PRJNA273563
##Project # = PRJNA273563


#Using the 'run IDs' from runIDs_fordl.txt (our subsetted samples), we can 'build' the ftp address from ena and add wget to the line
#then we can just run this resulting output file (as a script) to wget all of our files!

#some important info about how ena ftp addresses are organized can be found here under 'Fastq file directory organisation':
#https://www.ebi.ac.uk/ena/browse/read-download#downloading_files_ena_browser

#Format:
#ftp://ftp.sra.ebi.ac.uk/vol1/fastq/<dir1>/<dir2>/<run accession>
  #<dir1> is the first 6 letters and numbers of the run accession ( e.g. ERR000 for ERR000916 ),
  #<dir2> does not exist if the run accession has six digits. For example, fastq files for run ERR000916 are in directory: ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR000/ERR000916/.
  #If the run accession has seven digits then the <dir2> is 00 + the last digit of the run accession. For example, fastq files for run SRR1016916 are in directory: ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR101/006/SRR1016916/.
  #If the run accession has eight digits then the <dir2> is 0 + the last two digits of the run accession.
  #If the run accession has nine digits then the <dir2> is the last three digits of the run accession.

#all 1001 accessions have 7 digits-- so will be in 001 format



#################################################
###Here is the python parser to take the runIDs and make them into wget-able ftp addresses

Infile = open("runIDs_fordl.txt", "r")
Outfile = open("download_ftps.sh", "w")


for line in Infile:
        fullname = line.strip()
        parts = list(fullname)    #list() will separate the full name by characters (i.e. 'S' 'R' 'R' '1' '4'..etc)
        #print(parts)             #to see if your line is successfully separated into characters
        first3dig = parts[3] + parts[4] + parts[5]    #get the first 3 digits for <dir1>
        lastdig = parts[9]         #get the last digit for <dir2>
        Outfile.write("wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR" + first3dig + "/" + "00" + lastdig + "/" + fullname + "/" + fullname + "_1.fastq.gz" + "\n")
        #for the PE _1.fastq.gz file
        Outfile.write("wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR" + first3dig + "/" + "00" + lastdig + "/" + fullname + "/" + fullname + "_2.fastq.gz" + "\n")
        #for the PE _2.fastq.gz file

Infile.close()
Outfile.close()


###The resulting file will look like this:
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR194/008/SRR1945948/SRR1945948_1.fastq.gz
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR194/008/SRR1945948/SRR1945948_2.fastq.gz
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR194/007/SRR1945627/SRR1945627_1.fastq.gz
#...


