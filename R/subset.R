#' Subset elements to sticky object
#'
#' @param x sticky object
#' @param ... additional arguments to \code{base::subset}
#'
#' \code{subset} preserves object attributes by wrapping \code{base::subset} and
#' copying objects to the result.
#'
#' @seealso
#'   \code{\link[base]{subset}}
#'
#' @aliases subset
#' @include sticky.R
# @export

# subset <- function(x, ...) UseMethod('subset')

# subset.default <- function(x, ...) base::subset(x,...)

subset.sticky <- function(x, ... ) {
  r <- NextMethod("subset")
  # r <- base::subset(x,...)
  mostattributes(r) <- attributes(x)
  sticky(r)
}
