
<!-- README.md is generated from README.Rmd. Please edit that file -->

# peptools

<!-- badges: start -->
<!-- badges: end -->

This is a work in progress…!

## Installation

You can install the development version of peptools from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("immunomicslab/peptools")
```

## Example

- First we load the library

``` r
library(peptools)
```

- Then, we can use `pep_ran()` to generate 10 random 9-mers

``` r
pep_ran(n = 10, k = 9)
#>  [1] "KQKWIMLEL" "SRNSPYEPN" "VILWCRKMI" "MPDKDFSMR" "NEHGIICPY" "HACIHVFNY"
#>  [7] "CSEAPQFID" "MKQCACWFL" "LMPEMWNNK" "KYNLFRNTY"
```
