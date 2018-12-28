#Question 1
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github", key = "dfdb3ccb6ac7ca59c8a4", secret = "743c9d0054a61ea7abc7bcbda65a33b9201ebbcd")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
pg <- content(req)

pdDF <- jsonlite::fromJSON(jsonlite::toJSON(pg))
pdDF
names(pdDF)
pdDF['name']
pdDF[16, 'created_at']

#Question 2
library(sqldf)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url = fileURL, destfile = "./data/acs.csv", method = 'curl')
acs <- read.csv("./data/acs.csv")
names(acs)
head(acs)
class(acs)
?acs
str(acs)

#Question 4
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
con_url <- url(url)
raw_html <- readLines(con_url)
close(con_url)
paste(nchar(raw_html[10]), nchar(raw_html[20]), nchar(raw_html[30]), nchar(raw_html[100]))

#Question 5
?read.fwf
file <- read.fwf(file = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"), skip = 4, widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4))
head(file)
summary(file)
sum(file['V9'])
