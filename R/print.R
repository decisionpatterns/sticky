#' print a sticky attribute object
#'
#' print a sticky object which mostly delegates it the the next method.
#'
#' @param x sticky object
#' @param ... further arguments passed to or from other methods.
#'
#' @details
#'
#' prints a sticky object; this is also the default method for sticky objects
#'
#' @return
#'
#' An invisible copy of \code{x}.
#'
#' @examples
#'
#'   x <- sticky(1:3)
#'   print(x)
#'   x
#'
#' @export

print.sticky <- function(x, ...) {
  message( "sticky ", setdiff( class(x), "sticky" ) )
  print( unstick(x), ... )
  return( invisible(x) )
}
