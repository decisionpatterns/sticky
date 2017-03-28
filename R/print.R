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
  if( interactive() ) message( "sticky: ", paste( setdiff( class(x), "sticky" ), collapse=" " ) )
  r <- NextMethod("print", unstick(x) )
  # print( unstick(x), ... )
  return( invisible(r) )
}
