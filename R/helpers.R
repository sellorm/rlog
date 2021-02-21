#' Log a trace message
#'
#' Log messages will only be emitted if the log priority matches or is higher
#' than the priority of your message
#'
#' @param message your message to log
#'
#' @return invisibly returns TRUE/FALSE
#' @examples
#' \dontrun{
#' log_trace("This is a trace message")
#' Sys.setenv("LOG_LEVEL" = "TRACE")
#' log_trace("This is a trace message")
#' }
#' @export
log_trace <- function(message){
  log_msg(message, "TRACE")
}

#' Log a debug message
#'
#' Log messages will only be emitted if the log priority matches or is higher
#' than the priority of your message
#'
#' @param message your message to log
#'
#' @return invisibly returns TRUE/FALSE
#' @examples
#' \dontrun{
#' log_debug("This is a debug message")
#' Sys.setenv("LOG_LEVEL" = "TRACE")
#' log_debug("This is a debug message")
#' }
#' @export
log_debug <- function(message){
  log_msg(message, "DEBUG")
}

#' Log an info message
#'
#' Log messages will only be emitted if the log priority matches or is higher
#' than the priority of your message
#'
#' @param message your message to log
#'
#' @return invisibly returns TRUE/FALSE
#' @examples
#' \dontrun{
#' log_info("This is an info message")
#' Sys.setenv("LOG_LEVEL" = "TRACE")
#' log_info("This is an info message")
#' }
#' @export
log_info <- function(message){
  log_msg(message, "INFO")
}

#' Log a warning message
#'
#' Log messages will only be emitted if the log priority matches or is higher
#' than the priority of your message
#'
#' @param message your message to log
#'
#' @return invisibly returns TRUE/FALSE
#' @examples
#' \dontrun{
#' log_warn("This is a warning message")
#' Sys.setenv("LOG_LEVEL" = "TRACE")
#' log_warn("This is a warning message")
#' }
#' @export
log_warn <- function(message){
  log_msg(message, "WARN")
}

#' Log an error message
#'
#' Log messages will only be emitted if the log priority matches or is higher
#' than the priority of your message
#'
#' @param message your message to log
#'
#' @return invisibly returns TRUE/FALSE
#' @examples
#' \dontrun{
#' log_error("This is an error message")
#' Sys.setenv("LOG_LEVEL" = "TRACE")
#' log_error("This is an error message")
#' }
#' @export
log_error <- function(message){
  log_msg(message, "ERROR")
}


#' Log a fatal message
#'
#' Log messages will only be emitted if the log priority matches or is higher
#' than the priority of your message
#'
#' @param message your message to log
#'
#' @return invisibly returns TRUE/FALSE
#' @examples
#' \dontrun{
#' log_fatal("This is a fatal message")
#' Sys.setenv("LOG_LEVEL" = "TRACE")
#' log_fatal("This is a fatal message")
#' }
#' @export
log_fatal <- function(message){
  log_msg(message, "FATAL")
}
