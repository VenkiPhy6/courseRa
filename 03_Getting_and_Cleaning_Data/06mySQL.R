##BE VERY CAREFUL. YOU SHOULD (MOSTLY) JUST ACCESS STUFF FROM A DATABASE AND NOT EDIT IT!
##Useful links:
#1. RMySQL vignette: http://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf
#2. MySQL commands: https://www.pantz.org/software/mysql/mysqlcommands.html
#3. RMySQL commands: https://www.r-bloggers.com/mysql-and-r/


#A MySQL Server has many MySQL Databases and each Database has many tables

library(RMySQL)

#Accessing all Databases in the Server----
ucscDb <- dbConnect(MySQL(), user='genome', host="genome-mysql.soe.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb) #Always close the connection!
result

#Accessing all the tables in a database----
hg19 <- dbConnect(MySQL(), user='genome', db = 'hg19', host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

#Accessing the fields in a table----
dbListFields(hg19, "affyU133Plus2")

dbGetQuery(hg19, "select count(*) from affyU133Plus2") #Count the records

#Creating a Data Frame out of a DB table----
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

#Subsetting via Queries----
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3") #Can send any SQL query
affyMis <- fetch(query) #fetch the data from the query
quantile(affyMis$misMatches) #Check if you got what you wanted
affyMisSmall <- fetch(query, n=10) #Subset the query itself  
dbClearResult(query) #'Disconnect' the query

#Close----
dbDisconnect(hg19)