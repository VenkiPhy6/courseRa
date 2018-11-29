#Reading and writing data with R
#Make sure to do a rough memory calculation before you read/write data

#read.table() and read.csv()----
#optimizing for time by pre specifying classes of the data's columns


#dget and dput----
y1 <- data.frame(col1=c(1,2,3), col2=c(T,F,T))
y1
dput(y1, file='dput_df.R')
got_y1 <- dget('dput_df.R')
got_y1
y2 <- 1:26
names(y2) <- LETTERS[y2]
y2
dput(y2)
dput(y2, file='dput_vec.R')
got_y2 = dget('dput_vec.R')
got_y2
y3 = y2
dim(y3) <- c(13,2)
y3
dput(y3, file='dput_mat.R')
got_y3 <- dget('dput_mat.R')
got_y3
sourced_y3 <- (source('dput_mat.R')) 
sourced_y3 #This returns a list instead of a matrix. So if you dput, use dget!


#source and dump----
x1 <- y1
x2 <- rnorm(100,50,5)
x2
dump(c('x1','x2'), file='dump_file.R') #We are passing variable names as a character vector.
source('dump_file.R')
x1
x2
got_x12 <- dget('dump_file.R')
got_x12 #Amazingly bad! I just lost one of the variables. So if you dump, then source!


#Creating connections with file, gzfile, bzfile, url----

#Unnecessary usage!
con1 <- file('./data_practice/file_to_read.R', 'r') #Other modes - w, a, rb, wb, ab
source(con1) #Could have just done a source with the path directly instead of a connection!
close(con1)

#A more purposeful usage
con2 <- file('./data_practice/file_to_read.csv', 'r')
c1 <- readLines(con2, 25)
as.data.frame(c1) #Not so tidy but still, read just the lines I needed.

#Connecting to websites
con3 <- url("http://jhsph.edu",'r')
c2 <- readLines(con3)
head(c2) #Tried to load the entire thing and it crashed! head() exists for a reason...
