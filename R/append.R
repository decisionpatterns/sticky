#' Append elements to sticky object
#'
#' @param x sticky object
#' @param ... additional arguments to \code{base::append}
#'
#' \code{append} preserves object attributes by wrapping \code{base::append} and
#' copying objects to the result.
#'
#' @seealso
#'   \code{\link[base]{append}}
#'
#' @aliases append
#' @include sticky.R
#' @export

append <- function(x, ...) UseMethod('append')

append.default <- function(x, ...) base::append(x,...)

append.sticky <- function(x, ... ) {
  # r <- NextMethod("append")
  r <- base::append(x,...)
  mostattributes(r) <- attributes(x)
  sticky(r)
}
