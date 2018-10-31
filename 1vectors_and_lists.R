#See Week 1 in JHU course - R Programming
#Data Types - Vectors and Lists

#Creating various class of Vectors----
#vector <- an atomic class of elements
x1 <- c(1,2,3,4) #numeric
x2 <- 1:4 #integer
x3 <- c(1+4i, 3+9i) #complex
x4 <- c(T, F) #logical
x5 <- c(TRUE, FALSE, TRUE) #logical
x6 <- c("a", "b", "c") #character

x7 <- vector("numeric", length=10)
x7
x8 <- vector("character", length=6)
x8
x9 <- vector("logical", length=3)
x9

names(x1) <- x6 #Naming a vector's element
x1
x1['c']

#Implicit coercion----
#A vector of different class types will get "coerced" to the least common denominator
y1 <- c('a', 10, T)
class(y1)
y2 <- c(10, T)
class(y2)
y2
y3 <- c(10, 3+4i)
class(y3)
y4 <- c(10L, 3)
class(y4)
y4
#character < complex < numeric < integer < logical. If a lower one is in the vector that will be its type

#Explicit coercion----
as.integer(x1)
as.character(x1)
as.complex(x1)
as.logical(x1)
as.character(x5)
as.integer(x5)
as.numeric(x5)
as.complex(x5)
as.integer(x6) #Cant do that!
as.numeric(x6) #Cant do that!
as.complex(x6) #Cant do that!
as.logical(x6)         #That works?!
z1 <- c(1.9, 3.6)
as.integer(z1) #Truncates

#Creating list----
a1 <- list('venki', T, 5.3, 9L, 7+1.3i) #list of different classes
a1
#list of lists
a2 <- list(list('venki', 'ani'), list(T, 'b'), list(5.3, 6L), list(1L, 4+2i), list(7+1.3i, 9+5i))
a2
#list of vectors. Also see that implicit coercion works like a charm.
a3 <- list(c('venki', 'ani'), c(T, 'b'), c(5.3, 6L), c(1L, 4+2i), c(7+1.3i, 9+5i))
a3

names(a1) <- x6 #Naming a list's elements
a1
a1['a']
