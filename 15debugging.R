#Debugging in R
#DEBUGGING IS NOT A SUBSTITUTE 
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
printMessage1(NA) #Error
printMessage1(NaN) #Error
printMessage1(x1) #Error

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

#Tools----
# 1. traceback
# 2. debug
# 3. browser
# 4. trace
# 5. recover
mean(x)
traceback() #Error at he top level itself
lm(y~x)
traceback() #Error is at a much deeper level

debug(lm)
lm(y~x) #Keep entering 'n' until you reach the line with the error

options(error = recover)
read.csv("nosuchfile")
