#Learn more:
#1. https://www.statmethods.net/management/merging.html
#2. http://plyr.had.co.nz/
#3. https://en.wikipedia.org/wiki/Join_(SQL)
#4. Look at dplyr vignette by H. Wickham and Francois


library(plyr)
library(dplyr) #ALWAYS LOAD plyr BEFORE dplyr
chicago <- readRDS('./data/chicago.rds')
#Bring the data into tbl_df format instead. It prints better in the console!
chicago <- tbl_df(chicago)
dim(chicago)
str(chicago)
names(chicago)

#dplyr::select---- To select certain columns in a particular order
head(select(chicago, city:dptp)) #Note how we use column names without quotes
head(select(chicago, -(city:dptp))) #Dropping columns here

#dplyr::filter---- To select certain rows
head(filter(chicago, pm25tmean2 > 30))
head(filter(chicago, pm25tmean2 > 30 & tmpd > 80))
head(filter(chicago, pm25tmean2 > 30, tmpd > 80)) #Multiple conditions

#dplyr::arrange---- To order rows in a certain way
head(arrange(chicago, date))
head(arrange(chicago, desc(date)))

#dplyr::rename----
chic1 <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
names(chic1)
head(chic1)
tail(chic1)

#dplyr::mutate----
chic2 <- mutate(chic1, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(select(chic2, pm25, pm25detrend))
tail(select(chic2, pm25, pm25detrend))
#We can even use the new variable created to create another new variable in the same line of code!
chic2 <- mutate(chic1, pm25detrend = pm25 - mean(pm25, na.rm = TRUE), pm25detrendsqr = pm25detrend^2)

#dplyr::group_by and dplyr::summarize---- Group rows and summarize each group
chic3 <- mutate(chic1, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot")))
head(chic3)
hotcold <- group_by(chic3, tempcat)
hotcold
#Note that the summarize comands that follow show data by groups 
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
chic4 <- mutate(chic1, year = as.POSIXlt(date)$year + 1900)
time_series <- group_by(chic4, year)
summarize(time_series, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

#Chaining/Piping operations using pipes----
chic1 %>% mutate(months = as.POSIXlt(date)$mon + 1) %>% group_by(months) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

#base::merge----
#Getting the data
fileUrl1 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
fileUrl2 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"
download.file(fileUrl1, './data/reviews.csv', method = 'curl')
download.file(fileUrl2, './data/solutions.csv', method = 'curl')
solutions <- read.csv('./data/solutions.csv')
reviews <- read.csv('./data/reviews.csv')
head(reviews,2)
head(solutions,2)
names(reviews)
names(solutions)
#Merging
mergedData1 = merge(reviews, solutions, by.x = 'solution_id', by.y='id', all=TRUE)
head(mergedData1)
mergedData2 = merge(reviews, solutions, all=TRUE) #Merges by all the columns with same name
head(mergedData2)
intersect(names(reviews), names(solutions)) #These are the columns by which default merge is done

#plyr::join----
#You can ONLY merge by common column names here. But it is a lot faster than base::merge.
df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1, df2), id)

#plyr::join_all----
df3 = data.frame(id=sample(1:10), z=rnorm(10))
dfList = list(df1, df2, df3)
arrange(join_all(dfList), id)
