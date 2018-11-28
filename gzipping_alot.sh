#gzipping_alot.sh

##Script to zip lots of unzipped fastq files using pigz software

## amguercio (Angelica Guercio) 2018


FILES=*.fastq
#echo $FILES

for f in $FILES
do
        pigz $f -p 10
done
