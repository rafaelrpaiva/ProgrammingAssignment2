## Function to start and save a matrix in cache, allowing get and set functions
## as well
## By rafaelpaiva@gmail.com - a brazilian interested in job offers to US/Canada.
## Coursera Introduction to R

makeCacheMatrix <- function(x = matrix()) {
    mx <<- NULL
    
    set <- function (y) {
        x <<- y
        mx <<- NULL
    }

    get <- function () x

    setmatrix <- function(solve) mx <<- solve
    
    getmatrix <- function() mx
    
    list(set=set, get=get,
         setmatrix=setmatrix,
         getmatrix=getmatrix)
    
}


## Function to calculate the inverse matrix, caching then.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    mx <- x$getmatrix()
    if(!is.null(mx)) {
        message("getting cached data")
        return(mx)
    }
    matrix <- x$get()
    mx <- solve(matrix, ...)
    x$setmatrix(mx)
    mx   
}