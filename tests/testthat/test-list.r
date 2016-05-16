library(magrittr)

context("list")

li <- list(a=1, b=2, c=3)
li %<>% sticky
li %<>% structure( foo="bar" )

context( " [ by index")
  li[1:2] %>% expect_is('sticky')
  li[1:2] %>% expect_is('list')
  li[1:2] %>% attr('foo') %>% expect_equal('bar')


context( " [ by name")
  li['b'] %>% expect_is('sticky')
  li['b'] %>% expect_is('list')
  li['b'] %>% attr('foo') %>% expect_equal('bar')


context( " [ by logical")
  li[c(T,F,T)] %>% expect_is('sticky')
  li[c(T,F,T)] %>% expect_is('list')
  li[c(T,F,T)] %>% attr('foo') %>% expect_equal('bar')
