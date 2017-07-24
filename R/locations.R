#
#
# Functions that locate values and boundaries
#
#

#' Locate quantile boundaries of a numeric vector
#'
#' \code{num_quantile}() is a wrapper for \code{\link[stats]{quantile}}() with
#' different default values
#'
#' @export
#' @inheritParams stats::quantile
#'
#' @examples
#' num_quantile(c(1, 2, 3, 4, NA), c(.2, .8))
num_quantile <- function(x, probs = c(0, 1), na.rm = TRUE, names = FALSE, ...) {
  quantile(x, probs, na.rm = na.rm, names = names, ...)
}
