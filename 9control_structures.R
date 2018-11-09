#Control structures

#if-else----
x1 <- 15
if(x < 3){
  y1 <- 3
} else if(x<10){
  y1<-10
} else{
  y1<- x1
}
y
#Doing the same thing in a different way
z1 <- if(x1 < 3){
   3
} else if(x1<10){
  10
} else{
  x1
}
z1

#for loop----
for(i in 1:10){ #Basic implementation
  print(i)
}

#same thing in 4 ways
x2 <- c('a', 'b', 'c', 'd') 
for(i in seq_along(x2)){ 
  print(x[i])
}
for(i in x2){ #control variable can just loop through a vector's members
  print(i)
}
for(letters in x2){ #Who said anything special about i!
  print(letters)
}
for(i in 1:4) print(x[i]) #For single expression no need of braces

#Nesting
x3 <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x3))){
  for(j in seq_len(ncol(x3))){
    print(x3[i, j])
  }
}

#while loop----
count <- 0
while(count <3){
  print(count)
  count <- count + 1
}
z <- 5
#Will this loop end? Be careful in such cases!
while(z>=3 && z <=10){
  print(z)
  coin <- rbinom(1, 1, .5)
  if(coin==1){
    z <- z + 1
  } else {
    z <- z - 1
  }
}

#Also usefl - repeat, break, next