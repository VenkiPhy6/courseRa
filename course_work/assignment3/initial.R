#Learning more about the data
outcome <- read.csv('data/outcome-of-care-measures.csv', colClasses = 'character')
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
head(outcome[, 11])
hist(outcome[, 11]) #Plotting the 30 Day Death Rate
factor(outcome$State)
factor(outcome)
a <- outcome$State
tapply(outcome, factor(outcome$State))
outcome[, 'State'] <- as.factor(outcome[, 'State'])
str(outcome)
"AL" %in% outcome$State
min(outcome_data[,11])
?min
?which
which(LETTERS == 'R')
?order
