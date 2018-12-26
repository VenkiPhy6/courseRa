##To learn more:
#1. https://github.com/Rdatatable/data.table/wiki - Homepage 
#2. https://stackoverflow.com/questions/13618488/what-you-can-do-with-a-data-frame-that-you-cant-with-a-data-table - data.frame vs data.table (Might be a bit outdated)

library(data.table)
?data.table

#Creating---
#It is similar to data frame
set.seed(1)
df1 <- data.frame(x = rnorm(9), y = rep(c('a','b','c'), each=3), z = rnorm(9))
head(df1)

set.seed(1)
dt1 <- data.table(x = rnorm(9), y = rep(c('a','b','c'), each=3), z = rnorm(9))
head(dt1)

#Subsetting----
tables() #Find out the names of all the data tables in memory
dt1[1,]
dt1[dt1$y=='a',]
dt1[c(2,3)] #Works as expected with data frames
dt1[,c(2,3)] #If it was an older version this wouldn't work as expected.
#Setting keys
dt2 <- data.table(x = rep(c("a","b","c"), each=100), y = rnorm(300))
setkey(dt2, x)
dt2['a']

#Evaluating expressions----
dt1[,list(mean(x), sum(z))] #Variable names don't require quotes
dt1[,table(y)]
dt1[,w:=z^2] #Cooking up new variables
dt1[, m := {tmp <- x+z; log2(tmp+5)}] #Curly braces indicate a single expression in R
dt1
dt1[, a := x>0]
dt1
dt1[, b:= mean(x+w), by=a] #Find mean(x+w) wherever it hits TRUE first and set that value in all places where a is TRUE. Same with FALSE.

#Special variables----
set.seed(123)
dt3 <- data.table(x = sample(letters[1:3], 1E5, TRUE))
dt3[, .N, by=x] #.N variable is used to get a count

#Making copies----
dt4 <- dt1 #This actually assigns a 'View' of dt1 to dt2. So changing dt1 changes dt2 also. 
dt4
dt1[,y:=2] #Dont worry about the warning
dt1
dt4
dt5 <- copy(dt1) #To create an actual copy
dt1[,y:=1]
dt1
dt5

#Joins----
dt6 <- data.table(x = c('a','a','b','dt1'), y = 1:4)
dt6
dt7 <- data.table(x= c('a','b','dt2'), z=5:7)
dt7
setkey(dt6, x)
setkey(dt7, x)
merge(dt6, dt7)

#Fast reading----
##Instead of using read.table to read a file as a data frame if we use fread to read as a data table, things would be much faster
#Just creating a file to illustrate the point
df8 <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(df8, file=file, row.names=F, col.names=T, sep='\t', quote=F)
#Here is the comparison
system.time(fread(file))
system.time(read.table(file))
