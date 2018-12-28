
#Getting the file----
URL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(URL, destfile = './data/restaurants.csv', method = 'curl')
restData <- read.csv('./data/restaurants.csv')

#Looking at the data----
head(restData, n=3)
tail(restData, n=3)

#Understanding the data----
summary(restData) #Note the negative zip code!
str(restData)
quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, probs=c(0.5,0.75,0.9))
table(restData$zipCode, useNA='ifany') #Give useNA so that table shows number of NA if there is/are any.
table(restData$councilDistrict, restData$zipCode)
table(restData$zipCode %in% c(21212))
table(restData$zipCode %in% c(21212,21213))
#Subsetting based on our understanding
restData[restData$zipCode %in% c(21212,21213), ]

#Check for missing/absurd values----
sum(is.na(restData$zipCode))
any(is.na(restData$zipCode))
all(restData$zipCode >0) #There is a negative zip code! 
#Checking all the columns at once
colSums(is.na(restData)) 
all(colSums(is.na(restData)) == 0)

#Cross tables----
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
head(DF)
str(DF)
DF
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

#Flat tables----
?warpbreaks
head(warpbreaks)
warpbreaks$replicate <- rep(1:9, len = 54)
head(warpbreaks)
#This is going to look ugly
xt1 <- xtabs(breaks ~., data=warpbreaks)
xt1
#Instead we create flat tables
ftable(xt1)

#Size of dataset----
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units='Mb')