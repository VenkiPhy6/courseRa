#Also see https://github.com/VenkiPhy6/courses/blob/master/03_GettingData/02_05_readingFromOtherSources/index.md
library(foreign)

#-----------------------------
#STATA files

#Downloading-----
if(!file.exists('data')){
  dir.create('data')
}
fileUrl <- "http://cameron.econ.ucdavis.edu/stata/carsdata.dta"
download.file(fileUrl, destfile = './data/carsdata.dta', method = 'curl')

carsdata <- read.dta('./data/carsdata.dta')
tail(carsdata)

#-----------------------------
#SPSS files
#My data is available to download in a zip file. So I am using to opportunity to
#learn how to unzip a file in R!

#Downloading and unzipping-----
if(!file.exists('data')){
  dir.create('data')
}
fileUrl <- "http://spss.allenandunwin.com.s3-website-ap-southeast-2.amazonaws.com/Files/survey.zip"
download.file(fileUrl, destfile = './data/survey.zip', method = 'curl')
#See https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/unzip for more on unzip
unzip(zipfile = './data/survey.zip', exdir = './data') #You should not have a trailing '/' in exdir!

survey <- read.spss('./data/survey.sav', to.data.frame = T)
survey