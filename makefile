test:
	R -e 'devtools::test()'

build: 
	R -e 'roxygen2::roxygenize(); devtools::build()'

install: 
	sudo R CMD INSTALL ../configoptions_1.0.0.tar.gz

clean:
	rm ../configoptions_*.tar.gz
