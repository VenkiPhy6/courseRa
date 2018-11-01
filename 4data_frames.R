#See Week 1 in JHU course - R Programming
#Data types - Data frames

#Creating data frames----
x <- data.frame(foo = 1:6, bar = c(T, F, F, T, F, F))
x
nrow(x)
ncol(x)


#Subsetting a data frame----
x[1,2] #Numerical indices
x[1,]
x[,2]
x[1:5,]
x[,1:2]
x[1:3,2]
x[x<2,] #Conditional index
x['foo'] #Namewise
x['bar']
x[['f', exact=F]] #Partial matching
x[['b', exact=F]]
