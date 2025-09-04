# Main log writing function
log_msg <- function(msg_level = "INFO", message, ...) {
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
  if (is.null(levels[tolower(level)])) {
    stop("The LOG_LEVEL environment variable is incorrectly set")
  }
  if (as.integer(levels[tolower(level)]) <= as.integer(levels[tolower(msg_level)])) {
    log_text <- paste0(Sys.time(),
      " [", msg_level, "] ",
      paste(c(message, list(...)), sep = " ", collapse = " "),
      "\n",
      sep = "",
      collapse = ""
    )
    if (as.integer(levels[tolower(msg_level)]) > 3) {
      cat(log_text, file = stderr())
    } else {
      cat(log_text, file = stdout())
    }
    invisible(TRUE)
  } else {
    invisible(FALSE)
  }
}
