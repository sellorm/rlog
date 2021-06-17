# rlog

rlog is an opinionated, lightweight logging package for R.

It relies on long standing Unix traditions, to write simple log messages in a flexible way.

Log message output looks like this:

```
2021-02-21 17:19:06 [INFO] This is my log message
```

## Installation

Install rlog from GitHub with the following:

``` r
devtools::install_github("sellorm/rlog")
```

## Does R _really_ need another logging package?

We think so, yes!

There are already loads of logging packages for R. Many are no longer maintained and of the remaining selection some are overly complex, making them less approachable for beginners.

Since logging should be an essential part of any production application or pipeline I think it's important that as many people as possible are introduced to good logging practice.

If rlog doesn't have enough features for you, I'd recommend the excellent "[logger](https://cran.r-project.org/package=logger)" instead.

## rlog philosophy

The rlog philosophy is the [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) and as such, we expect applications using rlog to be able to integrate with other enterprise software quickly and efficiently.

rlog is simple by design and it relies on existing Unix/Linux norms to get the job done.

* Log message format is intentionally not configurable
* the log level can only be controlled by an environment variable
* log messages are written to standard output and standard error

## Usage

The best way to use rlog is to call the functions directly from within your applications.

There is one function per log message level:

``` r
rlog::log_fatal("my fatal message")
rlog::log_error("my error message")
rlog::log_warn("my warn message")
rlog::log_info("my info message")
rlog::log_debug("my debug message")
rlog::log_trace("my trace message")
```

If you run this code as-is without setting a custom `LOG_LEVEL` with the environment variable, you'll get output like this:

```
2021-02-21 17:19:06 [FATAL] fatal
2021-02-21 17:19:06 [ERROR] error
2021-02-21 17:19:06 [WARN] warn
2021-02-21 17:19:06 [INFO] info
```

The "DEBUG" and "TRACE" message won't be printed, since the default `LOG_LEVEL` is "INFO" and those message have lower priority.

Play around with setting the `LOG_LEVEL` directly in R and seeing what messages are emitted:

``` r
Sys.setenv("LOG_LEVEL" = "ERROR")
rlog::log_fatal("my fatal message")
rlog::log_error("my error message")
rlog::log_warn("my warn message")
rlog::log_info("my info message")
rlog::log_debug("my debug message")
rlog::log_trace("my trace message")
```

Gives us this output:

```
2021-02-21 17:19:06 [FATAL] fatal
2021-02-21 17:19:06 [ERROR] error
```

Remember though, the best way to set the environment variable is outside of the app. That way it's easier to change at run-time.

So in your terminal you can do something like this before you run your script:

``` sh
$ export LOG_LEVEL=TRACE
$ ./my_script.R
```

Or you can even call your script with the appropriate value at run-time:

``` sh
$ LOG_LEVEL=ERROR ./my_script.R
```

If you're using RStudio Connect users can set an environment variable called `LOG_LEVEL` in the "Vars" tab of their apps control panel.

## Setting the log level

rlog relies on an environment variable called `LOG_LEVEL` to control which log messages are emitted.

If it's not set, it will default to "INFO".

The available levels -- in decreasing order of severity -- are as follows:

* fatal
* error
* warn
* info
* debug
* trace

When the `LOG_LEVEL` environment variable is set to "INFO", only messages at that level and above will be emitted.

Another example:

* fatal
* error
* warn 
* info
* debug <= If we set the log level here only messages of debug and above will be emitted.
* trace

This is a really powerful way of only including the messages you want to see in the log files at any given time. For example, you may choose to set the `LOG_LEVEL` to "TRACE" while developing your application or if it runs into a problem in production, but you might choose to run the application with a `LOG_LEVEL` of "ERROR" under normal circumstances.


## I want to write to a log file, not the console

rlog outputs it log messages into the console in the same way that most Unix/Linux tools do. Ordinary messages go to "standard output" ([stdout](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout))) and errors go to "standard error" ([stderr](https://en.wikipedia.org/wiki/Standard_streams#Standard_error_(stderr))).

This means they can be captured in the standard Unix/Linux way:

```
./my_script.R > /path/to/file.log 2>&1
```

This command redirects stderr to stdout and drops it all into the `/path/to/file.log` file.

You can also keep the "normal" and error outputs separate:

```
./my_script.R > /path/to/file.log 2> /path/to/errors.log
```

Many enterprise software products, such as RStudio Connect will capture this output automatically and save it for you.
