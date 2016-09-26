#' utils.r

#' set_foo: sets an arbitrary attribute (foo) of an object to 'bar'
#'    foo = 'bar'

set_foo <- function(x, value="bar") {
    attr(x,'foo') = 'bar'
    return(x)
}
