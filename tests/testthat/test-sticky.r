
# internals are: init_units, set_units, get_units, remove_units

library(magrittr)


## HEADER
# FUNCTIONS USED FOR TESTING
source('header.r')


## INIT
context("init")

x <- 1:10
x %>% sticky %>% expect_is('sticky')  # set class
x %>% sticky %>% is.sticky %>% expect_true # is.sticky

x_integer <- 1:5L %>% sticky
x_integer %>% expect_is('sticky')
x_integer %>% expect_is('integer')

x_numeric <- rnorm(5) %>% sticky
x_numeric %>% expect_is('sticky')
x_numeric %>% expect_is('numeric')

x_character <- letters[1:5] %>% sticky
x_character %>% expect_is('sticky')
x_character %>% expect_is('character')

x_factor <- letters[1:5] %>% as.factor %>% sticky
x_factor %>% expect_is('sticky')
x_factor %>% expect_is('factor')

## POSIXct
context('POSIXct')
x_dt <- as.POSIXct( (1:10)*1e8, origin = "1960-01-01") %>% sticky

x_dt %>% expect_is('sticky')
x_dt %>% expect_is('POSIXct')


## unsticky
1:5 %>% sticky %>% unsticky %>% is.sticky %>% magrittr::not %>% expect_true


## is.sticky
context('is.sticky')
1:5 %>% is.sticky %>% expect_false()
1:5 %>% sticky %>% is.sticky %>% expect_true()



## `[`
context("`[`")
x <- 1:5
attr(x,'foo') <- 'bar'
x %>% attr('foo') %>% expect_equal('bar')
x <- x %>% sticky
x %>% expect_is('sticky')

x_sub <- x[1:3]
x_sub %>% expect_is('sticky')
x_sub %>% attr('foo') %>% expect_equal('bar')


x_sub[0] %>% expect_is('sticky')


# Selecting a single element should not return a sticky vector
# context("`[[`")
# x <- 1:5 %>% sticky
# x[[1]] %>% expect_is('sticky')


## `[<-`
context("`[<-`")
x <- 1:5 %>% sticky
x[6:11] <- 1:6
x
x %>% expect_is('sticky')


# SUBSET
# ----------
context('subset()')
x <- 1:5 %>% sticky
x %>% set_foo()
attr(x,'foo') = 'bar'

x_test <- x %>% subset(c(T,F,T,F,T))
x_test %>% expect_sticky
x_test %>% expect_attr_foo

x_test <- x %>% subset(c(T,T,T,T,T))
x_test %>% expect_sticky
x_test %>% expect_attr_foo


x_test %>% subset(c(F,F,F,F,F)) %>% expect_sticky
x_test %>% expect_sticky
x_test %>% expect_attr_foo
x_test <- x_test %>% set_foo('baz')



# APPEND
# ----------
context('append()')
x. <- 1:5 %>% sticky
x. %>% expect_is('sticky')
x. <- x. %>% set_foo
x. <- x. %>% append(1:3)
x. %>% expect_sticky
x. %>% expect_attr_foo



# DATA FRAME
# ----------
context('data.frame')
x <- 1:5 %>% sticky %>% set_foo

y <- letters[1:5]

df <- data.frame( yes=x, no=y)

df$no %>% is.sticky %>% expect_false# DATA.FRAME
context('data.frame: $')
df$yes %>% expect_sticky
df$yes %>% expect_attr_foo


context('data.frame: [[')

df[[1]][1:3] %>% expect_sticky
df[[1]][1:3] %>% expect_attr_foo

df[['yes']] %>% expect_sticky
df[['yes']] %>% expect_attr_foo


context('data.frame: [')

df[1:3, 'yes'] %>% expect_sticky
df[1:3, 1] %>% expect_attr_foo


context('df/add column')

df$yes2 <- x

df$yes2 %>% expect_sticky
df$yes2 %>% expect_attr_foo


# DATA TABLE
# ----------
context('data.table')
x <- 1:5 %>% sticky %>% set_foo

y <- letters[1:5]

df <- data.table( yes=x, no=y)

df$no %>% is.sticky %>% expect_false# DATA.TABLE
context('data.table: $')
df$yes %>% expect_sticky
df$yes %>% expect_attr_foo


context('data.table: [[')

df[[1]][1:3] %>% expect_sticky
df[[1]][1:3] %>% expect_attr_foo

df[['yes']] %>% expect_sticky
df[['yes']] %>% expect_attr_foo


context('data.frame: [')

df[1:3, 'yes'] %>% expect_sticky
df[1:3, 1] %>% expect_attr_foo


context('dt/add column')

df$yes2 <- x

df$yes2 %>% expect_sticky
df$yes2 %>% expect_attr_foo
