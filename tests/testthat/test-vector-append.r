# APPEND
# ----------

library(magrittr)
source("utils.r")

context('vector append')

test_that('vector-append', {
  x. <- 1:5 %>% sticky
  x. %>% expect_is('sticky')
  x. <- x. %>% set_foo
  x. <- x. %>% append(1:3)
  x. %>% expect_is('sticky')
  x. %>% attr('foo') %>% expect_equal('bar')
})