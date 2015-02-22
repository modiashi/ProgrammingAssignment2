## Put comments here that give an overall description of what your
## functions do

## this function describes 4 member fucntions, set,get,setInverse and getInv. It uses <<- operator 
## to not expose the internal variables to other environment

makeCacheMatrix <- function(x = matrix()) {
   m <- NULL  # this is where the result of inversion is stored
  set <- function(y){
     x <<- y  
     m <<- NULL    #store matrix in cache and initialize it to null
    }
    get <- function() x    #get matrix
    setInverse <- function(solve) m<<- solve #set inverse matrix
    getInverse <- function() m #get inverse matrix
    list(set = set, get = get,
          setInverse = setInverse, 
         getInverse = getInverse)  ## create list of functions
  }
  

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()                 #query the x matrix's cache
    if(!is.null(m)){                    #if there is a cache the inverse has been previously calculated
      message("getting cached data")    # sent message indicating this is just cache 
      return(m)                         # return the cache  
    }
    data <- x$get()                     # get the matrix used by makeCacheMatrix function 
    m <- solve(data, ...)               # calculate the inverse of the matrix
    x$setInverse(m)                     # store the inverse matrix in cache using the makeCacheMatrix set function
    m
  }

