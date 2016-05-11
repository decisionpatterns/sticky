#' @title Sticky Attributes
#'
#' @description
#' Persist attributes through manipulations
#'
#' @param x vector to preserve attributes.
#' @param ... Additional arguments passed to subsequent method(s)
#'
#' @details
#' \code{sticky} creates objects whose attributes are resilent to subsetting and
#' placing in containers such as lists, data.frames and data.tables.
#'
#' @references
#'   This has been asked and written about numerous times on Stack Overflow. The
#'   first has a fairly comprehensive list to others
#'
#'   http://stackoverflow.com/questions/23991060/loss-of-attributes-despite-attempts-to-preserve-them \cr
#'   http://stackoverflow.com/questions/10404224/how-to-delete-a-row-from-a-data-frame-without-losing-the-attributes \cr
#'   http://stackoverflow.com/questions/23991060/loss-of-attributes-despite-attempts-to-preserve-them \cr
#'   http://stackoverflow.com/questions/23841387/approaches-to-preserving-objects-attributes-during-extract-replace-operations \cr
#'   http://stackoverflow.com/questions/13432519/indexing-operation-removes-attributes \cr
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
#'   x_2 <- unsticky(x)
#'   x_2 <- x[1:3]
#'   attr(x_2,'foo')          # NULL
#'
#'
#'   is.sticky(x)             # TRUE
#'
#' @include internals.R
#' @export

sticky <- function(x) {
# UseMethod('sticky')
#}
# sticky.default <- function(x) {

  if( is.atomic(x) ) return( .init(x) )

  warning( 'sticky attributes are not supported for non-atomic objects of class: ',
           paste( class(x), collapse = ", " )
          )
}




#' @rdname sticky
#' @export

unsticky <- function(x) .deinit(x)


# sticky.vector <- function(x) .init(x)

#' @rdname sticky
print.sticky <- function(x, ...) {
  # NextMethod('print')
  print( structure( x, class=setdiff(class(x), 'sticky') ) )
}


# #' @rdname sticky
# show.sticky <- function(x, ...)
#  show( structure( x, class=setdiff(class(x), 'sticky') ) )

#' @rdname sticky
#' @export

is.sticky <- function(x) is(x,'sticky')



