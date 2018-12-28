#Learn more:
#1. Reshaping - https://www.statmethods.net/management/reshape.html
#2. https://www.r-bloggers.com/a-quick-primer-on-split-apply-combine-problems/
#3. plyr tutorial - http://plyr.had.co.nz/09-user/
#4. Also see - acast, mutate, arrange
#5. reshape tutorial - https://www.slideshare.net/jeffreybreen/reshaping-data-in-r

library(reshape2)

#melting a dataset----
head(mtcars)
?melt
mtcars$carname <- rownames(mtcars)
head(mtcars)
carMelt <- melt(mtcars, id = c('carname','gear','cyl'), measure.vars = c("mpg",'hp'))
head(carMelt)
carMelt

#Casting a dataset----
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable, mean) #we can see mean by factors
cylData

#Split-Apply-Combine----
?InsectSprays
head(InsectSprays)
tail(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum) #Quick way
#A more explicit way
spIns = split(InsectSprays$count, InsectSprays$spray) #Split
spIns
sprCount <- lapply(spIns, sum) #Apply
unlist(sprCount) #Combine
sapply(spIns, sum) #Another alternative to tapply

#plyr package
library(plyr)
ddply(InsectSprays, .(spray), summarize, sum=sum(count))
spraySums <- ddply(InsectSprays, .(spray), summarize, sum=ave(count, FUN=sum))
dim(spraySums)
head(spraySums)