## http://stackoverflow.com/questions/23796316/returning-the-inverse-matrix-from-a-cached-object-in-r

makeCacheMatrix <- function (x = matrix()) {
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

cacheSolve <- function(x=matrix(), ...) {
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