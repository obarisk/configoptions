#' configinit
#'
#' configinit reads all config file (yaml) in the following places
#' **/etc/config/*.yml**, **./config/*.yml**, **./config.yml**
#' the places can be specified by user
#'
#' @param val A list thet overwrite other configs
#' @param cfg An array of strings default = c("/etc/config/", "./config", "./config.yml")
#' @examples
#'  configinit()
#'
#' @importFrom yaml yaml.load_file
#' @export
configinit <- function(val=list(),
                       cfg=c("./config", "./config.yml")) {
  cfg <- c(Sys.getenv("CONFIG_PATH"), cfg)
  lapply(
    cfg[file.exists(cfg)],
    function(x) {
      if (dir.exists(x)) {
        fs <- list.files(x, pattern="\\.ya*ml", full.names=TRUE)
      } else {
        fs <- x
      }
      lapply(fs, function(f) {
        tryCatch({
          l <- yaml::yaml.load_file(f)
          options(l)
        }, error=function(e) {
          conditionMessage(e)
        })
      })
    })
  if (length(val) > 0) options(val)
  invisible(T)
}
