#
#
# Functions that treat outliers
#
#

#' Truncate numeric vector at specified value(s)
#'
#' Replace elements of a numeric vector identified by specific cut point(s)
#'
#' @export
#' @param x Numeric vector
#' @param below Value below which to truncate
#' @param above Value above which to truncate
#'
#' @examples
#' num_truncate(0:10, 2, 8)
#' num_truncate_below(0:10, 2)
#' num_truncate_above(0:10, 8)
#'
num_truncate <- function(x, below = -Inf, above = Inf) {
  x <- num_truncate_below(x, below)
  x <- num_truncate_above(x, above)
  x
}

#' @rdname num_truncate
#' @export
num_truncate_below <- function(x, below) {
  x[x < below] <- NA
  x
}

#' @rdname num_truncate
#' @export
num_truncate_above <- function(x, above) {
  x[x > above] <- NA
  x
}
