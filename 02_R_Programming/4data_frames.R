#See Week 1 in JHU course - R Programming
#Data types - Data frames

#Creating data frames----
x <- data.frame(foo = 1:6, bar = c(T, F, F, T, F, F))
x

#Subsetting a data frame----
x[1,2] #Numerical indices
x[1,]
x[,2]
x[1:5,]
x[,1:2]
x[1:3,2]
x[x$foo<4,] #Conditional index
x['foo'] #Namewise
x['bar']
x[['f', exact=F]] #Partial matching
x[['b', exact=F]]

#Exploring a data frame----
dim(x)
nrow(x)
ncol(x)
object.size(x)
names(x)
head(x)
head(x, 10)
tail(x)
tail(x, 15)
summary(x)
table(x$foo)
str(x) #Cn be used on funtions and other objects also

data(x) #What does this do exactly?
viewinfo() #Doesn't work here for some reason