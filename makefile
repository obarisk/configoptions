doc:
	R -e 'roxygen2::roxygenize()'

build:
	R -e 'devtools::build()'

install:
	R CMD INSTALL ./../configoptions_0.0.1.tar.gz
