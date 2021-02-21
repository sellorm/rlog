# Main log writing function
log_msg <- function(message, msg_level = "INFO"){
  level <- Sys.getenv("LOG_LEVEL", "INFO")
  levels <- list(
    "all" = 0,
    "trace" = 1,
    "debug" = 2,
    "info" = 3,
    "warn" = 4,
    "error" = 5,
    "fatal" = 6,
    "off" = 7
  )
  if (is.null(levels[tolower(level)])){
    stop("The LOG_LEVEL environment variable is incorrectly set")
  }
  if (as.integer(levels[tolower(level)]) <= as.integer(levels[tolower(msg_level)])) {
    if (as.integer(levels[tolower(msg_level)]) > 3) {
      cat(paste0(Sys.time(), " [", msg_level, "] ", message), file=stderr())
    } else {
      cat(paste0(Sys.time(), " [", msg_level, "] ", message), file=stdout())
    }
    invisible(TRUE)
  } else {
    invisible(FALSE)
  }
}

