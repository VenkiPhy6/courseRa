library(jsonlite)

#Reading----
jsonData <- fromJSON("https://api.github.com/users/venkiphy6/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login

#Writing----
myjson <- toJSON(iris, pretty=T)
cat(myjson)

#Read back
iris2 <- fromJSON(myjson)
head(iris2)
