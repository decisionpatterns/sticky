
library(magrittr)
source("utils.r")

context('data.frame')

x <- 1:5 %>% sticky %>% set_foo
y <- letters[1:5]

df <- data.frame( stick=x, non.stick=y)
df %<>% sticky
df %<>% structure( foo = "bar")

test_that('is', {
  df %>% expect_is('data.frame')
  df %>% expect_is('sticky')
  df %>% expect_is('data.frame')
  df %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by index", {
  df[1:3,] %>% expect_is('sticky')
  df[1:3,] %>% expect_is('data.frame')
  df[1:3,] %>% attr('foo') %>% expect_equal('bar')

  df[,1,drop=FALSE] %>% expect_is('sticky')
  df[,1,drop=FALSE] %>% expect_is('data.frame')
  df[,1,drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  df[1:3,1,drop=FALSE] %>% expect_is('sticky')
  df[1:3,1,drop=FALSE] %>% expect_is('data.frame')
  df[1:3,1,drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by name", {

  df[,"stick",drop=FALSE] %>% expect_is('sticky')
  df[,"stick",drop=FALSE] %>% expect_is('data.frame')
  df[,"stick",drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  df[1:3,"stick",drop=FALSE] %>% expect_is('sticky')
  df[1:3,"stick",drop=FALSE] %>% expect_is('data.frame')
  df[1:3,"stick",drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by logical", {
  df[,c(T,F),drop=FALSE] %>% expect_is('sticky')
  df[,c(T,F),drop=FALSE] %>% expect_is('data.frame')
  df[,c(T,F),drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  df[1:3,c(T,F),drop=FALSE] %>% expect_is('sticky')
  df[1:3,c(T,F),drop=FALSE] %>% expect_is('data.frame')
  df[1:3,c(T,F),drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})
