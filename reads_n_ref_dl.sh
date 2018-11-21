#!/bin/bash -l

#SBATCH --output=dl.stdout


#reads_n_ref_dl.sh

##Script to download reads files randomly chosen from 50 accessions from the arabidopsis 1001 genomes project

## amguercio (Angelica Guercio) 2018



###Using file containing run IDs from SRA on each line, use sra software to dump it (download it) locally

cd /scratch/amguercio-rotation

module load sratoolkit/2.8.2-1

cat runIDs_fordl.txt | while read line; do
  fastq-dump -X 1 -Z $line
  done


#also download the reference genome from tair


wget ftp://ftp.ensemblgenomes.org/pub/plants/release-41/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz

