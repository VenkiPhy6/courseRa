#BE CAREFUL. It is illegal to scrape some websites! 

#Learn more
#1. R Bloggers tutorials - 
#2. httr documentation from CRAN - https://cran.r-project.org/web/packages/httr/httr.pdf

url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
con = url(url)
htmlCode = readLines(con)
close(con)
htmlCode #This looks ugly and unreadable. So parse with XML package. See "03xml_files.R"

#Using XML package----
library(XML)
html <- htmlTreeParse(htmlCode, useInternalNodes = T)
xpathSApply(html, '//title', xmlValue)

#Using httr package----
library(httr)
html2 = GET(url)
content2 = content(html2, as='text')
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)
#Authenticating with httr package
pg1 = GET("http://httpbin.org/basic-auth/user/passwd") #Won't have anything useful
pg1
pg2= GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "passwd"))
pg2
names(pg2)
#Using handles
google = handle("http://google.com")
pg1 = GET(handle = google, path = "/")
pg2 = GET(handle = google, path="search")
pg1
pg2