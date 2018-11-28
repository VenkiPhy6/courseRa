#Debugging in R
#There are three generic conditions - Message, Warning, Error

x1 <- log(-1) #Warning

printMessage1 <- function(x){
  if(x>0)
    print("x is greater than 0")
  else
    print("x is less than 0")
  invisible(x)
}
printMessage1(-5)
printMessage1(1)
printMessage1(NA) #Fails
printMessage1(NaN) #Fails
printMessage1(x1) #Fails

#Debugging...
printMessage2 <- function(x){
  if(is.na(x))
    print("x is invalid")
  else if(x>0)
    print("x is greater than 0")
  else
    print("x is less than 0")
  invisible(x)
}
printMessage2(NA) #Works!
printMessage2(NaN) #Works!
printMessage2(x1) #Works!
