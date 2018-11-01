#See Week 1 in JHU course - R Programming
#Dealing with missing values

#Finding Missing numers and characters
x1 <- c(1, 2, NA, 9, 11, NaN)
x1
is.na(x1)  
is.nan(x1) #NaN is not a missing value. NaN is like a number.

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
