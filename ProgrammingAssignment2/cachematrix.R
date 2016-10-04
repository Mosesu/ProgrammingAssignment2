## This functions first creates a special matrix object that can cache its inverse and then compute an inverse.
## In cases where the inverse has already been calculated it simply retrieves the inverse from cache

## This function creates a special "matrix" object that can cache its inverse.
## This is a square matrix inversion.


makeCacheMatrix <- function(x = matrix()) {

## Set the matrix

        m <- NULL


   set <- function(y) {

# use `<<-` to assign a value to an object in an environment different from the current environment. 

                x <<- y
                m <<- NULL
       
       }
## Get the matrix
        get <- function() x
        setinv <- function(inverse) m <<- inverse
        getinv <- function() m

list(set=set, get=get, setinv=setinv, getinv=getinv)
       
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
 

cacheSolve <- function(x, ...) {
  
m = x$getinv()

# if the inverse has already been calculated     

m <- solve(x)
        if(!is.null(m)) {

# get it from the cache and skips the computation.

                message("getting cached matrix inverse")
                
                 return(m)
}
 
# otherwise, calculates the inverse 

mat.data = x$get()
        m = solve(mat.data, ...)

# sets the value of the inverse in the cache via the setinv function.    
x$setinv(m)


return(m)


}
