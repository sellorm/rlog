#' Log a trace message
#' @param message your message to log
#' @export
log_trace <- function(message){
  log_msg(message, "TRACE")
}

#' Log a debug message
#' @param message your message to log
#' @export
log_debug <- function(message){
  log_msg(message, "DEBUG")
}

#' Log an info message
#' @param message your message to log
#' @export
log_info <- function(message){
  log_msg(message, "INFO")
}

#' Log a warning message
#' @param message your message to log
#' @export
log_warn <- function(message){
  log_msg(message, "WARN")
}

#' Log an error message
#' @param message your message to log
#' @export
log_error <- function(message){
  log_msg(message, "ERROR")
}


#' Log a fatal message
#' @param message your message to log
#' @export
log_fatal <- function(message){
  log_msg(message, "FATAL")
}
