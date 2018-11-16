complete <- function(directory, iden){
  id <- rep(0, length(iden))
  nobs <- rep(0, length(iden))
  completion_data <- data.frame(id, nobs)
  for(j in iden){
    path <- paste(directory, '/', sprintf("%03d",j), '.csv', sep="")
    monitor_data <- read.csv(path)
    completion_data[which(j==iden), 1] <- j
    completion_data[which(j==iden), 2] <- sum(complete.cases(monitor_data))
  }
  completion_data
}