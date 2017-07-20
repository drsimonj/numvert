
<!-- README.md is generated from README.Rmd. Please edit that file -->
numvert
=======

The goal of numvert is to help transform numeric vectors. Regardless of the operation, numvert functions take a numeric vector and return a numeric vector of the same length.

Installation
------------

You can install numvert from github with:

``` r
# install.packages("devtools")
devtools::install_github("drsimonj/numvert")
```

Example
-------

This example shows you how to conduct common rescaling operations with numvert:

``` r
# Create a normally distributed variable with a mean of 25 and SD of 5
x <- rnorm(1000, mean = 25, sd = 5)
hist(x)
```

![](README-example-1.png)

Use numvert to standardise or normalise it:

``` r
library(numvert)
```

``` r
# Normalise between 0 and 1
x_norm <- normalise(x)
hist(x_norm)
```

![](README-unnamed-chunk-3-1.png)

``` r
# Standardise to have mean of 0 and SD of 1
x_std <- standardise(x)
hist(x_std)
```

![](README-unnamed-chunk-4-1.png)

Pro tip: British and American spellings are supported (e.g., `normalize` and `normalise`)
