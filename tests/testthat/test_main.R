context("Check if All the main function work perfectly")

test_that("Valid binomial formula", {
  expect_is(bin_choose(5,2), "numeric")
  expect_error(bin_choose(2,5), "k cannot be greater than n")
  expect_warning(bin_choose(5,1:3),"" )
})

test_that("Valid Binomial Probaility",{
  expect_is(bin_probability(2,5,0.5), "numeric")
  expect_error(bin_probability(5,2,0.5), "success cannot be greater than trials")
  expect_error(bin_probability(-3,2,0.5), "invalid success value")
  expect_length(bin_probability(2,3,0.5), 1)
})

test_that("Valid Binomial distribution",{
  expect_is(bin_distribution(5,0.5), "bindis")
  expect_is(bin_distribution(5,0.5), "data.frame")
  expect_error(bin_distribution(0,2), "invalid prob value")
  expect_warning(bin_distribution(4,0.5), " ")
})

test_that("Valid Binomial Cumulative", {
  expect_is(bin_cumulative(5,0.5), c("bincum", "data.frame"))
  expect_error(bin_cumulative(3.6,0.5), "trials must be non-negative integer")
  expect_warning(bin_cumulative(3,0.5), " ")
})
test_that("Valid Binomial Variable",{
  expect_is(bin_variable(10,0.3), "binvar")
  expect_error(bin_variable(0.9,2), "trials must be non-negative integer")
  expect_error(bin_variable(2,10), "invalid prob value")
  expect_length(bin_variable(2,0.5), 2)
})
