#' configinit
#'
#' configinit reads all config file from /etc/config/*.yml, ./config/*.yml, ./config.yml
#' 
#' @param val A list thet overwrite other configs
#' @param cfg An array of strings default = c("/etc/config/", "./config", "./config.yml")
#' @examples
#'  configinit(list(myconf="myconf"))
#'  message(getOption("myconf"))
#'  readLines(system.file("extdata", "example.yml", package="configoptions"))
#'  configinit(cfg=system.file("extdata", "example.yml", package="configoptions"))
#'  getOption("myconf")      # note that myconf still exists
#'  getOption("config_list")
#'  getOption("config_int")
#'  getOption("config_str")
#' @export
configinit <- function(val=list(), cfg=c("/etc/config/", "./config", "./config.yml")) {

  for (fg in cfg) {
    if (file.exists(fg)) {
      if (dir.exists(fg)) {
        fs <- list.files(fg, pattern="\\.ya*ml", full.names=TRUE)
        if (length(fs) > 0) {
          for (f in fs) {
            tryCatch({
              l <- yaml.load_file(f)
              options(l)
            }, error=function(e) {
              conditionMessage(e)
            })
          }
        }
      } else {
        options(yaml.load_file(fg))
      }
    }
  }
  if (length(val) > 0) {
    options(val)
  }

}
