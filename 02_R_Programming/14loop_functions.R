#Looping functions
#See Hadley Wickham's Journal of Statistical Software paper titled 'Split-Apply-Combine Strategy for Data Analysis'.

#lapply----

#l(ist )apply

# function (X, FUN, ...) 
# {
#   FUN <- match.fun(FUN)
#   if (!is.vector(X) || is.object(X)) 
#     X <- as.list(X)
#   .Internal(lapply(X, FUN))
# }
# <bytecode: 0x0000000009ebc1e8>
#   <environment: namespace:base>

x1 <- list(a = 1:5, b = rnorm(10))
lapply(x1, mean)
x2 <- list(a = 1:4, b = rnorm(4), c = rnorm(5), d = rnorm(6))
lapply(x2, mean)
x3 <- 1:4 #Always returns a list
lapply(x3, runif)
lapply(x3, runif, min=0, max=10) #Passing arguments to the function
x4<- list(a = matrix(1:9, nrow=3), b = matrix(1:4, nrow=2))
x4
lapply(x4, function(elt) elt[,1]) #Using anonymous function!

#sapply----
#s(implify list )apply
#Returns a vector or list accordingly
sapply(x4, mean) #Here every output element has a length 1 and so a vector was returned.
sapply(x4, mean, simplify = F) #To avoid above behavior

#apply----
#Apply a functions over the margins of a matrix
#Generally, not faster than a for loop. But less to code.
x5 <- matrix(rnorm(200), 20, 10)
x5
x6 <- array(rnorm(40), c(2,2,10))
x6
apply(x5, 2, mean) #1 is for rows and 2 is for columns
apply(x5, 1, mean)
apply(x6, c(1,2), mean)

#For fnding means and also sums it is better to use rowMeans, rowSums, colMeans, colSums
colMeans(x5)
rowMeans(x5)
rowMeans(x6, dims=2)
colSums(x5)
rowSums(x5)
colMeans(x6, dims=2)

#But for something more complicated...
apply(x5, 2, quantile, probs = c(0.25,0.75))
apply(x5, 1, quantile, probs = c(0.25,0.75))

#mapply----
#Apply a function with multiple sets of arguments
mapply(rep, 1:4, 4:1)
#Can I achieve this with lapply? NOPE!
lapply(1:4, rep, 4:1) #Wont work! You can see why we need mapply...  
#Another example
noise <- function(n , mean, sd){
  rnorm(n, mean, sd)
}
noise(5,5,2) 
noise(1:5, 1:5, 2) #Undesired output
mapply(noise, 1:5, 1:5, 2) #As expected

#tapply----
#Apply functions over a subset
x7 <- c(rnorm(10), runif(10), rnorm(10, 1))
f1 <- gl(3, 10)
f2
tapply(x7, f1, mean)
tapply(x7, f1, mean, simplify = F)
tapply(x7, f1, range)

#split----
#If tapply didn't apply functions...
split(x7, f1)
lapply(split(x7, f1), mean) #Same as line 72

#An example
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
apply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) #Gives a matrix
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))

#Multiple factors
x8 <- rnorm(1:10)
x8
f2 <- gl(2,5)
f2
f3 <- gl(5,2)
f3
interaction(f2,f3) #shows the 10 possible combination
split(x8, list(f2, f3)) #Can pass the interaction too
split(x8, list(f2, f3), drop=T) #To avoid empty levels

#vapply----
#Specify the output class
#I like to call it 'vigilant' apply
vapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]), matrix) #We make sure that it returns a vector
