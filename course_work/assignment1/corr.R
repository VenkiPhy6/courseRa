corr <- function(directory, threshold = 0){
  directory_path <- paste("D:/Data_Science_related/rWork/rProjects/courseRa/course_work/assignment1", "/", directory, sep="")
  files = dir(directory_path)
  corr_values = c()
  complete_obs_count <- complete(directory, 1:length(files))
  for(i in 1:nrow(complete_obs_count)){
    if(complete_obs_count[i, 'nobs'] > threshold){
      file_path <- paste(directory_path, "/", sprintf("%03d", complete_obs_count[i, 'id']), ".csv", sep="")
      monitor_data <- read.csv(file_path)
      corr_values <- c(corr_values, cor(monitor_data['sulfate'], monitor_data['nitrate'], use = 'pairwise.complete.obs'))
    }
  }
  corr_values
}