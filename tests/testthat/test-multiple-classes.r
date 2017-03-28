library(magrittr)
source('utils.r')

context( "Additional Classes")
test_that( "Additional Classes", {

  x <- rnorm(5)
  x %<>% base.tools::append_class( "something")
  x %<>% sticky()

  x %>% class %>% testthat::equals( c('sticky', 'something', 'numeric' ) )

})