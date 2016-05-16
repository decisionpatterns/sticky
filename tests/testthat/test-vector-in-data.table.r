# DATA TABLE
# ----------

set_foo <- function(x, value="bar") {
    attr(x,'foo') = 'bar'
    return(x)
}



if( library(data.table, quietly = TRUE, logical.return=TRUE) ) {

  context('vector in data.table')

  x <- 1:5 %>% sticky %>% set_foo
  y <- letters[1:5]

  dt <- data.table( stick=x, non.stick=y)


  dt %>% expect_is('data.table')
  dt$non.stick %>% is.sticky %>% expect_false

  context('  $ ')
  dt$stick %>% expect_is('sticky')
  dt$stick %>% attr('foo') %>% expect_equal('bar')


  context('  [[')
  dt[[1]] %>% expect_is('sticky')
  dt[[1]][1:3] %>% expect_is('sticky')
  dt[[1]][1:3] %>% attr('foo') %>% expect_equal('bar')

  dt[['stick']] %>% expect_is('sticky')
  dt[['stick']] %>% attr('foo') %>% expect_equal('bar')


  context('  [')
  # dt %>% class %>% message
  # dt[1:3, 'stick', with=FALSE ]
  # dt[1:3, 'stick', with=FALSE ][[1]] %>% class %>% message


  # Simple by column name
  dt[, 'stick', with=FALSE, drop=TRUE ]  %>% expect_is('sticky')
  dt[, 'stick', with=FALSE, drop=TRUE ]  %>% attr('foo') %>% expect_equal('bar')

  dt[, 'non.stick', with=FALSE, drop=TRUE ] %>% is.sticky %>% expect_false()

  # Filter by column index
  dt[1:3, 1, with=FALSE, drop=TRUE] %>% expect_is('sticky')
  dt[1:3, 1, with=FALSE, drop=TRUE] %>% attr('foo') %>% expect_equal('bar')

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
