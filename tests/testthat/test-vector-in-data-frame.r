# DATA FRAME
# ----------

library(magrittr)
source('utils.r')


context('vector in data.frame')
x <- 1:5 %>% sticky %>% set_foo
y <- letters[1:5]

df <- data.frame( yes=x, no=y)
df %>% expect_is('data.frame')


context('  $ ')
df$no %>% is.sticky %>% expect_false# DATA.FRAME
df$yes %>% expect_is('sticky')
df$yes %>% attr('foo') %>% expect_equal('bar')

context('  [[')
df[[1]][1:3] %>% expect_is('sticky')
df[[1]][1:3] %>% attr('foo') %>% expect_equal('bar')

df[['yes']] %>% expect_is('sticky')
df[['yes']] %>% attr('foo') %>% expect_equal('bar')


context('  [ ')
df[1:3, 'yes'] %>% expect_is('sticky')
df[1:3, 1] %>% attr('foo') %>% expect_equal('bar')


context('  add column')

df$yes2 <- x
df$yes2 %>% expect_is('sticky')
df$yes2 %>% attr('foo') %>% expect_equal('bar')

