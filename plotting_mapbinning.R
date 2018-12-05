#plotting_mapbinning.R

##Script to plot output of bin-by-sam.py script for 50 arabidopsis genomes to look at CNVs (overplotting)

## amguercio (Angelica Guercio) 2018


#Output of bin-by-sam:
#"One file with a line per bin of each reference sequence and a column for each input .sam library, 
#as well as the relative coverage per input .sam library.'


#install.packages("reshape")
library(reshape)
library(ggplot2)
library(scales)


setwd("~/Documents/ComaiLab/scripts")



rawdata<- read.table("binnedmaps.txt", header = T)
head(rawdata)

notrawdata <- rawdata[ -c(4:51) ] #to remove the raw counts of mapped
#Filter out Pt and Mt
chrs <- c("1", "2", "3", "4", "5")
gooddata <- subset(notrawdata, Chrom %in% chrs)
tail(gooddata)



indata <- melt(gooddata, id=c("Chrom","Strt", "End"))   #to get tall not wide data
head(indata)

write.table(indata, "finaldata.txt", sep="\t")


#to change bin values (x-axes labels) out of sci notation
xvals <- format_format(scientific = FALSE)

##original raw plot

rawplt <- ggplot(indata, aes(x=Strt, y=value)) +
  geom_line(aes(fill=variable), alpha=0.4) +
  facet_wrap(~ Chrom, nrow=1, scales="free_x") +
  scale_y_continuous(limits=c(-1,10)) +
  scale_x_continuous(labels = xvals) +
  xlab("Position on Chromosome (100kb bins)") +
  ylab("Relative Coverage") +
  theme_dark() +
  theme(axis.text.x = element_text(angle = 35, vjust = 0.7))

rawplt
pdf("rawplt.pdf") 
rawplt
dev.off()


# Plot and save output
finalplt <- ggplot(indata, aes(x=Strt, y=value)) +
  geom_line(aes(fill=variable), alpha=0.4) +
  facet_wrap(~ Chrom, nrow=1, scales="free_x") +
  scale_y_continuous(limits=c(-1,10)) +
  scale_x_continuous(labels = xvals) +
  xlab("Position on Chromosome (100kb bins)") +
  ylab("Relative Coverage") +
  theme_dark() +
  theme(axis.text.x = element_text(angle = 35, vjust = 0.7)) +
  geom_rect(data=subset(indata, Chrom =="1"), mapping=aes(xmin=15000001, xmax=15100001, ymin = -0.5, ymax = 10, fill="Centromere"), fill="white") +
  geom_rect(data=subset(indata, Chrom =="2"), mapping=aes(xmin=3600001, xmax=3700001, ymin = -0.5, ymax = 10, fill="Centromere"), fill="white") +
  geom_rect(data=subset(indata, Chrom =="3"), mapping=aes(xmin=13700001, xmax=14300001, ymin = -0.5, ymax = 10, fill="Centromere"), fill="white") +
  geom_rect(data=subset(indata, Chrom =="4"), mapping=aes(xmin=3900001, xmax=4000001, ymin = -0.5, ymax = 10, fill="Centromere"), fill="white") +
  geom_rect(data=subset(indata, Chrom =="5"), mapping=aes(xmin=11700001, xmax=11800001, ymin = -0.5, ymax = 10, fill="Centromere"), fill="white")

pdf("finalplt.pdf") 
finalplt
dev.off()


#to define ranges to add to plot on each
  
##Centromere positions:

#Chr1 TAIR BAC_cloned_genomic_insert 15086046 15087045 . + . ID=AssemblyUnit_CEN1;Name=CEN1
#xmin=15000001, xmax=15100001

#Chr2 TAIR BAC_cloned_genomic_insert 3607930 3608929 . + . ID=AssemblyUnit_CEN2;Name=CEN2
#xmin=3600001, xmax=3700001

#Chr3 TAIR BAC_cloned_genomic_insert 13799418 13800417 . + . "ID=AssemblyUnit_""CEN3, PT.2OF3"";Name=""CEN3, PT.2OF3"""
#Chr3 TAIR BAC_cloned_genomic_insert 14208953 14209952 . + . "ID=AssemblyUnit_""CEN3, PT.3OF3"";Name=""CEN3, PT.3OF3"""
#xmin=13700001, xmax=14300001

#Chr4 TAIR BAC_cloned_genomic_insert 3956022 3957021 . + . ID=AssemblyUnit_CEN4;Name=CEN4
#xmin=3900001, xmax=4000001

#Chr5 TAIR BAC_cloned_genomic_insert 11725025 11726024 . + . ID=AssemblyUnit_CEN5;Name=CEN5
#xmin=11700001, xmax=11800001

  
