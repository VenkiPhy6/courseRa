file1 <- read.csv('./data_HW/quiz1_data/hw1_data.csv')
head(file1)
nrows(file1)
str(file1)
tail(file1)
mean(file1$Ozone, na.rm=T)
subset1 = file1[file1$Ozone > 31, ][file1$Temp > 90, ] #Why don't subset1 and 3 give the same mean?!
mean(subset1$Solar.R, na.rm=T)
subset2 = file1[file1$Ozone > 31, ]
subset3 = subset2[subset2$Temp > 90, ]
mean(subset3$Solar.R, na.rm=T)
subset4 = file1[file1$Month == 6, ]
mean(subset4$Temp)
summary(file1[file1$Month ==5, ])
