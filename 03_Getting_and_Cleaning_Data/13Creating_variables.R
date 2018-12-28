#Learn more:
#1. Jaffe's notes - http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf
#2. List of transformations - https://www.statmethods.net/management/functions.html
#3. plyr tutorial - http://plyr.had.co.nz/09-user/

# We are using the restaurant data set which can be downloaded with the code below:
# URL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
# download.file(URL, destfile = './data/restaurants.csv', method = 'curl')

restData <- read.csv('./data/restaurants.csv')

#Digression - Creating sequences----
(s1 <- seq(1, 10, by=2))
(s2 <- seq(1, 10, length=3))
(x <- rnorm(5))
seq(along = x)

#Using variables for subsetting----
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

#Creating binary variables----
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

#Creating categorical variables----
restData$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
head(restData)
table(restData$zipGroups, restData$zipCode)
#Another way to achieve the same thing
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4) #Note that this actually produces factors
table(restData$zipGroups)

#Creating factor variables----
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)
#Playing more with factors
yesno <- sample(c('yes','no'), size=10, replace=TRUE)
yesnofac = factor(yesno, levels = c('yes','no'))
yesno
yesnofac
relevel(yesnofac, ref = 'no')
as.numeric(yesnofac)