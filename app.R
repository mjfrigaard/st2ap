# run app for package
# options(shiny.testmode = TRUE)

pkgload::load_all(export_all = FALSE, helpers = TRUE, attach_testthat = TRUE)

library(st2ap)

st2ap::strApp()
