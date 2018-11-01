#See Week 1 in JHU course - R Programming
#Data types - Factors

#Creating factors----
x1 <- factor(c('yes', 'no', 'yes', 'no', 'yes', 'no', 'no'))
x1
#Forcing order of factors. By default it is alphabetical order
x2 <- factor(c('Male', 'Male', 'Female', 'Male', 'Female'), levels = c('Male', 'Female'))
x2

#Finding frequency of levels 
table(x1)

#Understnading how R stores factors - as integer vectors with a levels attribute
y1 <- unclass(x1)
y1
attributes(y1)
class(y1)

#Naming the data in a factor
names(x1) = c('first','second', 'third')
x1

#Subsetting factors----
#Should work the same as subsetting vectors
x1[1] #Numerical indices
x1[5]
x1[2:4]
x1[x1 == 'yes'] #Logical indices
u <- x1 =='no'
x1[u]
x1[['t', exact=F]] #Partial matching. 
x1$t #'$ operator invalid for atomic vectors' as expected from vectors