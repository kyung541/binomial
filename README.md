This is a package name "binomial" that careate by a  student in University of Californai, Berkeley. Please be aware that this function is not yet perfect. 
# binomial

##Overview
`"binomial"` is a minimal [R](http://www.r-project.org/) package 
that provides functions to calculate a random binomial variable.

* `bin_choose()` creates a random binomial variable object (of class `"numeric"`)
* `bin_probability()` calculate the probability of the chosen variable, producing a `"numeic"` object.
* `bin_distribution()` create a data frame that display the distribution of the chosen variable (of class `"bindis"` **and** `"data.frame"`)
* `plot()` method for a `"bindis"` object to plot frequencies of probability of success.
* `"bin_cumulative()"` create a data frame which display the cumulative probability as well as the distribution as well ( of class `"bincum"` **and** `"data.frame"`)
* `plot()` method for a `"bincum"` object to plot the frequecies of the cumulative of success. 
* `"bin_variable()"` calcuate different satistical information for the choosen objects (of class `binvar`), eg., `mean, mode,variance, skewness **and** kurtosis`. To do show, there are private function such as `"aux_mean()"`, `"aux_variable()"` and `"aux_mode()"` etc that will help us calculate using the imformation you input. 
* `summary()` method for a `"binvar"` object ( create into object of class `"summary.binvar"`)
* `print()` method for a `"summary.binvar"` object to display in a user-freindly way

## Motivation 
This package has been developed to help user to get all the infomation they need for binomial variable in a very fast and easy way. 

## Installation

Install the development version from GitHub via the package `"devtools"`:

```r
# development version from GitHub:
install.packages("devtools") 
# install "cointoss"
devtools::install_github("ucb-stat133/cointoss")
```

## Usage

```{r}
library(binomial)
# default random binomial variable 
variable <- bin_choose( trials, success)
variable 

coin1
# 1 toss of coin1
toss(coin1)
# 10 tosses of coin1
toss10 <- toss(coin1, times = 10)
toss10
# summary
summary(toss10)
# 100 tosses
toss100 <- toss(coin1, times = 100)
# summary
summary(toss100)
```
