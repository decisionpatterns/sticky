#' Extract
#'
#' @param x sticky; object to extract from
# @param i values to extract
#' @param ... additional parameters
#'
#' @details
#' -tk
#'
#' @rdname extract
#' @include sticky.R
#' @export

`[.sticky` <- function(x,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
