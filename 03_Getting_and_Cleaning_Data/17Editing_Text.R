#TRY TO FOLLOW THESE RULES
# - Names of variables should be
#     + All lower case when possible
#     + Descriptive (Diagnosis versus Dx)
#     + Not duplicated
#     + Not have underscores or dots or white spaces
# - Variables with character values
#     + Should usually be made into factor variables (depends on application)
#     + Should be descriptive (use TRUE/FALSE instead of 0/1 and Male/Female versus 0/1 or M/F)


#Editing textual variable names----
#Changing case
cameraData <- read.csv('./data/cameras.csv')
names(cameraData)
tolower(names(cameraData))
toupper(names(cameraData))
#Splitting
splitNames = strsplit(names(cameraData), "\\.")
splitNames
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)
#Substituting
reviews <- read.csv('./data/reviews.csv')
solutions <- read.csv('./data/solutions.csv')
names(reviews)
sub("_","", names(reviews))
testData <- "This_is_my_test" #But this only subs the first occurence as seen
sub("_","",testData)
gsub("_","",testData) #This does it for all occurences

#Editing textual values----
#Searching
grep("Alameda", cameraData$intersection)
grepl("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
cameraData2
grep("Alameda", cameraData$intersection, value = TRUE)
grep("VenkiStreet", cameraData$intersection) #If it is 0 and you got the column name right then you can be sure that the given value isn't there in that column

#General String functions----
nchar("VenkiPhy6")
substr("VenkiPhy6", 3,6)
paste("Venki", "Phy6", sep="") #Default sep is whitespace
paste0("Venki","Phy6") #no need to mention sep
library(stringr) #Useful library
stringr::str_trim("Venk      ")