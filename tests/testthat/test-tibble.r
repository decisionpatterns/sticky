
library(magrittr)
library(tibble)
source("utils.r")

context('tibble')

x <- 1:5 %>% sticky %>% set_foo
y <- letters[1:5]

tbl <- tibble( stick=x, non.stick=y)
tbl %<>% sticky
tbl %<>% structure( foo = "bar")

test_that('is', {
  tbl %>% expect_is('data.frame')
  tbl %>% expect_is('sticky')
  tbl %>% expect_is('data.frame')
  tbl %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by index", {
  tbl[1:3,] %>% expect_is('sticky')
  tbl[1:3,] %>% expect_is('data.frame')
  tbl[1:3,] %>% attr('foo') %>% expect_equal('bar')

  tbl[,1,drop=FALSE] %>% expect_is('sticky')
  tbl[,1,drop=FALSE] %>% expect_is('data.frame')
  tbl[,1,drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  tbl[1:3,1,drop=FALSE] %>% expect_is('sticky')
  tbl[1:3,1,drop=FALSE] %>% expect_is('data.frame')
  tbl[1:3,1,drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by name", {

  tbl[,"stick",drop=FALSE] %>% expect_is('sticky')
  tbl[,"stick",drop=FALSE] %>% expect_is('data.frame')
  tbl[,"stick",drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  tbl[1:3,"stick",drop=FALSE] %>% expect_is('sticky')
  tbl[1:3,"stick",drop=FALSE] %>% expect_is('data.frame')
  tbl[1:3,"stick",drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by logical", {
  tbl[,c(T,F),drop=FALSE] %>% expect_is('sticky')
  tbl[,c(T,F),drop=FALSE] %>% expect_is('data.frame')
  tbl[,c(T,F),drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  tbl[1:3,c(T,F),drop=FALSE] %>% expect_is('sticky')
  tbl[1:3,c(T,F),drop=FALSE] %>% expect_is('data.frame')
  tbl[1:3,c(T,F),drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})
