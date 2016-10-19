# DATA TABLE
# ----------

library(magrittr)
source('utils.r')


if( library(data.table, quietly = TRUE, logical.return=TRUE) ) {

  context('vector in data.table')

  x <- 1:5 %>% sticky %>% set_foo
  y <- letters[1:5]   %>% set_foo

  dt <- data.table( stick=x, non_stick=y )

  test_that('is', {
    dt %>% expect_is('data.table')
    dt$non_stick %>% is.sticky %>% expect_false
  })

  test_that('$', {
    dt$stick %>% expect_is('sticky')
    dt$stick %>% attr('foo') %>% expect_equal('bar')
    dt$non_stick %>% attr('foo') %>% expect_equal('bar')
  })

  test_that('[[', {
    dt[[1]] %>% expect_is('sticky')
    dt[[1]][1:3] %>% expect_is('sticky')
    dt[[1]][1:3] %>% attr('foo') %>% expect_equal('bar')

    dt[['stick']] %>% expect_is('sticky')
    dt[['stick']] %>% attr('foo') %>% expect_equal('bar')

    dt[[2]] %>% is.sticky() %>% expect_false()
    dt[[2]][1:3] %>% is.sticky() %>% expect_false()
    dt[[2]][1:3] %>% attr('foo') %>% expect_null()


    dt[['non_stick']] %>% is.sticky() %>% expect_false()
    dt[['non_stick']] %>% attr('foo') %>% expect_equal('bar')
  })

  test_that('[', {

    # Simple by column name

    dt[, 'stick', with=FALSE, drop=FALSE ][[1]] %>% is.sticky %>% expect_true()
    dt[, 'stick', with=FALSE, drop=FALSE ][[1]] %>% attr('foo') %>% expect_equal('bar')

    dt[, 'non_stick', with=FALSE, drop=FALSE ][[1]] %>% is.sticky %>% expect_false()
    dt[, 'non_stick', with=FALSE, drop=FALSE ][[1]] %>% attr('foo') %>% expect_equal('bar')

    # Filter by column index
    dt[1:3, 1, with=FALSE, drop=FALSE][[1]] %>% expect_is('sticky')
    dt[1:3, 1, with=FALSE, drop=FALSE][[1]] %>% expect_is('sticky')
    dt[1:3, 1, with=FALSE, drop=FALSE][[1]] %>% attr('foo') %>% expect_equal('bar')

  })

}
