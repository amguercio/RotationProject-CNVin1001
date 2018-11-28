#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=5
#SBATCH --mem-per-cpu=40G
#SBATCH --time=1 ##this is one day I think?
#SBATCH --output=dl.stdout
#SBATCH --mail-user=amguercio@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="dl"
####nosbatch -p for partition


##to submit = sbatch reads_n_ref_dl.sh


#reads_n_ref_dl.sh

##Script to download reads files randomly chosen from 50 accessions from the arabidopsis 1001 genomes project

## amguercio (Angelica Guercio) 2018



###Using file containing run IDs from SRA on each line, use sra software to dump it (download it) locally

cd /scratch/amguercio-rotation

module load sratoolkit/2.8.2-1
##sra toolkit allows you to use the fastq-dump function to dl reads via their run ID name
##the -I --split-files allows for PE reads files from this run ID to be downloaded into two files $line_1.fastq and $line_2.fastq

cat runIDs_fordl.txt | while read line; do
  fastq-dump -I --split-files $line
  done

#this might make it parallel the command
#parallel -j 4 fastq-dump -I --split-files SRR1946550

#for gzipped
#fastq-dump -I --split-files SRR1946550 --gzip

#also download the reference genome from tair


wget ftp://ftp.ensemblgenomes.org/pub/plants/release-41/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz

