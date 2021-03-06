#Calculate total alkalinity using potentiometric titrations
#Uses a for loop to read in data exported as a titration file and calculate Total alkalinity
#At the end it exports your data as a .csv file. Comment the last line out if your don't want that.

### Files needed ######
# 1. pHCalibration.csv in your "Data" folder
#Inside the Data folder You must have a subfolder for each data set. In each subfolder there is:
#2. the mass file for your run  (exported directly from labx)
#3. a subfolder named "TitrationFiles" (where all of your titration files are) directly exported from LabX.
# 

#Created by Nyssa Silbiger 03/28/2014
#modified 08/18/2018 - N Silbiger
#------------------------------------------------------------
rm(list=ls())

#set working directory---------------------------------------------------------------------------------------------
main<-getwd()

#load libraries----------------------------------------------
library(seacarb) #used to calculate TA

#CHANGE THESE VALUES EVERY DAY----------------------------------------------
path<-"Data/TestData2" #the location of all your titration files
massfile<-"Mass-3_8_2018.csv" # name of your file with masses

# Date that the data were run
date<-'3/8/2018'


#DO NOT CHANGE ANYTHING BELOW THIS LINE UNLESS A NEW BOTTLE OF ACID IS USED
#load Data---------------------------------------------------
#load Mass Data
Mass<-read.csv(file.path(path,massfile), header=T, sep=",", na.string="NA", as.is=T, skip=2) 

pHCal<-read.csv('Data/pHCalibration.csv') # read in the pH Calibration file

#select the calibration for the correct date
pHData<-pHCal[pHCal$Date==date,]

# calculate pH 3 and 3.5 based on the slope and intercept from pH 4, 7, and 10 calibration
mod.pH<-lm(c(pHData$pH4, pHData$pH7, pHData$pH10)~c(4,7,10)) # linear model

# print a plot of the relationship between pH and mV
png(paste0(path,"/",Sys.Date(),'pHmvplot.png'), height = 400, width = 400)
plot(c(4,7,10), c(pHData$pH4, pHData$pH7, pHData$pH10), xlab = 'pH', ylab = 'mv')
lines(c(4,7,10), predict(mod.pH))
R2<-summary(mod.pH)$r.squared
legend('topright', legend = bquote(R^2 == .(format(R2, digits = 3))), bty='n')
dev.off()

# Select the mV for pH=3 and pH=3.5 based on your probe calibration
pH35<-mod.pH$coefficients[1]+mod.pH$coefficients[2]*3.5
pH3<-mod.pH$coefficients[1]+mod.pH$coefficients[2]*3

#find all the titration data files
#list all the file names in your data and sample directory
file.names<-list.files(path = file.path(path,"/TitrationFiles")) 
# only get the csv files
file.names <- file.names[grep("[.]csv", file.names)] 

#create an empty matrix to put the TA values in
nrow<-length(file.names)
TA <- matrix(nrow = nrow, ncol = 4)
rownames(TA)<-file.names
colnames(TA)<-c("SampleID",'TA','Mass','Sample.Index')
TA[,2:4]<-as.numeric(TA[,2:4])

# only keep sample ID and weight and remove the extra stuff at the bottom
Mass<-Mass[1:length(file.names),c('Sample.ID1','Weight..g.','Sample.Index.In.Scope')]

# set working directory to where the data is
#setwd(file.path(main,path,"/TitrationFiles"))
setwd(file.path(main,path,"/TitrationFiles"))

#run a for loop to bring in the titration files on at a time and calculate TA

for(i in 1: length(file.names)) {
  Data<-read.csv(file.names[i], header=F, sep=",", na.string="NA",as.is=T, skip=10)[ ,1:5] 
  colnames(Data) <-  c("Volume","Time",	"mV",	"Temperature",	"dV/dt")
  
  # everything was brought in as a character because of the second line, converts back to numeric
  Data$mV<-as.numeric(Data$mV)
  Data$Temperature<-as.numeric(Data$Temperature)
  Data$Volume<-as.numeric(Data$Volume)
  #name of the file without .csv
  #name<-unlist(strsplit(file.names[i], split='.', fixed=TRUE))[1]
  name<-unlist(strsplit(file.names[i], split='-', fixed=TRUE))[1]
  
  #calculates the index of values between pH 2 and 3.5 
  mV<-which(Data$mV<pH3 & Data$mV>pH35) 
  
  #CHANGE ONLY WHEN NEW BOTTLE OF ACID IS USED----------------------------------
  #Bottle #26 , 
  #density of your titrant: change every time acid is changed

   d<-100*(-0.00000410*mean(Data$Temperature[mV], na.rm=T)^2-0.0001067*mean(Data$Temperature[mV], na.rm=T)+1.02882)/1000 #03/8/18
  #7/15/2016 batch A10
 
   #concentration of your titrant: CHANGE EVERYTIME ACID IS CHANGED 
   c<-0.100215 #03/8/2018
  
  #------------------------------------------------------------------------------
  
  #Salinity of your samples
  s<-33.518
  #s<-Mass[name,2]
  #mass of sample in g: changed with every sample
  #mass<-Mass[name,1]
  mass<-Mass[Mass$Sample.ID1==name,2]
  sample.index<-Mass[Mass$Sample.ID1==name,3]# this is the order that the sample was run
  #-------------------------------------------------------------------
  #Calculate TA
  
  #at function is based on code in saecarb package by Steeve Comeau, Heloise Lavigne and Jean-Pierre Gattuso
  TA[i,1]<-name
  TA[i,2]<-10000000*at(S=s,T=mean(Data$Temperature[mV], na.rm=T), C=c, d=d, pHTris=NULL, ETris=NULL, weight=mass, E=Data$mV[mV], volume=Data$Volume[mV])
  TA[i,3]<-mass
  TA[i,4]<-sample.index
}

#exports your data as a CSV file
setwd("../")
write.table(TA,paste("TA",Sys.Date(),".csv"),sep=",", row.names=FALSE)


