#' Internal, non-exported unit functions
#'
#' These are internal functions for the sticky.attributes package. They are not
#' exported and should not be used directly. Instead use the proper interface,
#' \code{\link{sticky}}
#'
#' @param x vector
#'
#' @details
#'
#' \code{.init} : initializes the class
#'
#' @rdname internals

.init <- function(x) {    # Should be .init(?)

  if( ! is.sticky(x) )
    x <- structure(x, class = c( 'sticky', class(x) ) )

  return(x)

}


.deinit <- function(x) {

  attr( x, 'units' ) = NULL
  class(x) <- setdiff( class(x), 'sticky')

  return(x)

}

