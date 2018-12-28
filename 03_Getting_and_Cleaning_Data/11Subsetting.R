#Learn more:
#1. See the Rprogramming course code
#2. http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf
#3. plyr tutorial - http://plyr.had.co.nz/09-user/


#Quick revision----
#Cooking up data
set.seed(13435)
X <- data.frame('var1' = sample(1:5), 'var2' = sample(6:10), var3 = sample(11:15))
X
X <- X[sample(1:5),]
X$var2[c(1,3)] <- NA
X
#Basic Subsetting
X[,1]
X[,'var1']
X[1:2,"var2"]
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]
X[X$var2 > 8,] #Subsetting on NAs leads to weir results
X[which(X$var2 > 8),] #So we use which to get the indices
#Sorting
sort(X$var1)
sort(X$var1, decreasing = TRUE)
sort(X$var2, na.last = TRUE)
X[order(X$var1, X$var3),]
#Adding a variable
X$var4 <- rnorm(5)
X
Y <- cbind(X, rnorm(5))
Y

#plyr----
library(plyr)
arrange(X, var1) #Same as sort(X$var1)
arange(X, desc(var1)) #Same as sort(X$var1, decreasing = TRUE)