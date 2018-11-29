#Functions

#Syntax----
computeMean <- function(x, removeNA = T){ #Specifying default arguments here
  vec <- rep(0, times=ncol(x))
  for(i in seq_len(ncol(x))){
    vec[i] <- mean(x[,i], na.rm = removeNA)
  }
  vec #Whatever is at last is the return value!
}

#Lazy evalutation: R doesn't care about an argument if you don't use it in the function.
lazy1 <- function(a, b){
  print(a)
}
lazy1(10) #Expected to cause an error but it wont..

lazy2 <- function(a, b){
  print(a)
  print(b)
}
lazy2(10) #Throws an error but even now first line gets evaluated

#Variable number of arguments
myplot <- function(x, y, type='l', ...){ #Except for x, y and 'type' everything else is just copied
  plot(x, y, type = type, ...)
}
args(paste) #Output shows ... since you can give a variable number of arguments
args(cat)
sep("my", "cat", se=":") #Partial matching won't work for arguments that come after :

#Defining new operators!!
"%p%" <- function(string1, string2){ # Remember to add arguments!
  paste(string1, string2, split="")
}


#Function calls----
vect1 <- computeMean(airquality, F)
vect2 <- computeMean(airquality)
vect3 <- computeMean(removeNA = F, x = airquality) #Order doesn't matter when you give names.
vect4 <- computeMean(removeNA = F, airquality) #unnamed value gets assigned to the 1st unassigned formal
vect5 <- computeMean(r = F, airquality) #Partial matching
vect1
vect2
vect3
vect4
vect5
"I" %p% "am" %p% "Venki"


#Functions on functions----
class(computeMean)
args(computeMean)
str(computeMean)
formals(computeMean)