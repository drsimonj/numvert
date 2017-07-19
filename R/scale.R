#
#
# Functions that change the scale
#
#


#' Standardise a numeric vector
#'
#' @export
#' @param x Numeric vector
#' @param new_mean Numeric value of new mean
#' @param new_sd Numeric value of new standard deviation
standardize <- function(x, new_mean = 0, new_sd = 1) {
  x_mean <- mean(x, na.rm = TRUE)
  x_sd   <- sd(x, na.rm = TRUE)

  (x - x_mean) / x_sd * new_sd + new_mean
}

#' @export
#' @rdname standardize
standardise <- function(...) {
  standardize(...)
}

#' Rescale a numeric vector
#'
#' @export
#' @param x Numeric vector
#' @param new_min Numeric value of new minimum
#' @param new_max Numeric value of new maximum
rescale <- function(x, new_min = 0, new_max = 1) {
  if (new_max <= new_min)
    warning("`new_max` is not greater than `new_min`")

  x_max <- max(x, na.rm = TRUE)
  x_min <- min(x, na.rm = TRUE)

  (new_max - new_min) / (x_max - x_min) * (x - x_max) + new_max
}

#' Normalise a numeric vector
#'
#' Special case of \code{\link{rescale}}() with new minimum of 0 and maximum of
#' 1
#'
#' @export
#' @inheritParams rescale
normalize <- function(x) {
  rescale(x, new_min = 0, new_max = 1)
}

#' @export
#' @rdname normalize
normalise <- function(...) {
  normalize(...)
}
