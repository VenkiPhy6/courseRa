#R profiler for optimization

#PREMATURE OPTIMIZATION IS THE ROOT OF ALL EVIL. Design first and optimize later

#system.time()----
#If you know where to look

#User time - time it takes for the CPU(s)
#Elapsed time - wall clock time
#If user > elapsed it means multiple cores
#If user < elapsed it means things other than dealing with code are occuring

system.time(readLines('http://jhsph.edu'))
# hilbert <- function(n){
#   i <- 1:n
#   1 / outer(i - 1, i, '+')
# }
# x <- hilbert(1000)
# system.time(svd(x))
##Above commented snippet would show user<elapsed if multiple cores are used
system.time({
  n <- 1000
  r <- numeric(n)
  for(i in 1:n){
    x <- rnorm(i)
    r[i] <- mean(x)
  }
})
#Here multiple cores are not utilized and so user = elapsed 

#Learn Rprof and summaryRprof----