## Solve a matrix with result cached

## Encapsulate a matrix with a list of 4 functions that get and set the matrix and its inversion.

makeCacheMatrix <- function(x = matrix()) {
  v <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  get <- function() {
    x
  }
  setinv <- function(inv) {
    v <<- inv
  }
  getinv <- function() {
    v
  }
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## compute the inversion of matrix and save the result to cache, or return the cached result directly.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinv()
  if (!is.null(i)) {
    message("getting cached data")
    return (i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$set(i)
  i
}
