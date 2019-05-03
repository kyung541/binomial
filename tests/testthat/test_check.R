context("Check if all the check function work perfectly")

test_that("Trials is valild", {
  expect_true(check_trials(3))
  expect_gte(check_trials(0), 0)
  expect_error(check_trials(-10), "invalid trials value")
})

test_that("Probability is valid",{
  expect_true(check_prob(0.5))
  expect_length(check_prob(0.5), 1)
  expect_error(check_prob(2), "invalid prob value")
})

test_that("Success is valid",{
  expect_true(check_success(3,5))
  expect_error(check_success(-3,5), "invalid success value")
  expect_error(check_success(5,3), "success cannot be greater than trials")
  expect_type(check_success(3,5), "logical")
})




