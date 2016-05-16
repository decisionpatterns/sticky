## Sticky: Persist attributes through data manipulations

[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) 
[![CRAN](http://www.r-pkg.org/badges/version/sticky.attributes)](https://cran.rstudio.com/web/packages/sticky.attributes/index.html)
[![Downloads](http://cranlogs.r-pkg.org/badges/sticky.attributes?color=brightgreen)](http://www.r-pkg.org/pkg/sticky.attributes)

In base R, attributes when the objects they described are changed. By marking 
objects 'sticky', attributes become resilent to normal data manipulation 
operations: subsetted, extended, appended, etc. or when inserted into or 
extracted from list-like objects such as data frames or data tables. It works on
both atomic and recursive objects.

Basically, sticky attributes stick with the object much like attributes of 
other programming languages. There isn't much to the package. The `sticky` 
function and it's complement, `unstick` are the only interfaces to the package.


## Example

Here is an simple example of a sticky attribute in action. Under base R, 
attributes do not survive a slice/subset/`[` operation: 

    x <- 1:5
    attr(x, 'foo') <- 'bar'
    attr(x[1:3],'foo')        # NULL -- attribute removed 

To ensure that they get preserved, simply declare the object as `sticky`:

    x <- sticky(x)
    attr(x[1:3],'foo')        # 'bar' -- attribute preserved    

That it. The `sticky` function (and it's complement, `unstick`) are the only 
interface to the package.


## Installation 

### Stable Version: CRAN (coming soon)

    install.packages('sticky.attributes')

### Development Version: Github

    libraty(devtools)
    lnstall_github('decisionpatterns/sticky.attributes')


## Use Cases

There are a number of things that can be done with `sticky`:

 * Preserve attributes of atomic or recursive objects
 * Ensure that attributes of vectors in data.[frame|table] are preserved
 * Build a basic class system.


## References

The issue of attribute resilence has been often asked and debated. Here are a 
few of the most prevalent discussions.

- [loss-of-attributes-despite-attempts-to-preserve-them](http://stackoverflow.com/questions/23991060/loss-of-attributes-despite-attempts-to-preserve-them)
- [how-to-delete-a-row-from-a-data-frame-without-losing-the-attributes](http://stackoverflow.com/questions/10404224/how-to-delete-a-row-from-a-data-frame-without-losing-the-attributes)
- [approaches-to-preserving-objects-attributes-during-extract-replace-operations](http://stackoverflow.com/questions/23841387/approaches-to-preserving-objects-attributes-during-extract-replace-operations)
- [indexing-operation-removes-attributes](http://stackoverflow.com/questions/13432519/indexing-operation-removes-attributes)
