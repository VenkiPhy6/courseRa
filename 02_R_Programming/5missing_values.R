#See Week 1 in JHU course - R Programming
#Dealing with missing values

#Finding Missing numers and characters
x1 <- c(1, 2, NA, 9, 11, NaN)
x1
is.na(x1)  
is.nan(x1) #NaN is not a missing value. NaN is like a number.
0/0; Inf - Inf #To create a NaN

#Subsetting non missing numbers and characters from a single vector
bad <- is.na(x1)
x1[!bad]

#Subsetting non missing values from multiple vectors
x2 <- c(3,4, NA, 10, 11, 3)
x3 <- complete.cases(x1, x2) #complete.cases treats NaN like its missing. 
x3
x2[x3] #3 gets forgotten!
x1[x3]

#Subsetting non missing values from a data frame
head(airquality)
good <- complete.cases(airquality)
good
head(airquality[good, ])

#Creating a dataset of missing values to play around with if needed
data_set <- sample(c(rnorm(1000), rep(NA, times = 1000)), 100)
data_set

#Be careful when using logical operations when NAs or involved
data_set == NA #This should work as a substitute for is.na(). But it doesn't!
data_set[data_set>1]
