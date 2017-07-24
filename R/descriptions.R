#
#
# Functions that describe
#
#

#' Describe numerc vector interquartile range (IQR)
#'
#' Calculate the interquartile range (IQR) of a numeric vector.
#'
#' @export
#' @param x Numeric vector
#'
#' @examples
#' num_iqr(1:10)
#' num_iqr(rnorm(1000, sd = 10))
num_iqr <- function(x) {
  qs <- num_quantile(x, c(.25, .75))
  qs[2] - qs[1]
}
