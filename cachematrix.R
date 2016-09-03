## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix, takes in a matrix and creates a new function used
##                  to solve the inverse of the SQ matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,setsolve = setsolve, getsolve = getsolve)
}

## cacheSolve, solves the inverse matrix if it does not exists, otherwise it returns
##             the cached inverse matrix
 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getsolve()
      if(!is.null(m)){
        print("use cache")
        return(m)
      }
      data <- x$get()
      m <- solve(data)
      x$setsolve(m)
      m
}
