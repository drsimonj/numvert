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

#' #' Truncate numeric vector using interquartile range
#' #'
#' #' Truncate elements of a numeric vector that fall outside the range defined by
#' #' the vector's mean, plus/minus the interquartile range (IQR) multipled by some
#' #' value (1.5 by default)
#' #'
#' #' @export
#' #' @param x Numeric vector
#' #' @param iqr_multipler Value by which to multiply the IQR when calculating the
#' #'   target boundary
#' #'
#' #' @examples
#' #' boxplot(iris$Sepal.Width)  # Outliers present
#' #' boxplot(num_truncate_iqr(iris$Sepal.Width))  # Outliers removed
#' #'
#' num_truncate_iqr <- function(x, iqr_multipler = 1.5) {
#'   if (iqr_multipler <= 0)
#'     stop("`iqr_multipler` must be a value greater than zero")
#'
#'   qs <- quantile(x, c(.25, .75), na.rm = TRUE)
#'   weighted_iqr <- iqr_multipler * (qs[2] - qs[1])
#'   x_mean <- mean(x, na.rm = TRUE)
#'
#'   x[x < (x_mean - weighted_iqr) | x > (x_mean + weighted_iqr)] <- NA
#'   x
#' }

#' Censor a numeric vector
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


#' #' Convert single probability and tail method to two quantiles
#' p_to_quantiles <- function(prop, tail = c("both", "top", "bottom")) {
#'   tail <- match.arg(tail)
#'
#'   if(prop <= 0 | prop >= 1)
#'     stop("`prop` must be a value between 0 and 1")
#'
#'   switch(tail,
#'     both   = c(prop/2, 1 - prop/2),
#'     top    = c(0, 1 - prop),
#'     bottom = c(prop, 1)
#'   )
#' }
