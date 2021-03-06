## The below two functions cache the inverse of a matrix.
    
## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    
    ## Initialize the inverse property
    m <- NULL
    
    ## Method to set the matrix
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    ## Method to get the matrix
    get <- function() x  
    
    ## Method to set the matrix
    setmatrix<-function(solve) m<<- solve
    getmatrix<-function() m

    ## Return a list of the methods
    list(set=set, get=get,
         setmatrix=setmatrix,
         getmatrix=getmatrix)   
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
##above. If the inverse has already been calculated (and the matrix has not changed), 
##then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    
    ## Return a matrix that is the inverse of 'x'
    m <- x$getmatrix()
    
    ## Returns the inverse if it's already set
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data, ...)
    
    ## Set the inverse to the object
    x$setmatrix(m)
    
    ## Return the matrix
    m   
}