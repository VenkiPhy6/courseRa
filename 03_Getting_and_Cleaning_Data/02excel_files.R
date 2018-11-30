library(xlsx) #Other packages like XLConnect can also be useful

#Downlading-----
if(!file.exists('data')){
  dir.create('data')
}

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = './data/cameras.xlsx', method = 'curl')
list.files('data')

dateDownloaded <- date()
dateDownloaded

#Reading----
#It doesn't work because file seems corrupted... maybe url is invalid?

cameraData1 <- read.xlsx('./data/cameras.xlsx', sheetIndex = 1, header = T)
head(cameraData1)

#Reading subsets
colIndex <- 1:3
rowIndex <- 2:4
cameraData2 <- read.xlsx('./data/cameras.xlsx', sheetIndex = 1, header = T, colIndex = colIndex, rowIndex = rowIndex)
head(cameraData2)