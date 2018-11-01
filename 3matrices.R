#See Week 1 in JHU course - R Programming
#Data Types - Matrices

#Creating a matrix----
m1 <- matrix(nrow=2, ncol=3)
m1
m2 <- matrix(1:6, nrow=2, ncol=3) #Matrices are created columnwise be default
m2
#Row and column binding
y1 <- c(4, 5, 6)
y2 <- c(9, 10, 11)
cbind(y1, y2)
rbind(y1, y2)
y3 <- 1:3
y4 <- 11:15
rbind(y3, y4) #Intersting results
cbind(y4, y3)


#Matrix attributes----
dim(m1)
attributes(m1)
#Creating the attribute
x1 <- c(4,5,9,11)
dim(x1) <- c(2,2)
x1
dimnames(x1) <- list(c('a','b'), c('c','d')) #Naming a matrix's rows and columns
x1

#Sometimes atrributes get lost
x2 <- 1:14
names(x2) <- LETTERS[1:14]
x2
dim(x2) <- c(7,2)
x2
attributes(x2) #The names atrribute now got lost?
x2 <- as.vector(x2)
x2
names(x2) #It looks like it...


#Subsetting a Matrix----
m2[1,2] #Unlike a list, no need for double braces. Note that return type is not a matrix but a vector..
m2[1,] 
m2[,1]
m2[2,2, drop = F] #To return a matrix itself, use drop argument.
m2[2, , drop = F]
