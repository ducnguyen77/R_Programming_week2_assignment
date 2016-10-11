# Part 2
# function complete
# Write a function that reads a directory full of files and reports the number of completely observed cases in each data file.
#The function should return a data frame where the first column is the name of the file and the second column is the number
# of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
  ## "directory" is a character vector of length 1 indicating the location of the CSV files
  ## "id" is an integer vector indicating the monitor ID numbers to be used
  
  # return a data of the form:
  # id nobs
  # 1  117
  # 2  1041
  #...
  # where "id" is the monitor number and "nobs" is the number of complete cases
  # (cases are complete, i.e., have no missing values).
  
  full_data <-
    list.files(directory, pattern = "*.csv", full.names = TRUE)
   dat <- matrix() # or use (numeric()) creating an empty matrix/vector to store the results later on
  
  j <- 1
  for (i in id) {
    dat_i <- read.csv(full_data[i], header = TRUE)
    dat[j] <- sum(complete.cases(dat_i))
    j <- j + 1
    
  }
  
  result <- data.frame(id = id, nobs = dat)
}

#-----------------------------------------------------------------------------------------------
#Q5
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
# [1] 228 148 124 165 104 460 232


#Q6
cc <- complete("specdata", 54)
print(cc$nobs)
# [1] 219

#Q7
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
# [1] 711 135  74 445 178  73  49   0 687 237
