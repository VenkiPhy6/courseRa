#Simulating data

#There are 4 prefixes for all distributions
#r - random number generation
#d - density
#p - cumulative distribution
#q - quantile function

#Some distros - norm, pois etc..
rbinom(100, 1, 0.7)
y1 <- rbinom(1, 100, 0.7)
replicate(100, rpois(5, 10))

#Linear model----
set.seed(20) #To reproduce the random numbers set a seed
x1 <- rnorm(100)
e1 <- rnorm(100, 0, 2)
y1 <- 0.5 + 2*x1 + e1
summary(y1)
plot(x1,y1)

set.seed(10)
x2 <- rbinom(100, 1, .5)
e2 <- rnorm(100, 0, 2)
y2 <- 0.5 + 2*x2 + e2
summary(y2)
plot(x2, y2)

#Random Sampling----
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(LETTERS)
sample(1:10)
sample(1:10)
sample(1:10, replace=T)
sample(c(0,1), size = 100, replace = T, prob = c(0.3, 0.7)) #Equivalent to y1
