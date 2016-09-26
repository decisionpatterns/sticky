# DATA TABLE
# ----------

library(magrittr)
source('utils.r')


if( library(data.table, quietly = TRUE, logical.return=TRUE) ) {

  context('vector in data.table')

  x <- 1:5 %>% sticky %>% set_foo
  y <- letters[1:5]   %>% set_foo

  dt <- data.table( stick=x, non_stick=y)


  dt %>% expect_is('data.table')
  dt$non_stick %>% is.sticky %>% expect_false

  context('  $ ')
  dt$stick %>% expect_is('sticky')
  dt$stick %>% attr('foo') %>% expect_equal('bar')

  dt$non_stick %>% attr('foo') %>% expect_equal('bar')


  context('  [[')
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


  context('  [')

  # Simple by column name

  dt[, 'stick', with=FALSE, drop=FALSE ][[1]] %>% is.sticky %>% expect_true()
  dt[, 'stick', with=FALSE, drop=FALSE ][[1]] %>% attr('foo') %>% expect_equal('bar')

  dt[, 'non_stick', with=FALSE, drop=FALSE ][[1]] %>% is.sticky %>% expect_false()
  dt[, 'non_stick', with=FALSE, drop=FALSE ][[1]] %>% attr('foo') %>% expect_equal('bar')

  # Filter by column index
  dt[1:3, 1, with=FALSE, drop=FALSE][[1]] %>% expect_is('sticky')
  dt[1:3, 1, with=FALSE, drop=FALSE][[1]] %>% expect_is('sticky')
  dt[1:3, 1, with=FALSE, drop=FALSE][[1]] %>% attr('foo') %>% expect_equal('bar')


  # # Filter by column and row
#  browser()
  # t <- data.table:::`[.data.table`( dt, 1:3, list(stick) )
  # t[[1]] %>% expect_is('sticky')

#  dt[1:3,1:2,with=FALSE]
#  dt[1:2, stick][,1,with=FALSE] %>% attr('foo') %>% expect_equal('bar')
#
#   dt[1:3, 'stick', with=FALSE] %>% expect_is('sticky')
#   dt[1:3, 'stick', with=FALSE] %>% attr('foo') %>% expect_equal('bar')

#   dt[1:3, 1, with=FALSE] %>% expect_is('sticky')
#   dt[1:3, 1, with=FALSE] %>% attr('foo') %>% expect_equal('bar')
#
#   context('dt/add column')
#
#   dt$stick2 <- x
#
#   dt$stick2 %>% expect_is('sticky')
#   dt$stick2 %>% attr('foo') %>% expect_equal('bar')

}
