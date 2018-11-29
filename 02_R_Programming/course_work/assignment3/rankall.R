#Returns a data frame of hospital names in each state given a rank based on 30 Day mortality rates


rankall <- function(outcome, num = 'best'){
	#Supressing warnings by changing the value of 'warn' option
	oldw <- getOption('warn')
	options(warn = -1)
	
	#Reading data
	outcome_data <- read.csv('data/outcome-of-care-measures.csv', colClasses = 'character')
	
	#Handling invalid inputs
	if(!(outcome %in% c('heart attack', 'heart failure', 'pneumonia'))){
		stop("invalid outcome")
	}
	
	#Preparing the data
	outcome_data[,11] <- as.numeric(outcome_data[,11])
	outcome_data[,17] <- as.numeric(outcome_data[,17])
	outcome_data[,23] <- as.numeric(outcome_data[,23])
	split_by_state <- split(outcome_data, outcome_data$State)
	hospital = c()
	state = c()
	
	#Logic
	if(outcome == 'heart attack'){
		if(num == 'best'){
			for(i in split_by_state){
				i <- i[order(i[,11], i[,2]),]
				hospital = c(hospital, i[which.min(i[,11]),2])
				state = c(state, i[which.min(i[,11]), 'State'])
			}
			return(data.frame(hospital, state, row.names = state))	
		}else if(num == 'worst'){
			for(i in split_by_state){
				i <- i[order(i[,11], i[,2]),]
				hospital = c(hospital, i[which.max(i[,11]),2])
				state = c(state, i[which.max(i[,11]), 'State'])
			}
			return(data.frame(hospital, state, row.names = state))	
		}else{
			for(i in split_by_state){
				i <- i[order(i[,11], i[,2]),]
				hospital <- c(hospital, i[num, 2])
				state <- c(state, unique(i[,7]))
			}
			return(data.frame(hospital, state, row.names = state))		
		}
	}else if(outcome == 'heart failure'){
		if(num == 'best'){
			for(i in split_by_state){
				i <- i[order(i[,17], i[,2]),]
				hospital = c(hospital, i[which.min(i[,17]),2])
				state = c(state, i[which.min(i[,17]), 'State'])
			}
			return(data.frame(hospital, state, row.names = state))	
		}else if(num == 'worst'){
			for(i in split_by_state){
				i <- i[order(i[,17], i[,2]),]
				hospital = c(hospital, i[which.max(i[,17]),2])
				state = c(state, i[which.max(i[,17]), 'State'])
			}
			return(data.frame(hospital, state, row.names = state))	
		}else{
			for(i in split_by_state){
				i <- i[order(i[,17], i[,2]),]
				hospital <- c(hospital, i[num, 2])
				state <- c(state, unique(i[,7]))
			}
			return(data.frame(hospital, state, row.names = state))		
		}
	}else if(outcome == 'pneumonia'){
		if(num == 'best'){
			for(i in split_by_state){
				i <- i[order(i[,23], i[,2]),]
				hospital = c(hospital, i[which.min(i[,23]),2])
				state = c(state, i[which.min(i[,23]), 'State'])
			}
			return(data.frame(hospital, state, row.names = state))	
		}else if(num == 'worst'){
			for(i in split_by_state){
				i <- i[order(i[,23], i[,2]),]
				hospital = c(hospital, i[which.max(i[,23]),2])
				state = c(state, i[which.max(i[,23]), 'State'])
			}
			return(data.frame(hospital, state, row.names = state))	
		}else{
			for(i in split_by_state){
				i <- i[order(i[,23], i[,2]),]
				hospital <- c(hospital, i[num, 2])
				state <- c(state, unique(i[,7]))
			}
			return(data.frame(hospital, state, row.names = state))	
		}
	}
	#Reverting 'warn' option to its old state, just for safety
	options(warn = oldw)
}