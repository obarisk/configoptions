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
  getOptions("myconf")
}, error=function(e) {
  conditionMessage(e)
})
configinit(list(myconf="myconf"))
getOptions("myconf")
configinit(cfg=system.file("extdata", "example.yml", package="configoptions"))
getOptions("config_list")
getOptions("config_int")
getOptions("config_str")
getOptions("myconf")
```
