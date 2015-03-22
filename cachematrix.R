## This is the solution to the ProgrammingAssignment 2 for Peer Evaluation

## Creates a matric-inverse object which can be cached to reduce the overhead of calculation every time its required

## Usage Example : 	M <- matrix(c(1, 2, 3, 4), nrow=2, ncol=2)
##                 	cacheMatrix <- makeCacheMatrix(M)
##					cacheSolve(cacheMatrix)

## Create a cacheMatrix object

makeCacheMatrix <- function(x = matrix()) {
	cachedInverse <- NULL
    set <- function(y) {
        x <<- y
        cachedInverse <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) cachedInverse <<- inverse
    getInverse <- function() cachedInverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## Return the inverse matrix 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    invFunc <- x$getInverse()
    if(!is.null(invFunc)) {
        message("getting cached data")
        return(invFunc)
    }
    data <- x$get()
    invFunc <- solve(data, ...)
    x$setInverse(invFunc)
    invFunc
}
