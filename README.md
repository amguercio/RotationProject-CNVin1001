# RotationProject-CNVin1001
All associated scripts from Comai lab rotation project performed from 11.05.18 - 12.22.18


**picking_accessions.sh** 
* Script to pick 50 accessions randomly from 1001 genomes project in arabidopsis 
    * Uses `bash`    
 
**get_runID.py** 
* Python script to extract runIDs from table of Accession information from Arabidopsis 1001 genomes project
    * Uses `python2`
  
**getting_ENAftps.py** 
* Script using runIDs to build download link for downloading sequences 
    * Uses `python2`    
 
**reads_n_ref_dl.sh** 
* Script to download reads files from 50 accessions from the arabidopsis 1001 genomes project and thaliana reference
    * Uses `bash`
    
**trimmingreads.sh** 
* Script to trim PE reads of their adaptors, low qual sequences, and to a min len of 25 
    * Uses `trimmomatic/0.33` 
 
**mappingreads.sh** 
* Script to map trimmed PE reads to the a. thaliana reference
    * Uses `bwa/0.7.16a`
    
**bin-by-sam_runscript.sh** 
* Script to run the Comai lab bin-by-sam script to plot read mapping densities
    * Uses `python2` 
 
**plotting_mapbinning.R** 
* Script to plot output of bin-by-sam.py script for 50 arabidopsis genomes to look at CNVs (overplotting)
    * Uses `R`
    
**prettytables_inR.R** 
* Script to make a pretty table from a csv (for publications etc)
    * Uses `R`
    
