library(shinytest2)

test_that("dataStrApp() initial values are consistent", {
  shiny_app <- tsap::dataStrApp(testing = TRUE)
  app <- AppDriver$new(shiny_app, height = 596, width = 1156)
  app$expect_values()
})