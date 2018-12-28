#Learn more:
#1. Lubridate tutorial - https://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/
#2. Lubridate vignette - https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html
#3. List of time zones - http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

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
help(package = lubridate) #Learn more

#Basics of dates
this_day <- today()
year(this_day)
month(this_day)
day(this_day)
wday("2018-12-28 10:47:10") #Using wday instead of weekday from base R 
wday("2018-12-28 10:47:10", label=TRUE)

#Basics of date-times
this_moment <- now()
hour(this_moment)
minute(this_moment)
second(this_moment)

#Reading dates and date-times and times
ymd(20181228)
ymd("1989 May 17")
mdy(12282018)
dmy(25081985)
mdy("12282018")
mdy("12/28/2018")
mdy("March 12, 1975")
class(mdy("12/28/2018"))
ymd("192012") #Broke it!
ymd("1920/1/2") #Giving it more info
ymd_hms("2018-12-28 10:47:10")
Sys.timezone() 
#List of time zones - http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
ymd_hms("2018-12-28 10:47:10", tz="Asia/Calcutta")
hms("03:22:14")
#vectors
dt <- c("2014-05-14", "2014-09-22", "2014-07-11")
ymd(dt)

#Updating
update(this_moment, hours = 8, minutes = 34, seconds = 55)
this_moment #Doesn't update unless assignment
this_moment
now()
this_moment <- update(this_moment, hours = 11, minutes = 15,seconds = 21)
this_moment

#Arithmetic
nyc <- now(tzone = "America/New_York")
nyc
depart <- nyc + days(2)
depart
depart <- update(depart, hours = 17, minutes = 34)
depart
arrive <- depart + hours(15) + minutes(50)
?with_tz
arrive <- with_tz(arrive, tzone = "Asia/Hong_Kong")
arrive
last_time <- mdy("June 17, 2008", tz = "Singapore")
last_time
?interval
how_long <- interval(last_time, arrive)
as.period(how_long)