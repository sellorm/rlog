test_that("basic functionality is working", {
  expect_true(log_info("info"))
  expect_false(log_trace("trace"))
  expect_output(log_info("INFO"))
  expect_silent(log_trace("TRACE"))
})

test_that("default functionality is OK", {
  Sys.unsetenv("LOG_LEVEL")
  expect_true(log_fatal("FATAL"))
  expect_true(log_error("ERROR"))
  expect_true(log_warn("WARN"))
  expect_output(log_info("INFO"))
  expect_silent(log_debug("DEBUG"))
  expect_silent(log_trace("TRACE"))
})

test_that("default functionality is OK", {
  Sys.setenv("LOG_LEVEL" = "TRACE")
  expect_true(log_fatal("FATAL"))
  expect_true(log_error("ERROR"))
  expect_true(log_warn("WARN"))
  expect_output(log_info("INFO"))
  expect_output(log_debug("DEBUG"))
  expect_output(log_trace("TRACE"))
})

test_that("output is going going to the correct stdout/stderr", {
  expect_match(capture.output(log_warn("warn"), type = "message"), "warn$")
  expect_match(capture.output(log_error("error"), type = "message"), "error$")
  expect_match(capture.output(log_fatal("fatal"), type = "message"), "fatal$")
})
