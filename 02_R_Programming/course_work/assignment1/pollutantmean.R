pollutantmean <- function(directory, pollutant, id = 1:332){
  pollutant_data <- c()
  for(i in id){
    path <- paste(directory, '/' ,sprintf("%03d",i), '.csv', sep="")
    #print(path)
    monitor_data <- as.data.frame(read.csv(path))
    pollutant_data <- c(pollutant_data, monitor_data[[pollutant]])
  }
  mean(pollutant_data, na.rm = T)
}