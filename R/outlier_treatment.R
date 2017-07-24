#
#
# Functions that treat outliers
#
#

#' Truncate numeric vector
#'
#' Truncate top and/or bottom of a numeric vector by replacing with NA
#'
#' @export
#' @param x Numeric vector
#' @param bounds Two-element numeric vector defining the lower and upper bounds
#'   (in that order)
#'
#' @examples
#' num_truncate(0:10, c(2, 8))
num_truncate <- function(x, bounds = c(-Inf, Inf)) {
  if (length(bounds) != 2)
      stop("`bounds` must be a numeric vector with two elements")
  if(bounds[1] >= bounds[2])
    stop("The first number in `bounds` must be lower than the second")

  x[x < bounds[1] | x > bounds[2]] <- NA
  x
}

#' Censor numeric vector
#'
#' Censor top and/or bottom of a numeric vector by replacing with the boundary
#' value(s)
#'
#' @export
#' @inheritParams num_truncate
#'
#' @examples
#' num_censor(0:10, c(2, 8))
num_censor <- function(x, bounds = c(-Inf, Inf)) {
  if (length(bounds) != 2)
    stop("`bounds` must be a numeric vector with two elements")
  if(bounds[1] >= bounds[2])
    stop("The first number in `bounds` must be lower than the second")

  x[x < bounds[1]] <- bounds[1]
  x[x > bounds[2]] <- bounds[2]
  x
}
