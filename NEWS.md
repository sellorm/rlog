# rlog 0.2.0

* The "log_" functions ("log_error", "log_info", etc) now accept any number of
  arguments via ... in the function call. Additional arguments will be appended
  to the message reducing the need for users to adopt workflows like
  log_info(paste("msg pt 1", variable, "msg pt 2")) which now becomes
  log_info("msg pt 1", variable, "msg pt 2")

* Fixes a bug where the logged output inadvertently included milliseconds

# rlog 0.1.0

* Prepare for CRAN submission

# rlog 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
