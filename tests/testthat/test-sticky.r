
# internals are: init_units, set_units, get_units, remove_units

library(magrittr)
source('utils.r')

# HEADER
# Functions used for testing


# set_foo <- function(x, value="bar") {
#     attr(x,'foo') = 'bar'
#     return(x)
# }

# expect_sticky <- function (object, class, info = NULL, label = NULL)
# {
# #     if (is.null(label)) {
# #         label <- find_expr("object")
# #     }
#     expect_that(object, is_a('sticky'), info, label)
# }

# expect_attr_foo <- function (object, class, info = NULL, label = NULL)
# {
# #     if (is.null(label)) {
# #         label <- find_expr("object")
# #     }
#
#     expect_that( attr(object,'foo'), equals('bar'), info, label)
# }



# expect_sticky <- function(x) {
#   testthat::expect_is(x,'sticky')
# }

# expect_attr_foo <- function(x) {
#   x %>% attr('foo') %>% expect_equal('bar')
# }


## INIT
context("init")

x <- 1:10

test_that( 'is', {
  x %>% sticky %>% expect_is('sticky')  # set class
  x %>% sticky %>% is.sticky %>% expect_true # is.sticky
})

test_that('types', {
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
})
## POSIXct
test_that('POSIXct', {
  x_dt <- as.POSIXct( (1:10)*1e8, origin = "1960-01-01") %>% sticky

  x_dt %>% expect_is('sticky')
  x_dt %>% expect_is('POSIXct')
})

## unstick
test_that("unstick", {
  1:5 %>% sticky %>% unstick %>% is.sticky %>% expect_false
})

## is.sticky
test_that('is.sticky' ,{
  1:5 %>% is.sticky %>% expect_false()
  1:5 %>% sticky %>% is.sticky %>% expect_true()
})

test_that("[", {
  x <- 1:5
  attr(x,'foo') <- 'bar'
  x %>% attr('foo') %>% expect_equal('bar')
  x <- x %>% sticky
  x %>% expect_is('sticky')

  x_sub <- x[1:3]
  x_sub %>% expect_is('sticky')
  x_sub %>% attr('foo') %>% expect_equal('bar')


  x_sub[0] %>% expect_is('sticky')
})

test_that("[<-", {
  x <- 1:5 %>% sticky
  x[6:11] <- 1:6
  x
  x %>% expect_is('sticky')
})

test_that('subset()', {
  x <- 1:5 %>% sticky
  x <- x %>% set_foo()

  x_test <- x %>% subset(c(TRUE,FALSE,TRUE,FALSE,TRUE))

  x_test %>% expect_is('sticky')
  x_test %>% attr('foo') %>% expect_equal('bar')

  x_test <- x %>% subset(c(T,T,T,T,T))
  x_test %>% expect_is('sticky')
  x_test %>% attr('foo') %>% expect_equal('bar')


  x_test <- x %>% subset(c(F,F,F,F,F))
  x_test %>% expect_is('sticky')
  x_test %>% attr('foo') %>% expect_equal('bar')
  x_test <- x_test %>% set_foo('baz')
})




