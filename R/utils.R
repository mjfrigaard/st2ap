#' Inverted versions of `%in%`
#'
#' @export
#'
#' @examples
#' 1 %nin% 1:10
#' "A" %nin% 1:10
`%nin%` <- function(x, table) {
  match(x, table, nomatch = 0) == 0
}

#' Create a comma-separated list from a vector
#'
#' @param x vector
#'
#' @return comma, separated, & list
#' @export vec_to_csl
#'
#' @examples
#' vec_to_csl(x = mtcars$disp)
vec_to_csl <- function(x) {
  all_chrs <- as.character(unique(x))
  comma_chrs <- paste0(all_chrs[1:length(all_chrs) - 1], collapse = ", ")
  lst_chrs <- paste0(comma_chrs, " & ", all_chrs[length(all_chrs)])
  return(lst_chrs)
}

#' Custom `skimr::skim()` for numeric variables
#'
#' @description
#' The custom `skimr::skim_with()`
#'
#' @export df_skim
#'
#' @importFrom skimr skim_with skim sfl
#' @examples
#' require(dplyr)
#' df_skim(dplyr::starwars)
df_skim <- function(df) {
  skims <- list(numeric =
                    skimr::sfl(min = ~ min(., na.rm = TRUE),
                               med = ~ median(., na.rm = TRUE),
                               max = ~ max(., na.rm = TRUE),
                               p0 = NULL, p25 = NULL, p50 = NULL,
                               p75 = NULL, p100 = NULL),
                factor =
                    skimr::sfl(ordered = NULL),
                character =
                    skimr::sfl(min = NULL, max = NULL,
                               whitespace = NULL))
  df_skim <- skimr::skim_with(!!!skims)
  df_skim(df)
}

#' Deconstruct R objects
#'
#' @param x R object passed to `dput()`
#' @param quotes include quotes in the output
#' @param console logical, used in the console? If `FALSE`, then output is printed
#' with `base::noquote()`. If `TRUE`, output is returned with `cat()`
#'
#' @return Deparsed object
#' @export deconstruct
#'
#'
#' @examples
#' x <- deconstruct(names(mtcars), return = TRUE)
#' x
#' deconstruct(names(mtcars))
deconstruct <- function(x, return = FALSE, quote = TRUE) {
  raw_obj <- capture.output(dput(x, control = "all"))
  if (isFALSE(quote)) {
    obj_noquote <- gsub(pattern = '"', replacement = "", x = raw_obj)
    decon_noquote <- paste0(obj_noquote, collapse = "")
    decon_obj <- gsub("\\s+", " ", decon_noquote)
  } else {
    obj_quote <- gsub(pattern = '"', replacement = "'", x = raw_obj)
    decon_quote <- paste0(obj_quote, collapse = "")
    decon_obj <- gsub("\\s+", " ", decon_quote)
  }
  if (isFALSE(return)) {
    base::cat(decon_obj)
  } else {
    return(noquote(decon_obj))
  }
}
