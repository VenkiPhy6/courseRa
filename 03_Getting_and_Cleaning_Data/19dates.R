#Learn more:
#1. Lubridate tutorial - https://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/
#2. Lubridate vignette - https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html


#Formatting----
d2 = Sys.Date()
class(d2)
d2
format(d2, "%a %b %d")
#%d = day as number (0-31), %a = abbreviated weekday,%A = unabbreviated weekday, %m = month (00-12), %b = abbreviated month, %B = unabbrevidated month, %y = 2 digit year, %Y = four digit year
x = c("1jan1960","2jan1960","31mar1960","30jul1960")
z = as.Date(x, "%d%b%Y")
z
z[1]-z[2]
class(z[1]-z[2])

#Converting----
as.numeric(z[1]-z[2])
weekdays(d2)
months(d2)
julian(d2) #Shows origin

#lubridate----
library(lubridate) #A damn clever package
ymd(20181228)
mdy(12282018)
mdy("12282018")
mdy("12/28/2018")
class(mdy("12/28/2018"))
ymd_hms("2018-12-28 10:47:10")
Sys.timezone()
ymd_hms("2018-12-28 10:47:10", tz="Asia/Calcutta")
wday("2018-12-28 10:47:10") #Using wday instead of weekday 
wday("2018-12-28 10:47:10", label=TRUE)
