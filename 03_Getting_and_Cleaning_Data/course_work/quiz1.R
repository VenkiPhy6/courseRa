#q1
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl1, destfile = 'idaho_housing_2006.csv', method='curl')
housing_data <- fread('idaho_housing_2006.csv')
str(housing_data)
housing_data[, .N, by=VAL]

#q3
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2, destfile ='gas_acquisition.xlsx', method='curl')
library(xlsx)
dat <- read.xlsx('gas_acquisition.xlsx', sheetIndex = 1, header = T, colIndex = 7:15, rowIndex = 18:23)
sum(dat$Zip*dat$Ext,na.rm=T)

#q4
library(XML)
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl3, destfile = 'baltimore_restaurants.xml', method = 'curl')
rest_xml <- xmlTreeParse('baltimore_restaurants.xml', useInternal = T) 
rootnode <- xmlRoot(rest_xml)
xmlName(rootnode)
zipcodes <- as.integer(xpathSApply(rootnode, "//zipcode", xmlValue))
length(which(21231 == zipcodes))