test_that("get_packages2() works", {
  vcr::use_cassette("packages2", {
    pkgs <- get_packages2("maelle")
  })
  expect_vector(pkgs, character())
})

test_that("get_packages2() error", {
  withr::local_envvar("SECRET_PLANET_TOKEN" = "")
  expect_snapshot_error(get_packages2("maelle"))
})

test_that("get_packages2() works", {
  skip_if_not_beyonce()
  vcr::use_cassette("packages2-skip", {
    pkgs <- get_packages2("maelle")
  })
  expect_equal(pkgs[2], "bla")
})
