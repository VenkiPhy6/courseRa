#Getting help----
?c
?`:`
help(c)
args(data.frame)


#Create sequences in R----
1:10
pi:10
15:1
seq(1,10,by=.5)
my_seq <- seq(5,15,length=30)
1:length(my_seq); seq(along.with = my_seq); seq_along(my_seq)
rep(0, times=40)
rep(c(1,2,3), times=10)
rep(c(1,2,3), each=10)

#Every atomic class is a vector in R----
a1 <- c(10,20,30,40)
a1 *2 + 100 #This command is interpreted by R as a1 * c(2,2,2,2) + c(100,100,100,100).
a1 * c(11,12,13) #The behaviour of recycling numbers as vectors is clearly seen here.


