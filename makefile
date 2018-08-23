doc:
	R -e 'roxygen2::roxygenize()'

build:
	R -e 'devtools::build()'

install:
	R -e 'devtools::install_github("obarisk/configoptions")'

clean:
	rm ../configoptions_*.tar.gz
