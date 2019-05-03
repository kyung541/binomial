context("check if all the aux function work perfectly")

test_that("auxiliary mean is working perfectly", {
  expect_equal(aux_mean(0,0), 0)
  expect_equal(aux_mean(10,0.3), 3)
  expect_length(aux_mean(10,0.3),1)
  expect_type(aux_mean(10,0.3), "double")
})

test_that("auxiliary variance is working perfectly", {
  expect_equal(aux_variance(0,0), 0)
  expect_equal(aux_variance(10,0.3), 2.1)
  expect_length(aux_variance(10,0.3),1)
  expect_type(aux_variance(10,0.3), "double")
})

test_that("auxiliary mode is working perfectly", {
  expect_equal(aux_mode(1,0),0)
  expect_equal(aux_mode(10,0.3), 3)
  expect_length(aux_mode(10,0.3),1)
  expect_type(aux_mode(10,0.3), "double")
})

test_that("auxiliary skewness is working perfectly", {
  expect_equal(aux_skewness(0,0),Inf)
  expect_length(aux_skewness(10,0.3),1)
  expect_warning(aux_skewness(10,2), "")
})

test_that("auxiliary kurtosis is working perfectly", {
  expect_equal(aux_kurtosis(0,0),Inf)
  expect_length(aux_kurtosis(10,0.3), 1)
  expect_error(aux_kurtosis(10), "")
})
