# configoptions

# install

```r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("obarisk/configoptions")
```

# example

```r
library(configoptions)
tryCatch({
  getOption("myconf")
}, error=function(e) {
  conditionMessage(e)
})
configinit(list(myconf="myconf"))
getOption("myconf")
configinit(cfg=system.file("extdata", "example.yml", package="configoptions"))
getOption("config_list")
getOption("config_int")
getOption("config_str")
getOption("myconf")
```
