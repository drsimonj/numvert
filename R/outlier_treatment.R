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
#' @param prop Proportion of data to truncate
#' @param tail Tail(s) to truncate
#'
#' @examples
#' num_trunc(0:10, 2, 8)
num_trunc <- function(x, prop, tail = c("both", "top", "bottom")) {
  tail <- match.arg(tail)
  if(prop <= 0 | prop >= 1)
    stop("`prop` must be a value between 0 and 1")

  props <- switch(tail,
    both   = c(prop/2, 1 - prop/2),
    top    = c(0, 1 - prop),
    bottom = c(prop, 1)
  )

  trunc_vals <- quantile(x, props, na.rm = TRUE)

  x[x < trunc_vals[1] | x > trunc_vals[2]] <- NA
  x
}
