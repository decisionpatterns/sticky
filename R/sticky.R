#' @title sticky
#'
#' @description
#' Persist Attributes
#'
#' @param x objects to have attributes preserved.
#' @param ... Additional arguments passed to subsequent method(s)
#'
#' @details
#' \code{sticky} creates objects whose attributes are resilent to subsetting and
#' placing in containers such as lists, data.frames and data.tables.
#'
#' @references
#'   This has been asked and written about numerous times on Stack Overflow. The
#'   first has a fairly comprehensive list to others SO discussions.
#'
#'   \url{http://stackoverflow.com/questions/23991060/loss-of-attributes-despite-attempts-to-preserve-them} \cr
#'   \url{http://stackoverflow.com/questions/10404224/how-to-delete-a-row-from-a-data-frame-without-losing-the-attributes} \cr
#'   \url{http://stackoverflow.com/questions/23991060/loss-of-attributes-despite-attempts-to-preserve-them} \cr
#'   \url{http://stackoverflow.com/questions/23841387/approaches-to-preserving-objects-attributes-during-extract-replace-operations} \cr
#'   \url{http://stackoverflow.com/questions/13432519/indexing-operation-removes-attributes} \cr
#'
#' @examples
#'
#'   x <- 1:5
#'   attr(x, 'foo') <- 'bar'
#'   x <- x[1:3]
#'   attr(x,'foo')            # NULL
#'
#'   x <- sticky(1:5)
#'   attr(x, 'foo') <- 'bar'
#'   x_1 <- x[1:3]
#'   attr(x_1, 'foo')         # bar
#'
#'   x_2 <- unstick(x)
#'   x_2 <- x[1:3]
#'   attr(x_2,'foo')          # NULL
#'
#'
#'   is.sticky(x)             # TRUE
#'
#' @include init.R
#' @export

sticky <- function(x)
  return( .init(x) )


#' @rdname sticky
#' @export

unstick <- function(x) .deinit(x)



#' @rdname sticky
#' @importFrom methods is
#' @export

is.sticky <- function(x) is(x,'sticky') | is(x,'sticky_recursive')
