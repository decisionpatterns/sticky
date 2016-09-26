#' Internal, non-exported unit functions
#'
#' These are internal functions for the sticky package. They are not
#' exported and should not be used directly. Instead use the proper interface,
#' \code{\link{sticky}} and \code{\link{unstick}}
#'
#' @param x vector
#'
#' @details
#'
#' \code{.init} : initializes the class
#' \code{.deinit} : un-initialize the class
#'
#' These are internals functions not to be called directly, please use the
#' interfaces, \code{sticky} and \code{unsticky}.
#'
#' @seealso
#'    \code{sticky} and \code{unsticky}
#'
#' @examples
#'   # - tk
#'
#' @rdname init

.init <- function(x) {

  if( ! is.sticky(x) )
    x <- structure(x, class = c( 'sticky', class(x) ) )

  return(x)

}


#' @rdname init

.deinit <- function(x) {

  # attr( x, 'units' ) = NULL
  class(x) <- setdiff( class(x), 'sticky')

  return(x)

}

