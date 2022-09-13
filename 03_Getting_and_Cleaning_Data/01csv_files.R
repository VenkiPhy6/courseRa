#Downlading-----
if(!file.exists('data')){
  dir.create('data')
}

#This url won't work anymore
#fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
#download.file(fileUrl, destfile = './data/cameras.csv', method = 'curl') #Learn more about curl
#list.files('./data')

dateDownloaded <- date() #Files change with time. So if someone has to reproduce they should know the date
#dateDownloaded 


#Reading-----
cameraData1 <- read.table('./data/cameras.csv', sep=',', header=T)
head(cameraData1)
#Other arguments: na.strings, nrows, skip

cameraData2 <- read.csv('./data/cameras.csv')
head(cameraData2)

##A usual problem is when there are ' or " in the data. In this case set quote = ""