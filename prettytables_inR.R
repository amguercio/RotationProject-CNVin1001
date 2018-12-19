#prettytables_inR.R

##Make a pretty table from a csv

## amguercio (Angelica Guercio) 2018

 

#install.packages("formattable") 


#Loading libraries 
library(formattable) 
library(ggplot2)
library(gridExtra)


#Read in the data
tab = read.table("data_foranalyses.csv", header=F, sep=',', stringsAsFactors=F) 

#Add column names 
colnames(tab) = c("SampleID", "Name", "CS_Number", "Country", "Lat", 
                         "Lon", "Researcher", "Institution", "SRR_Number", "SE/PE")


#create the actual table
mytable = formattable(tab) 
#display the table in your web browser or in RStudio (if you use it) 
mytable 



##use ggplot to export table 
png("test.png", height=1100, width=800)
p<-tableGrob(mytable)
grid.arrange(p)
dev.off()
