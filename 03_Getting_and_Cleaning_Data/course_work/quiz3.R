#Question 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "./data/idaho_housing.csv")
idaho_housing <- read.csv('./data/idaho_housing.csv')
str(idaho_housing)
which(idaho_housing$ACR == 3 & idaho_housing$AGS == 6)

#Question 2
library(jpeg)
img_array <- readJPEG("./data/jeff.jpg", native=TRUE)
quantile(img_array, probs = c(.3, .8))

#Question 3
library(plyr)
library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "./data/gdp.csv")
gdp <- read.csv("./data/gdp - Copy.csv", quote = "\"", stringsAsFactors = FALSE)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "./data/edu.csv")
edu <- read.csv("./data/edu.csv", stringsAsFactors = FALSE)

head(gdp)
tail(gdp)
str(gdp)
head(edu,3)
tail(edu)
str(edu)
eduCode <- as.factor(edu$CountryCode)
gdpCode <- as.factor(gdp$CountryCode)
match_count1 <- sum(eduCode %in% gdpCode)
match_count2 <- sum(gdpCode %in% eduCode)
match_count1
match_count2

mergedData1 = merge(gdp, edu, by.x ="CountryCode", by.y = "CountryCode", all=TRUE)
head(mergedData1)
str(mergedData1)
sum(is.na(mergedData1$Ranking))
arrange(mergedData1, desc(Ranking))[13,]

#Question 4
mergedData1[,"Income.Group"] <- as.factor(mergedData1$Income.Group)
incomeLevels <- mergedData1[,"Income.Group"]
levels(incomeLevels)
mergedData2 <- group_by(mergedData1, Income.Group)
mergedData2[,"Income.Group"]
summarize(mergedData2, aveGDP = mean(Ranking, na.rm = TRUE))

#Question 5
quantile(mergedData1$Ranking, na.rm = TRUE)
tab <- table(mergedData1$Ranking, mergedData1$Income.Group)
sum(tab[1:38,"Lower middle income"])
