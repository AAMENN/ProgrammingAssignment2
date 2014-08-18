## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(matrix = matrix()) {  ## Here the input is a matrix
  
  i <- NULL                           ## i is a variable to indicate the inverse and
  ## initialised with NULL each time a cacheMatrix object is created 
  
  
  set <- function(matrix ) {         ## Takes an input matrix and sets the inverse to NULL
    m <<- matrix                     ## Basically it does the same operation when a new object is generated.
    i <<- NULL
  }
  
  
  get <- function() {                ## It returns the input matrix 
    
    matrix
  }
  
  
  setInverse <- function(matrix) {    ## This function is called by cacheSolve() and stores the value
    ## using super assignment
    i <<- matrix
  }
  
  
  getInverse <- function() {          ## The function returns the cached inverse value
    
    i
  }
  
  
  list(set = set, get = get,          ## It is the returning element of makeCacheMatrix()
       setInverse = setInverse,       ## Return the list of all functions
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {     ## Here the input is the object created by makeCacheMatrix()
  
  m <- x$getInverse()               ## accesses the object x and get the cached inverse
  
  
  if( !is.null(m) ) {                ## if inverse is already cached(not NULL)...
    message("getting cached data")   ## send this message to console
    return(m)                        ## return the inverse
  }
  
  
  data <- x$get()                   ## This code only executes when x$getInverse() return NULL
  
  
  m <- solve(data)                  ## if inverse is NULL then calculate the inverse and save it to m
  
  
  x$setInverse(m)                   ## set the calculated value of m as inverse to x
  
  
  m                                 ## return the inverse of the matrix
}
