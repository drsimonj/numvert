#
#
# Functions that change the scale
#
#

#' Standardize a numeric vector
#'
#' @export
#' @param x Numeric vector
#' @param new_mean Numeric value of new mean
#' @param new_sd Numeric value of new standard deviation
num_standardize <- function(x, new_mean = 0, new_sd = 1) {
  x_mean <- mean(x, na.rm = TRUE)
  x_sd   <- sd(x, na.rm = TRUE)

  (x - x_mean) / x_sd * new_sd + new_mean
}

#' @rdname num_standardise
#' @export
num_standardise <- function(x, new_mean = 0, new_sd = 1) {
  num_standardize(x = x, new_mean = new_mean, new_sd = new_sd)
}

#' Rescale a numeric vector
#'
#' @export
#' @param x Numeric vector
#' @param new_min Numeric value of new minimum
#' @param new_max Numeric value of new maximum
num_rescale <- function(x, new_min = 0, new_max = 1) {
  if (any(is.infinite(x)))
    stop("`x` possesses inifinite values and cannot be rescaled")

  if (new_max <= new_min)
    warning("`new_max` is not greater than `new_min`")

  x_max <- max(x, na.rm = TRUE)
  x_min <- min(x, na.rm = TRUE)

  (new_max - new_min) / (x_max - x_min) * (x - x_max) + new_max
}

#' Normalize a numeric vector
#'
#' Special case of \code{\link{num_rescale}}() with new minimum of 0 and maximum
#' of 1
#'
#' @export
#' @inheritParams num_rescale
num_normalize <- function(x) {
  num_rescale(x, new_min = 0, new_max = 1)
}

#' @rdname num_normalise
#' @export
num_normalise <- function(x) {
  num_normalize(x = x)
}
