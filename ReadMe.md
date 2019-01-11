configoptions

## Description

`configoptions::configinit` load options into R buildin options.
the order of the options be loaded is determined by the sequence of
cfg argument and the sequence of a directory of yamls being sorted.
the val list has the higest precedence.

## Usage

- put your config file (y[a|]ml) into `c("/etc/config/", "./config", "./config.yml")`
- configoptions::configinit()
- extract by getOption
- replace by configinit(key="value")

## install

```r
if (!require("devtools"))  install.packages("devtools")
devtools::install_github("obarisk/configoptions")
```

## example

```r
require(configoptions)
tryCatch({
  getOption("myconf")
}, error=function(e) {
  conditionMessage(e)
})
configinit(list(myconf="myconf"))
getOption("myconf")
configinit(cfg=system.file("extdata", "01-example.yml", package="configoptions"))
getOption("config_list")
getOption("config_int")
getOption("config_str")
getOption("myconf")
```
