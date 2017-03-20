#' test-sticky_all.r
#'

x <- 1:5 %>% sticky %>% set_foo()
y <- letters[1:5]

df <- data.frame( stick=x, non.stick=y )
dt <- data.table( stick=x, non.stick=y )

context("sticky_all")
test_that( "sticky_all", {

  context("  data.frame")
  df[["stick"]] %>% is.sticky %>% expect_true()
  df[["non.stick"]] %>% is.sticky %>% expect_false()

  df <- df %>% sticky_all()

  df[["stick"]] %>% is.sticky %>% expect_true()
  df[["non.stick"]] %>% is.sticky %>% expect_true()
})

test_that( "sticky_all-data.table", {
  context("  data.table")
  dt[["stick"]] %>% is.sticky %>% expect_true()
  dt[["non.stick"]] %>% is.sticky %>% expect_false()


  dt <- dt %>% sticky_all()

  dt[["stick"]] %>% is.sticky %>% expect_true()
  dt[["non.stick"]] %>% is.sticky %>% expect_true()

})

dt %<>% structure( foo = "bar")

