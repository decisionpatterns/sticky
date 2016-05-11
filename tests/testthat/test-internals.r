
# Internal, non-exported functions

library(magrittr)

normal <- 1:10

context("internals")

normal %>% sticky.attributes::.init %>% expect_is('sticky')  # set class internal
