#
#
# Functions that locate values and boundaries
#
#

#' Locate quantile boundaries of a numeric vector
#'
#' \code{num_quantiles is a wrapper for \code{\link[stats]{quantile}} that
#' sets the default values slightly differently
#'
#' @export
#' @inheritParams stats::quantile
#'
num_quantile <- function(x, probs = c(0, 1), na.rm = TRUE, names = FALSE, ...) {
  quantile(x, probs, na.rm = na.rm, names = names, ...)
}
