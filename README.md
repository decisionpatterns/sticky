## Sticky Attributes: Persist attributes through data manipulations.

[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) 
[![CRAN](http://www.r-pkg.org/badges/version/sticky.attributes)](https://cran.rstudio.com/web/packages/sticky.attributes/index.html)
[![Downloads](http://cranlogs.r-pkg.org/badges/sticky.attributes?color=brightgreen)](http://www.r-pkg.org/pkg/sticky.attributes)


Sticky attributes are additional functionality that make attributes resilent 
various manipulations operations including:

- subset
- extend
- append
- insertion into a list-like object such as a data.frame or data.table
- slices from a data.frame or data.table

Basically, the attributes stick with the object much like attributes do in other
languages.


## Example

Here is an example of a sticky attribute in action.

    x <- 1:5
    attr(x, 'foo') <- 'bar'
    attr(x[1:3],'foo')        # NULL -- attribute removed 
    
    x <- sticky(x)
    attr(x[1:3],'foo')        # 'bar' -- attribute preserved    

For more examples see the vignette that accompanies the package.


## Installation 

### Github

    libraty(devtools)
    lnstall_github('decisionpatterns/sticky.attributes')


### CRAN (coming soon)

    install.packages('sticky.attributes')
    
