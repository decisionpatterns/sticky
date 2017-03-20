library(magrittr)

source("utils.r")

context('matrix')

m <- matrix( 1:6, nrow=3 )
sm <- sticky(m)
sm %<>% set_foo

test_that( "is", {
  sm %>% expect_is('matrix')
  sm %>% expect_is('sticky')
  sm %>% attr('foo') %>% expect_equal('bar')
  sm %>% magrittr::equals(m) %>% all %>% expect_true
})

test_that( "[ by index", {

 sm[1:2,] %>% expect_is('matrix')
 sm[1:2,] %>% expect_is('sticky')
 sm[1:2,] %>% attr('foo') %>% expect_equal('bar')
 sm[1:2,] %>% magrittr::equals(m[1:2,]) %>% all %>% expect_true
 sm[1:2,] %>% dim %>% expect_equal( c(2,2) )

 sm[,1:2] %>% expect_is('matrix')
 sm[,1:2] %>% expect_is('sticky')
 sm[,1:2] %>% attr('foo') %>% expect_equal('bar')
 sm[,1:2] %>% magrittr::equals(m[,1:2]) %>% all %>% expect_true

 sm[1:2,1:2] %>% expect_is('matrix')
 sm[1:2,1:2] %>% expect_is('sticky')
 sm[1:2,1:2] %>% attr('foo') %>% expect_equal('bar')
 sm[1:2,1:2] %>% magrittr::equals(m[1:2,1:2]) %>% all %>% expect_true

})

test_that( "[ by logical", {

  sm[c(T,T,F),] %>% expect_is('sticky')
  sm[c(T,T,F),] %>% expect_is('matrix')
  sm[c(T,T,F),] %>% attr('foo') %>% expect_equal('bar')
  sm[c(T,T,F),] %>% magrittr::equals(m[c(T,T,F),]) %>% all %>% expect_true

  sm[c(T,T,F), c(T,F), drop=FALSE] %>% expect_is('sticky')
  sm[c(T,T,F), c(T,F), drop=FALSE] %>% expect_is('matrix')
  sm[c(T,T,F), c(T,F), drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
  sm[c(T,T,F), c(T,F), drop=FALSE] %>% magrittr::equals(m[c(T,T,F), c(T,F), drop=FALSE]) %>% all %>% expect_true
})

#'