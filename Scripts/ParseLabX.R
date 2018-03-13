#install.packages("seacarb")
#install.packages("whoami")
#install.packages("tidyverse")
library(seacarb)
library(tidyverse)
library(whoami)

# Acid titrant constants
#Batch A10
A10_density <- 1.02449 # g/cm^3
A10_concentration <- 0.100215 # mol/kg

# CRM constants
#Batch 168
CRM168_TA <- 2207.62 # umol/kg
CRM168_salinity <- 33.481 # PSU (~g/kg)


#Enter voltage cutoffs
#These values are constants.
pH3.0 <- 228.57
pH3.5 <- 200

# mols to umols conversion

mol_to_umol <- 1000000

# Column headers
# V is volumen in mL
# t is time in seconds
# E is voltage in mV
# T is temperature in C
# dV/dT is change in voltage divided by change in temperature
headers <- c("V", "t", "E", "T", "dV/dT")

# Load file
data_file <- 'Data/TestData2/TitrationFiles/Y10-3_7_2018-Silbiger TA (EP)r1.csv'


### Read data in as csv table that handles issue of having more columns in bottom portion of file than in top portion.
# Sets file encoding to rm weird characters
# Sets number of columns and assigns column names (V#) based on total number of fields detected in the file.
data1 <- read.table(data_file, header = FALSE, 
                    stringsAsFactors = FALSE, 
                    na.strings = "NaN", 
                    fileEncoding="UTF-8-BOM", 
                    sep = ",", 
                    col.names = paste0("V",seq_len(max(count.fields(data_file, sep = ',')) - 1)), fill = TRUE)

data1<-read.csv(data_file, header=F, sep=",", na.string="NA",as.is=T)[ ,1:5] 
colnames(data1)<-c('V',	't',	'E',	'T',	'dV/dt')
# Pulls total sample number from Row 2, Col. 2, position 11.
# Converts from string to number.
# Data export must be Raw Data & Total Measured Values.
total_samples <- as.numeric(data1[3,2] %>% substr(11,12))

### Extract sample names

# Identifies rows starting with "Scope" in column 1
sample_name_positions <- grep("^Scope", data1$V1) 

# Subsets the entire data set based on a subset of sample_name_positions.
# Uses the length of the sample_name_positions vector divide by two because there are two entries per sample in the dataset.
sample_list <- data1[sample_name_positions[1:(length(sample_name_positions)/2)], 2] 

# Pulls out the actual sample names using the number of characters, minus 1 to get rid of ending ")" in cells, as the stop value for substr.
# Stores as a list, which will be useful for assigning data to each sample name later on.
sample_names <- substr(sample_list, 15, as.numeric(nchar(sample_list))-1)
sample_names_list <- list()
for (item in 1:length(sample_names)){
  sample_names_list[[item]] <- sample_names[item]
}

### Extract samples weights

# Pulls the weight field by searching for rows with "Sample size".
weights_with_units <- data1[grep("^Sample size", data1$V1), 2]

# Determines the string length by converting to characters and counting the characters.
# Uses grep to search for rows in column 1 that begin with "Sample size".
# Subtracts two from character length to account for "<space>g" at end of entry.
weight_char_counts <- weights_with_units %>% 
  nchar() %>% 
  as.numeric() - 2

# Removes the last two characters from the weight field (<space>g)
# of each entry in the weights_with_units vector.
sample_weights <- as.numeric(substr(weights_with_units,1,weight_char_counts))


### Parse out necessary info from two-part titration

# Identify rows that contain "TitrationEP1" text in column 2
EP1_titrations_rows <- grep("^TitrationEP1", data1$V2)
# Identify rows that contain "TitrationEP2" text in column 2
EP2_titrations_rows <- grep("^TitrationEP2", data1$V2)

# Create list of endpoint 1 (EP1) titrations
# Will be used to store EP1 final volumes
EP1_Vf <- list()
for (row in 1:length(EP1_titrations_rows)){
  EP1_Vf[[row]] <- paste("EP1_Vf_", row, sep = "")
}

# Pull out final EP1 volumes
# Final EP1 volumes are the row before the beginning of each EP2 titration data set; thus, subtract "1" from each EP2 titration row value
for (item in 1:length(EP1_titrations_rows)){
  EP1_Vf[[item]]<- data1[(EP2_titrations_rows[item]-1), 1]
}

#Convert EP1_Vf values to numeric.
EP1_Vf <- sapply(EP1_Vf, as.numeric)


### Parse out EP2 data.

# Beginning of data == EP2 row#+2
# End of data == the next EP1 titration row - 2
# UNLESS
# Last entry - which selects to end of file (e.g. tail(data1, (nrow(data1))
for (item in 1:length(EP2_titrations_rows)){
  if (item == length(EP2_titrations_rows)){
    sample_names_list[[item]]<- tail(data1, (nrow(data1) - (EP2_titrations_rows[item]+1)))
  } else {
    sample_names_list[[item]]<- data1[(EP2_titrations_rows[item]+2):(EP1_titrations_rows[item+1]-2),]
  }
}


# Convert all data frames in sample_names_list to numeric
# Add column names (headers) to each data frame in sample_names_list list
for (item in 1:length(sample_names_list)){
  sample_names_list[[item]] <- as.data.frame(sapply(sample_names_list[[item]], as.numeric))
  colnames(sample_names_list[[item]]) <- headers
}


# Determine total acid added to each sample
# First, start to loop through each data frame in the sample_names_list
# For each data frame:
# - set acid volume
# - calculate the acid added in the final titration
# - while loop to:
# -- calculate cumulative acid added at each titration point
# - determine final cumulative acid amount and assign to last row of data frame
for (item in 1:length(sample_names_list)){
  total_acid_vol <- EP1_Vf[[item]]
  final_acid_addition <- sample_names_list[[item]][nrow(sample_names_list[[item]]), "V"] - sample_names_list[[item]][(nrow(sample_names_list[[item]]) - 1), "V"]
  row <- 1
  while (row < nrow(sample_names_list[[item]])){
    total_acid_vol <- total_acid_vol + ((sample_names_list[[item]][row+1, "V"] - sample_names_list[[item]][row, "V"]))
    sample_names_list[[item]][row, "V"] <- total_acid_vol
    row <- row + 1
  }
  sample_names_list[[item]][nrow(sample_names_list[[item]]), "V"] <- total_acid_vol + final_acid_addition
}
