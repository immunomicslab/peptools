
<!-- README.md is generated from README.Rmd. Please edit that file -->

# peptools

<!-- badges: start -->
<!-- badges: end -->

The goal of peptools is to …

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
#>  [1] "NMLMTQSID" "ISCTESWMV" "WRFPFGVLV" "CIMIPALVW" "LNESMRCDR" "PKMMCHWIC"
#>  [7] "IHDINDLGS" "EDHWKMNVY" "CGMYVFYVR" "SLHDEAAGI"
```
