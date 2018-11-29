#Base graphics -from swirl lesson 
#Learn more at http://www.ling.upenn.edu/~joseff/rstudy/week4.html
#It lists all the shapes and colors

#Also see ggplot2, ggvis
#http://varianceexplained.org/r/teach_ggplot2_to_beginners/ 
#Some people wanna learn those first actually!

#Scatterplot----
data(cars)
?cars
head(cars)
plot(cars) #Short for scatterplot
?plot
plot(x = cars$speed, y = cars$dist)
plot(y = cars$speed, x = cars$dist)
plot(x = cars$speed, y = cars$dist, xlab = "Speed")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot")
plot(cars, sub = "My Plot Subtitle")
?par #Lists all the different parameters that are allowed
plot(cars, col=2)
plot(cars, xlim = c(10,15))
?points #Lists out shapes
plot(cars, pch=2)

#Boxplot----
data(mtcars)
?boxplot
boxplot( formula = mpg ~ cyl, data = mtcars)

#Histogram----
hist(mtcars$mpg)