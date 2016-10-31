# test if object has attribute
#
# @param x object
# @param which character; names of possible attributes
#
# @note not exported

has_attr <- function(x, which) {

  which %in% names( attributes(x) )

}
