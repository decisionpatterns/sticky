
library(magrittr)
library(data.table)

source("utils.r")


context('data.table')
x <- 1:5 %>% sticky %>% set_foo
y <- letters[1:5]

dt <- data.table( stick=x, non.stick=y)
dt %<>% sticky
dt %<>% structure( foo = "bar")

test_that( "is", {
  dt %>% expect_is('data.table')
  dt %>% expect_is('sticky')
  dt %>% expect_is('data.table')
  dt %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by index", {
  dt[1:3,] %>% expect_is('sticky')
  dt[1:3,] %>% expect_is('data.table')
  dt[1:3,] %>% attr('foo') %>% expect_equal('bar')

  dt[,1,drop=FALSE] %>% expect_is('sticky')
  dt[,1,drop=FALSE] %>% expect_is('data.table')
  dt[,1,drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  dt[1:3,1,drop=FALSE] %>% expect_is('sticky')
  dt[1:3,1,drop=FALSE] %>% expect_is('data.table')
  dt[1:3,1,drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by name", {
  dt[,"stick",drop=FALSE] %>% expect_is('sticky')
  dt[,"stick",drop=FALSE] %>% expect_is('data.table')
  dt[,"stick",drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  dt[1:3,"stick",drop=FALSE] %>% expect_is('sticky')
  dt[1:3,"stick",drop=FALSE] %>% expect_is('data.table')
  dt[1:3,"stick",drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})

test_that( "[ by logical", {
  dt[,c(T,F),drop=FALSE] %>% expect_is('sticky')
  dt[,c(T,F),drop=FALSE] %>% expect_is('data.table')
  dt[,c(T,F),drop=FALSE] %>% attr('foo') %>% expect_equal('bar')

  dt[1:3,c(T,F),drop=FALSE] %>% expect_is('sticky')
  dt[1:3,c(T,F),drop=FALSE] %>% expect_is('data.table')
  dt[1:3,c(T,F),drop=FALSE] %>% attr('foo') %>% expect_equal('bar')
})