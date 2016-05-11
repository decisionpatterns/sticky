## Sticky Attributes: Persist attributes through data manipulations.

[![License](https://img.shields.io/badge/core-MPL--2-brightgreen.svg)](https://www.mozilla.org/en-US/MPL/2.0/) 
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


## Installation 

    libraty(devtools)
    lnstall_github('decisionpatterns/sticky.attributes')