#Dates and Times in R

#Creating--------
#Dates
x1 <- as.Date("1970-01-01") #Dates are stored as number of days from Jan 1, 1970.
class(x1)
unclass(x1)
unclass(as.Date("1970-01-02"))


#Times
x2 <- Sys.time()
x3 <- as.POSIXlt(x2)
x3
unclass(x3)
x3$sec
x4 <- as.POSIXct(x2) #Also works with x3. You can go to and fro both POSIXs...
x4
unclass(x4)
x4$sec #Wont work

datestring <- c("October 24, 1996", "January 30, 1997")
x5 <- strptime(datestring, "%B %d, %Y") #Coercing to POSIXlt
x5
class(x5)
(unclass(x5))
x5[1]$mday


#Arithmetic------
x6 <- as.Date("2012-02-28")
x7 <- as.Date("2012-03-01")
x7-x6 #Took care of leap year
x8 <- as.POSIXct("2012-02-28 05:00:00")
x9 <- as.POSIXct("2012-02-28 00:00:00", tz = "GMT")
x9-x8 #Took care of time zones

#Can't mix types in Arithmetic
x1 - x3 #Wont work
as.POSIXlt(x1) - x3
