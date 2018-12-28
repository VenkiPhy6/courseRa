#Question 1
idaho_housing <- read.csv('./data/idaho_housing.csv')
names(idaho_housing)
strsplit(names(idaho_housing), "wgtp")

#Question 2
gdp <- read.csv('./data/gdp - Copy.csv', stringsAsFactors = FALSE)
head(gdp)
str(gdp)
gdp[,5] <- gsub(",","",gdp[,5])
head(gdp)
str(gdp)
gdp[,5] <- as.numeric(gdp[,5])
mean(gdp$millions.of.US.dollars, na.rm=TRUE)

#Question 3
grep("^United", gdp$Long.Name, value = TRUE)

#Question 4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "./data/edu2.csv")
edu <- read.csv('./data/edu2.csv', stringsAsFactors = FALSE)
str(edu)
library(plyr)
library(dplyr)
mergedData1 <- merge(gdp, edu, by.x = "CountryCode", by.y = "CountryCode", all = TRUE)
str(mergedData1)
head(mergedData1)
mergedData1[, "Special.Notes"]
class(mergedData1[, "Special.Notes"])
x <- as.vector(mergedData1[, "Special.Notes"])
x
grep("^Fiscal.*June", mergedData1$Special.Notes, value = TRUE)
length(grep("^Fiscal.*June", mergedData1$Special.Notes, value = TRUE))

#Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
head(amzn)
sampleTimes = ymd(index(amzn))
head(sampleTimes)
sampleTimes[year(sampleTimes) == 2012]
length(sampleTimes[year(sampleTimes) == 2012])
sampleTimes[year(sampleTimes) == 2012 & day(sampleTimes) == 2]
length(sampleTimes[year(sampleTimes) == 2012 & wday(sampleTimes, label=TRUE) == 'Mon'])
