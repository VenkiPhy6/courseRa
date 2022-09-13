##YOU NEED TO LEARN "XPath" TO REALLY BE ABLE TO READ XML FILES
##See:
##1. http://www.omegahat.net/RSXML/shortIntro.pdf
##2. http://www.omegahat.net/RSXML/Tour.pdf
##3. https://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf

library(XML)

#Downloading----
fileUrl1 <- "https://www.w3schools.com/xml/simple.xml"
download.file(fileUrl1, destfile = './data/simple.xml', method = 'curl')

#Reading----
doc1 <- xmlTreeParse('./data/simple.xml', useInternal = T)
rootNode1 <- xmlRoot(doc1)
xmlName(rootNode1)
names(rootNode1)
rootNode1[[1]]
rootNode1[[1]][[1]]
xmlSApply(rootNode1, xmlValue)

#Some example commands
xpathSApply(rootNode1, "//name", xmlValue)
xpathSApply(rootNode1, "//price", xmlValue)

#A more complicated example
fileUrl2 <- "http://www.espn.in/nfl/team/_/name/bal/baltimore-ravens"
download.file(fileUrl2, destfile = './data/baltimore-ravens.html', method = 'curl')
library(XML)
doc2 <- htmlTreeParse('./data/baltimore-ravens.html', useInternal = T)
##Doesn't quite work but I get the idea...
scores <- xpathSApply(doc2, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc2, "//li[@class='team-name']", xmlValue)
scores
teams
