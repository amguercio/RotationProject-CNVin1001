#####################
#################################################
#Script Name:         prettytables_inR.R
#Description:         Script to make a pretty table from a csv (for publications etc)
#Author:              amguercio (Angelica Guercio) 2018
#################################################
######################



#################################################
###Loading libraries 

#install.packages("formattable") 
library(formattable) 
library(ggplot2)
library(gridExtra)


#################################################
#Read in the data
tab = read.table("data_foranalyses.csv", header=F, sep=',', stringsAsFactors=F) 


#Add column names 
colnames(tab) = c("SampleID", "Name", "CS_Number", "Country", "Lat", 
                         "Lon", "Researcher", "Institution", "SRR_Number", "SE/PE")


#################################################
#Create the actual table
mytable = formattable(tab) 
#display the table in your web browser or in RStudio (if you use it) 
#mytable 


##use ggplot to export table 
png("test.png", height=1100, width=800)
p<-tableGrob(mytable)
grid.arrange(p)
dev.off()
