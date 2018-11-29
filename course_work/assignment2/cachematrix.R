##We are trying to cache the inverse of a square matrix so that we don't have to 
##calculate it anew everytime it is needed for the same matrix.

##This function checks if the given parameter is a square matrix and then
##returns a special 'matrix' which is actually a list of functions
makeCacheMatrix <- function(x = matrix()) {
	if(class(x) != 'matrix' || dim(x)[1] != dim(x)[2]){
		stop("Input is not a square matrix")
	}
	inv <- NULL
	set <- function(y){
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setInv <- function(inverse) inv <<- inverse
	getInv <- function() inv
	list(set = set, get = get, setInv = setInv, getInv = getInv)
}


##This function tries to retrieve its inverse if already available in the cache 
##else calculates it. But first it checks if its input is the special 'matrix' 
##cooked up by makeCacheMatrix function.
cacheSolve <- function(x, ...) {
	if(is.null(names(x)) || names(x) != c("set", "get", "setInv", "getInv")){
		stop("Input was not returned by makeCacheMatrix!")
	}
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getInv()
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setInv(inv)
	inv
}