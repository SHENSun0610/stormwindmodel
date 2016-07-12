#' Convert sustained wind to gradient wind.
#'
#' This function converts 1-minute sustained wind speed at 10 meters to gradient
#' level wind speed.
#'
#' @param sustained_vmax A numeric vector of 1-minute sustained wind speed at
#'    10 meters, in meters / second.
#'
#' @details This function uses the following conversion:
#'  \deqn{V_{max} = \frac{V_{max,sustained}}{0.9}}{
#'  Vmax = Vmax_sustained / 0.9}
#'  where:
#'  \itemize{
#'    \item{\eqn{V_{max}}{Vmax}: Mean wind speed at gradient level (m / s) }
#'    \item{\eqn{V_{max,sustained}}{Vmax_sustained}: Surface wind speed (10 meters above the water or ground) (m / s)}
#'  }
#'
#' @return A numeric vector with gradient-level wind speed, in meters / second.
#'
#' @export
calc_gradient_speed <- function(sustained_vmax){
  Vmax <- sustained_vmax / 0.9
}

#' Remove forward speed estimate from maximum wind speed
#'
#' This function takes the forward speed of the storm and subtracts it from
#' the maximum storm wind speed, \eqn{V_{max}}.
#'
#' @inheritParams will1a
#' @inheritParams latlon_to_meters
#' @inheritParams calc_forward_speed
#'
#' @return A numerical vector with the maximum storm wind speed, with forward
#' storm motion speed removed, in m / s.
remove_forward_speed <- function(Vmax, phi_1, L_1, time_1, phi_2, L_2, time_2){
  forward_speed <- calc_forward_speed(phi_1, L_1, time_1, phi_2, L_2, time_2)
  Vmax <- Vmax - forward_speed
  Vmax[Vmax < 0] <- 0
  return(Vmax)
}