

#' Recursive
#'
#' @param x numerice vector
#'
#' @export
rec_sum <- function(x) {
  cumsum(x)
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_min <- function(x) {
  cummin(x)
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_max <- function(x) {
  cummax(x)
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_prod <- function(x) {
  cumprod(x)
}

# other -------------------------------------------------------------------

rec_data <- function(x) {
  xlen <- NROW(x)
  xseq <- as.list(seq_len(xlen))
  frac <- lapply(xseq, function(x) x:length(x))
  lapply(x, function(x) x[frac])
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_mean <- function(x) {
  nsample <- length(x)
  out <- vector("numeric", length = nsample)
  out[1] <- x[1]
  for (i in 2:nsample) {
    out[i] <- (x[i] + out[i - 1])/2
  }
  out
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_median <- function(x) {
  nsample <- length(x)
  out <- vector("numeric", length = nsample)
  out[1] <- x[1]
  for (i in 2:nsample) {
    out[i] <- median(x[1:i])
  }
  out
}

mode_ <- function(x) {
  den <- density(x)
  den$x[which.max(den$y)]
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_mode <- function(x) {
  nsample <- length(x)
  out <- vector("numeric", length = nsample)
  out[1] <- x[1]
  for (i in 2:nsample) {
    out[i] <- mode_(x[1:i])
  }
  out
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_qtile <- function(x, qt = 0.05) {
  nsample <- length(x)
  out <- vector("numeric", length = nsample)
  out[1] <- x[1]
  for (i in 2:nsample) {
    out[i] <- quantile(x[1:i], probs = qt)
  }
  out
}

#' Recursive
#'
#' @inheritParams rec_sum
#'
#' @export
rec_sd <- function(x) {
  nsample <- length(x)
  out <- vector("numeric", length = nsample)
  out[1] <- x[1]
  for (i in 2:nsample) {
    mean[i] <- (x[i] + mean[i - 1])/2
    out[i] <- out[i - 1] + mean[i - 1]^2 - mean[i]^2 + (mean[i]^2 - out)/(i + 1)
  }
  out
}


