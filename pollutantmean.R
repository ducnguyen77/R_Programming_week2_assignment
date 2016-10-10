# pollutantmean function calculates the mean values of "polutant"
## "directory" is a character vector of length 1 indicating the location of the CSV files
## 'polutant' is a character vector of length 1 indicating the name of the pollutant for wich we will calculate the mean: either "sulfate" or "nitrate"
## "id" is an integer vector indicating the monitor ID numbers to be used.

## function returns the mean of the pollutant across all monitors list in the "id" vector (ignoring NA values)
## Note: Do not round the results!

rm(list = ls()) # remove all variables before running the function

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # reading all files with "*.csv" in the directory
  #directory = "specdata"
  full_data <- list.files(directory, pattern = "*.csv", full.names = TRUE) 
  
  dat <- data.frame() # creating an empty data frame to store the data
  
  for (i in id) {
    # read the data sets and merge the data sets into one data frame
    #dat <- rbind(dat, read.csv(full_data[i])) 
    dat_i <- read.csv(full_data[i]) 
    dat <- rbind(dat, dat_i) 
    }
  # Calculating the mean values of the pollutant with rounding the digits to 3 after the 
  round (mean(dat[, pollutant], na.rm = TRUE), digits = 3)
}

#----------------------------------------------------------------------------------
#Q1
 pollutantmean("specdata", "sulfate", 1:10)
# [1] 4.064
 #Q2
 pollutantmean("specdata", "nitrate", 70:72)
 #[1] 1.706
 # Q3
 pollutantmean("specdata", "sulfate", 34)
 # [1] 1.477
 #Q4
 pollutantmean("specdata", "nitrate")
 # [1] 1.703
 
 