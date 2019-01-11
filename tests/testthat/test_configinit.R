context("configinit")

configinit(list(optval="optval"), cfg="")

test_that("with configinit(list(optval='optval'), cfg='')", {
  expect_equal(getOption("optval"), "optval")
})

configinit(list(optval="opt", cfg=""))

test_that("replace ty configinit(list(optval='optval'), cfg='')", {
  expect_equal(getOption("optval"), "opt")
})

configinit()

test_that("reinitial won't remove old value", {
  expect_equal(getOption("optval"), "opt")
})

configinit(list(optval="optval"), cfg="../../inst/extdata/01-example.yml")

test_that("val list has higher order", {
  expect_equal(getOption("optval"), "optval")
})

configinit(cfg="../../inst/extdata")

test_that("greater file has highter order", {
  expect_equal(getOption("optval"), "example_02.yml")
})

test_that("omit bad yaml file", {
  expect_equal(getOption("optval"), "example_02.yml")
})

test_that("list returns as list", {
  expect_equal(getOption("config_list"),
               list(a=10, b=100, l=list(l1="a", l2="b")))
})
