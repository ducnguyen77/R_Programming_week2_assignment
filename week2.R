# week 2
setwd("D://Data_science/R_Programming")
dir.create("week2")
setwd("D://Data_science/R_Programming/week2")

rm(list = ls())

# COntrol structures
# if, else : testing a condition
# for: excecute a loop a fixed number of times
# while: execute a loop while a condition is true
# repeat: execute an infinite loop
# break: break the execution of a loop
# next: skip an interation of a loop
# return: exit a function

# control structure (if else)
x <- 5
if (x > 3) {
  y <- 10
} else {
  y <- 0
}
y

# for loop
for (i in 1:10) {
  print(i)
}

x <- c ("a", "b", "c", "d")
for (i in 1:4) {
  print(x[i])
}
#------------------------------------------------------
for (i in seq_along(x)) {
  print(x[i])
  
}

#--------------------------------------------------------
for (letter in x) {
  print(letter)
  
}

#----------------------------------------------------------
for (i in 1:4)
  print(x[i])

# Nested for loops (for loop inside a for loop)
x <- matrix(1:6, 2, 3)
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print(x[i, j])
    
  }
  
}

# While
count <- 0
while (count < 10) {
  print(count)
  count <- count + 1
}

#-------------------------------------------------
z <- 10
while (z >= 3 && z <= 20) {
  print(z)
  coin <-
    rbinom(1, 1, 0.5) # tung dong xu, va chi dua ra gia tri 1 hoac 0
  if (coin == 1) {
    ## random walk
    z < z + 1
  } else {
    z <- z - 1
  }
}
#----------------------------------------------------------------------------
# repeat, next and break
x0 <- 1
tol <- 1e-8
repeat {
  x1 <- computeEstimate()
  if (abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

#-------------------------------------------
for (i in 1:100) {
  if (i <= 20) {
    ## Skip the first 20 interations
    next
  }
  y <- 2 * i
}
y

#--------------------------------------------------------------
# writing function
add2 <- function(x, y) {
  x + y
}
add2(3, 5)

#-----------------------------------------------------------------
above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n) {
  use <- x > n
  x[use]
}
x <- 1:20
above(x, 12)
#------------------------------------------------------------------
x <- 1:20
above <- function(x, n = 10) {
  use <- x > n
  x[use]
}
above(x)

#-------------------------------------------------------------------
colnumnmean <- function(y) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[, i])
    
  }
  means
}
colnumnmean(airquality)

#--------------------------------------------------------------------
colnumnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
    
  }
  means
}
colnumnmean(airquality)

# function
f <- function(< arguments >) {
  ## do something here
}

#-----------------------------------------------------------------------
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)
# Luu y, ko quan trong ve thu tu cua cac bien, nhung tot nhat la dat theo thu tu.
# Neu ten bien ma ko phu hop, thi no se tu dong lay ten bien theo order

f <- function(a, b) {
  print(a)
  print(b)
}
f(45, 10)

# The "..." argument
myplot <- function(z, y, type = "l", ...) {
  plot(x, y, type = type, ...)
}

###############################################################################
search()
# Lexical Scoping
make.power <- function(n) {
  pow <- function(x) {
    x ^ n
  }
  pow
}
cube <- make.power(3)
square <- make.power(2)
cube(2)
square(2)
ls(environment(cube))
get("n", environment(cube))
get("pow", environment(cube))

ls(environment(square))
get("n", environment(square))

#---------------------------------------------------------------------------------
y <- 10 # bien nay ko lien quan den y o trong function

f <- function(x) {
  y <- 2
  y ^ 2 + g(x)
}
g <- function(x) {
  x * y
}
f(3)
g(3)

#------------------------------------------------------------------------------------
make.NeglogLink <- function(data, fixed = c(FALSE, FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5 * length(data) * log(2 * pi * sigma ^ 2)
    b <- -0.5 * sum((data - mu) ^ 2) / (sigma ^ 2)
    - (a + b)
  }
}
set.seed(1)
normals <- rnorm(100, 1, 2)
nLL <- make.NeglogLink(normals)
nLL
ls(environment(nLL))

#----------------------------------------------------------------------------------------
optim(c(mu = 0, sigma = 1), nLL)$par
nLL <- make.NeglogLink((normals), c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum

nLL <- make.NeglogLink(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum

#--------------------------------------------------
nLL <- make.NeglogLink(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

nLL <- make.NeglogLink(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

###################################################################
# Coding standart

# Date and time
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-05"))

# Time
x<-Sys.time()
x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec
p$yday
p$wday
p$wday; p$isdst; p$zon; p$gmtoff

# Converting string to time objects
datestring <- c("january 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

# Operations on Dates and Times
x[1] - x[2]

# Different format of date and times: Can't mix different classes (POSIXlt & POSIXct)
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y
# Error in x - y : non-numeric argument to binary operator
# In addition: Warning message:
# Incompatible methods ("-.Date", "-.POSIXt") for "-" 

# convert x to POSIXlt
x<- as.POSIXlt(x)
x-y

# Nguoc lai
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
y<- as.POSIXlt(y)
x-y
class(y)
# + Ko hoat dong !!!??????????
x <- as.Date("2012-03-01"); y<- as.Date("2012-02-28")
x-y

x<-as.POSIXct("2012-10-25 01:00:00")
y<-as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
