# Part 3
# function corr

corr <- function(directory, threshold = 0) {
  ## "directory" is a character vector of length 1 indicating the location of the CSV files
  ## "threshold" is a numeric vector of length 1 indicating the number of completely observed observations (on all variables)
  ## required to compute the correlation between nitrate and sulfate: the default is 0
  
  ## Return a numeric vector of correlations
  ## Note: do not round the result!
  
  full_data <-
    list.files(directory, pattern = "*.csv", full.names = TRUE)
  dat <-
    vector(mode = "numeric", length = 0) # creating an zero data frame to store the results later on
  
  for (i in 1:length(full_data)) {
    dat_i <- read.csv(full_data[i], header = TRUE, sep = ",")
    csum <- sum((!is.na(dat_i$sulfate)) & (!is.na(dat_i$nitrate)))
    
    if (csum > threshold) {
      tmp1 <- dat_i[which(!is.na(dat_i$sulfate)),]
      tmp2 <- tmp1[which(!is.na(tmp1$nitrate)),]
      dat <- c(dat, cor(tmp2$sulfate, tmp2$nitrate))
    }
    
  }
  dat
  
}

#--------------------------------------------------------------------------------------
# Q8
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
# [1]  0.2688  0.1127 -0.0085  0.4586  0.0447

# Q9
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

#Q10
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
# [1]  0.0000 -0.0190  0.0419  0.1901