#' Retrieve the Docker image for Splash
#'
#' @return `harbor` `host` object
#' @export
#' @examples \dontrun{
#' install_splash()
#' splash_container <- start_splash()
#' stop_splash(splash_container)
#' }
install_splash <- function() {
  harbor::docker_pull(localhost, "scrapinghub/splash")
}

#' Start a Splash server Docker container
#'
#' @note you need Docker running on your system and have pulled the container with
#'       [install_spash] for this to work. You should save the resultant `host`
#'       object for use in [stop_splash].
#' @return `harbor` `container` object
#' @export
#' @examples \dontrun{
#' install_splash()
#' splash_container <- start_splash()
#' stop_splash(splash_container)
#' }
start_splash <- function() {
  harbor::docker_run(localhost, image = "scrapinghub/splash", detach = TRUE,
                     docker_opts = "-p 5023:5023 -p 8050:8050 -p 8051:8051")
}

#' Stop a running a Splash server Docker container
#'
#' @param splash_container Docker `container` object created by [start_splash]
#' @note you need Docker running on your system and have pulled the container with
#'       [install_spash] and started the Splash container with [start_splash] for this
#'       to work. You will need the `container` object from [start_splash] for this to work.
#' @export
#' @examples \dontrun{
#' install_splash()
#' splash_container <- start_splash()
#' stop_splash(splash_container)
#' }
stop_splash <- function(splash_container) {
  harbor::container_rm(splash_container, force=TRUE)
}
