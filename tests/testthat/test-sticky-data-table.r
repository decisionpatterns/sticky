# DATA TABLE
# ----------

set_foo <- function(x, value="bar") {
    attr(x,'foo') = 'bar'
    return(x)
}

if( library(data.table, quietly = TRUE, logical.return=TRUE) ) {

  context('data.table')

  x <- 1:5 %>% sticky %>% set_foo
  y <- letters[1:5]

  dt <- data.table( yes=x, no=y)


  dt %>% expect_is('data.table')
  dt$no %>% is.sticky %>% expect_false

  context('  $ ')
  dt$yes %>% expect_is('sticky')
  dt$yes %>% attr('foo') %>% expect_equal('bar')


  context('  [[')
  dt[[1]] %>% expect_is('sticky')
  dt[[1]][1:3] %>% expect_is('sticky')
  dt[[1]][1:3] %>% attr('foo') %>% expect_equal('bar')

  dt[['yes']] %>% expect_is('sticky')
  dt[['yes']] %>% attr('foo') %>% expect_equal('bar')


  context('  [')
  # dt %>% class %>% message
  # dt[1:3, 'yes', with=FALSE ]
  # dt[1:3, 'yes', with=FALSE ][[1]] %>% class %>% message
#  dt[, 'yes', with=FALSE ][[1]] %>% class %>% message # %>% expect_is('sticky')

#   dt[1:3, 'yes', with=FALSE][[1]] %>% attr('foo') %>% expect_equal('bar')
#
#   dt[1:3, 'yes', with=FALSE] %>% expect_is('sticky')
#   dt[1:3, 'yes', with=FALSE] %>% attr('foo') %>% expect_equal('bar')

#   dt[1:3, 1, with=FALSE] %>% expect_is('sticky')
#   dt[1:3, 1, with=FALSE] %>% attr('foo') %>% expect_equal('bar')
#
#   context('dt/add column')
#
#   dt$yes2 <- x
#
#   dt$yes2 %>% expect_is('sticky')
#   dt$yes2 %>% attr('foo') %>% expect_equal('bar')

}
