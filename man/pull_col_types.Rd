% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pull_col_types.R
\name{pull_col_types}
\alias{pull_col_types}
\title{Column type names}
\usage{
pull_col_types(data, type)
}
\arguments{
\item{data}{\code{data.frame}/\code{tibble}}

\item{type}{one of "numerics", "dates", "characters", "factors", "list"}
}
\value{
data.frame/tibble filtered by function
}
\description{
Column type names
}
\examples{
require(dplyr)
pull_col_types(movies, "numerics")
pull_col_types(movies, "dates")
pull_col_types(starwars, "lists")
}
