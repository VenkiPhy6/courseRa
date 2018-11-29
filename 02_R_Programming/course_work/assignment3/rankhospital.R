##Returns the name of the hospital of a given rank in a given state with respect to 30-day mortality rate for a given condition

rankhospital <- function(state, outcome, num = 'best'){
	#Supressing warnings by changing the value of 'warn' option
	oldw <- getOption('warn')
	options(warn = -1)
	
	#Reading data
	outcome_data <- read.csv('data/outcome-of-care-measures.csv', colClasses = 'character')
	
	#Handling invalid inputs
	if(!(state %in% outcome_data$State)){
		stop("invalid state")
	}
	if(!(outcome %in% c('heart attack', 'heart failure', 'pneumonia'))){
		stop("invalid outcome")
	}
	
	#Preparing the data
	outcome_data[,11] <- as.numeric(outcome_data[,11])
	outcome_data[,17] <- as.numeric(outcome_data[,17])
	outcome_data[,23] <- as.numeric(outcome_data[,23])
	split_by_state <- split(outcome_data, outcome_data[,'State'])
	
	#Logic
	if(outcome == 'heart attack'){
		split_by_state[[state]] <- split_by_state[[state]][order(split_by_state[[state]][,11], split_by_state[[state]][,2]), ] #Sorting for tie breaks
		if(num == 'best'){
			return(split_by_state[[state]][which.min(split_by_state[[state]][,11]),2])
		}else if(num == 'worst'){
			return(split_by_state[[state]][which.max(split_by_state[[state]][,11]),2])
		}else{
			split_by_state[[state]] <- split_by_state[[state]][order(split_by_state[[state]][,11], split_by_state[[state]][,2]),]
			return(split_by_state[[state]][num, 2])	
		}
	}else if(outcome == 'heart failure'){
		split_by_state[[state]] <- split_by_state[[state]][order(split_by_state[[state]][,17], split_by_state[[state]][,2]), ] #Sorting for tie breaks
		if(num == 'best'){
			return(split_by_state[[state]][which.min(split_by_state[[state]][,17]),2])
		}else if(num == 'worst'){
			return(split_by_state[[state]][which.max(split_by_state[[state]][,17]),2])	
		}else{
			split_by_state[[state]] <- split_by_state[[state]][order(split_by_state[[state]][,17], split_by_state[[state]][,2]),]
			return(split_by_state[[state]][num, 2])	
		}
	}else if(outcome == 'pneumonia'){
		split_by_state[[state]] <- split_by_state[[state]][order(split_by_state[[state]][,23], split_by_state[[state]][,2]), ] #Sorting for tie breaks
		if(num == 'best'){
			return(split_by_state[[state]][which.min(split_by_state[[state]][,23]),2])
		}else if(num=='worst'){
			return(split_by_state[[state]][which.max(split_by_state[[state]][,23]),2])
		}else{
			split_by_state[[state]] <- split_by_state[[state]][order(split_by_state[[state]][,23], split_by_state[[state]][,2]),]
			return(split_by_state[[state]][num, 2])	
		}
	}
	
	#Reverting 'warn' option to its old state, just for safety
	options(warn = oldw)
}