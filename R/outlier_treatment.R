#
#
# Functions that treat outliers
#
#

#' Truncate proportion of numeric vector
#'
#' Truncate a proportion of elements from the top, bottom, or both tails of a
#' numeric vector by replacing them with NA
#'
#' @export
#' @param x Numeric vector
#' @param prop Proportion of data to target
#' @param tail Tail(s) to target
#'
#' @examples
#' num_truncate(0:10, .4)
#' num_truncate(0:10, .4, "top)
num_truncate <- function(x, prop, tail = c("both", "top", "bottom")) {
  props <- p_to_quantiles(prop, tail)
  taget_vals <- quantile(x, props, na.rm = TRUE)

  x[x < taget_vals[1] | x > taget_vals[2]] <- NA
  x
}

#' Truncate numeric vector using interquartile range
#'
#' Truncate elements of a numeric vector that fall outside the range defined by
#' the vector's mean, plus/minus the interquartile range (IQR) multipled by some
#' value (1.5 by default)
#'
#' @export
#' @param x Numeric vector
#' @param iqr_multipler Value by which to multiply the IQR when calculating the
#'   target boundary
#'
#' @examples
#' boxplot(iris$Sepal.Width)  # Outliers present
#' boxplot(num_truncate_iqr(iris$Sepal.Width))  # Outliers removed
#'
num_truncate_iqr <- function(x, iqr_multipler = 1.5) {
  if (iqr_multipler <= 0)
    stop("`iqr_multipler` must be a value greater than zero")

  qs <- quantile(x, c(.25, .75), na.rm = TRUE)
  weighted_iqr <- iqr_multipler * (qs[2] - qs[1])
  x_mean <- mean(x, na.rm = TRUE)

  x[x < (x_mean - weighted_iqr) | x > (x_mean + weighted_iqr)] <- NA
  x
}

#' Censor proportion of a numeric vector
#'
#' Censor a proportion of elements from the top, bottom, or both tails of a
#' numeric vector by replacing them with the boundary value(s)
#'
#' @export
#' @inheritParams num_truncate
#'
#' @examples
#' num_censor(0:10, .4)
#' num_censor(0:10, .4, "top)
num_censor <- function(x, prop, tail = c("both", "top", "bottom")) {
  props <- p_to_quantiles(prop, tail)
  taget_vals <- quantile(x, props, na.rm = TRUE)

  x[x < taget_vals[1]] <- taget_vals[1]
  x[x > taget_vals[2]] <- taget_vals[2]
  x
}


#' Convert single probability and tail method to two quantiles
p_to_quantiles <- function(prop, tail = c("both", "top", "bottom")) {
  tail <- match.arg(tail)

  if(prop <= 0 | prop >= 1)
    stop("`prop` must be a value between 0 and 1")

  switch(tail,
    both   = c(prop/2, 1 - prop/2),
    top    = c(0, 1 - prop),
    bottom = c(prop, 1)
  )
}
