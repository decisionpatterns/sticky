#' ## Issue 2  (CLOSED)
#'
#' From @jdwink: sticky has error with na.exclude
#+


#+ hide=TRUE
library(sticky)


#' The problem appears to be that a sticky matrix losses

m1 <- matrix(data = c(1:5,NA), nrow = 3)
m2 <- sticky(m1)

x1 <- na.exclude(m1)
dim(x1)  # 2 2

x2 <- na.exclude(m2)
class(x2)             # [1] "sticky" "matrix"
dim(x2)               # NULL
x2                    # Error

#' The problem is not na.exclude but the subset on a matrix that does not
#' propogate the dim as part of `mostattributes`
#'
#' Here is a better example:

m <- matrix( 1:6, nrow=3 )
m[1:2,1:2]

sm <- sticky(m)
sm_ <- sm[1:2,]
dim(sm_)            # error: NULL
class(sm_)          # okay:  "sticky" "matrix"
sm_                 # error:

#' The solution is to propogate the dimension along with other attributes