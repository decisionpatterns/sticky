#' print
#'
#' @paran x sticky
#'
#' @export

print.sticky <- function(x) {
  message( "sticky ", setdiff( class(x), "sticky" ) )
  print( unstick(x) )
}

