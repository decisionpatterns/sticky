# HEADER
# Functions used for testing


expect_sticky <- function(x) expect_is(x,'sticky')

set_foo <- function(x, value="bar") {
  attr(x,'foo') = 'bar'
  return(x)
}

expect_attr_foo <- function(x) x %>% attr('foo') %>% expect_equal('bar')
