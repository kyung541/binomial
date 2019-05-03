This is a package name "binomial" that careate by a  student in University of Californai, Berkeley. Please be aware that this function is not yet perfect. 
# binomial

## Overview
-----------
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
---------
This package has been developed to help user to get all the infomation they need for binomial variable in a very fast and easy way. 

## Installation
----------
Install the development version from GitHub via the package `"devtools"`:

```r
# development version from GitHub:
install.packages("devtools") 
# install "cointoss"
devtools::install_github("ucb-stat133/cointoss")
```

## Usage
----------

```{r}
library(binomial)
# default random binomial variable where n = trials and k = success
variable <- bin_choose( n = 5, k = 2)
variable 
#>10

# Calculate the probaility 
binpro = bin_probability(success = 2, trials=5, prob=0.5)
binpro
#> 0.315

# Calculating the binomial distribution
bindist = bin_distribution(trials = 5, prob = 0.5)
bindist

# plot the binomial distribution
bindistrP = plot(bindist)
bindistrP

#  Calculating the binomial cumulative distributioon 
bincumu = bin_cumulative(trials = 5, prob = 0.5)
bincumu

# Plot the binomial cumulative dirtribution
bincumuP = plot(bincumu)
bincumuP

# Listing the variables 
binvar = bin_variable(trials = 10, prob = 0.3)
binvar

# Summary of the variables
binvarsum = summary(binvar)
binvarsum

```
