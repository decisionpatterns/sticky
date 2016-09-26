
# Internal, non-exported functions

library(magrittr)

source('utils.r')

normal <- 1:10

context("internals")

# normal %>% sticky:::.init %>% expect_is('sticky')  # set class internal
