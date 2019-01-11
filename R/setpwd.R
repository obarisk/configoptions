#' setpwd
#'
#' set pwd for Rscript
#'
#' set current working directory to the RScript path
#' setpwd ensure when the script is envoke by RScript, 
#' the working directory should be where the script locates
#'
#' @return current_pwd
#' @export
setpwd <- function() {
  pwd <- getwd()
  if (!interactive()) {
    CArgs <- commandArgs(trailingOnly=FALSE)
    setwd(dirname(sub("^--file=", "", CArgs[grepl("^--file=", CArgs)])))
  }
  invisible(pwd)
}
