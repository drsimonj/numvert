#
#
# Functions that treats outliers
#
#

#' Cap a numeric vector at a specified value
#'
#' Replace all elements of a numeric vector that are above a specified value
#' with another value
#'
#' @export
#' @param x Numeric vector
#' @param cap Value above which to replace
#' @param replacement Value with which to replace elements above cap
cap_at <- function(x, cap, replacement = NA) {
  x[x > cap] <- replacement
  x
}

#' Floor a numeric vector at a specified value
#'
#' Replace all elements of a numeric vector that are below a specified value
#' with another value
#'
#' @export
#' @param x Numeric vector
#' @param floor Value below which to replace
#' @param replacement Value with which to replace elements below floor
floor_at <- function(x, floor, replacement = NA) {
  x[x < floor] <- replacement
  x
}

