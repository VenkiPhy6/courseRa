#See Week 1 in JHU course - R Programming
#Data Types - Vectors and Lists

#A number is a vector in R----
a1 <- c(10,20,30,40)
a1 *2 + 100 #This command is interpreted by R as a1 * c(2,2,2,2) + c(100,100,100,100). It recycles!
a1 * c(11,12,13) #The recycling behaviour is clearly seen here.


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
#character < complex < numeric < integer < logical. 
#If a lower one is in the vector that will be its type


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


#Subsetting a vector----
x6[2] #Numeric indices
x6[4] #Doesnt throw an error. Just says NA!
x6[1:3]
x6[x6 < 'c'] #Logical indices
u <- x6 > 'a' #We did Masking by just assigned a condition to a variable...
u
x6[u]

names(x1) <- c('hi', 'whatup', 'hey') #Subsetting with name
x1['hi'] 
u <- 'hi'
x1[u]
x1$hi #'$ operator invalid for atomic vectors'
x1[['wh', exact=F]] #Partial matching with double braces. Since dollar doesn't work.  

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


#Subsetting a list----
names(a2) <- c('names', 'truth', 'numbers')
a2
a2[1] #Single bracket returns same class object as that being indexed. So index a list you get a list
a2[5]
a2['names']
a2[[2]] #Double bracket may not return same class object as being indexed. So list returns vector...
a2[[3]]
a2[['names']]
a2[['truth']]
a2$names #Same semantics as Double bracket except you don't have to pass a string for named elements
a2$numbers
a2[[names]] #Wont work
d <- 'names' #If index is to be computed $ can't be used
a2[[d]]
a2$d #Wont work properly
a2$names
a2[[4]][[1]] #Recurse into a list
a2[[c(5,2)]]
a2[c(3,2)] #Can't Recurse with this. But can get multiple elements simultaneously.

#Partial matching
a3 = list(aardvark = 1:10, batwalk = 11:20, aarachnid = 15:30)
a3$aara
a3$b
a3[["aard"]] #Double braces dont do partial matching... by default.
a3[["b"]]
a3[["aard", exact=F]] 
a3[["b", exact=F]] 
