#' Extract
#'
#' @param x sticky; object to extract from
# @param i values to extract
#' @param ... additional parameters
#'
#' @details
#'
#' Implements `[` for sticky attributes. This methods ensures that existing
#' attributes are propogated forward.
#'
#' @seealso
#'   \code{\link[base]{attributes}}, specifically \code{mostattributes}
#'
#' @rdname extract
#' @include sticky.R
#' @export

`[.sticky` <- function(x,...) {

  r <- NextMethod("[")

  has_dim <- has_attr(r, 'dim')
  r_dim <- dim(r)

  mostattributes(r) <- attributes(x)

  if( has_dim ) dim(r) <- r_dim

  r
}
