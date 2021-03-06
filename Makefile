
# rule for installing R packages
.PHONY: install
install: R/00_install_pkgs.R
	chmod +x R/00_install_pkgs.R && Rscript R/00_install_pkgs.R

# rule for making report
.PHONY: report
report: figs/fig1.png figs/fig2.png R/04_report.Rmd raw_data/project1_data-1.csv
	cd R && Rscript -e "rmarkdown::render('04_report.Rmd', output_file = '../output/report.html')"

# rule for making figure 1
figs/fig1.png: R/02_make_fig1.R clean_data/data.csv
	chmod +x R/02_make_fig1.R && Rscript R/02_make_fig1.R

# rule for making figure 2
figs/fig2.png: R/03_make_fig2.R clean_data/data.csv
	chmod +x R/03_make_fig2.R && Rscript R/03_make_fig2.R

# rule for cleaning data
clean_data/data.csv: R/01_clean_data.R raw_data/project1_data-1.csv
	chmod +x R/01_clean_data.R && Rscript R/01_clean_data.R

# rule for build Docker image
.PHONY: build
build: Dockerfile
	docker build -t myproject .


.PHONY: help
help:
	@echo "report 	   : Generate final analysis report."
	@echo "install     : Install R packages."
	@echo "build	   : Build Docker image."
	@echo "data.csv    : Clean raw data project1_data-1.csv."
	@echo "figs/fig1.png    : Plot of survival curves by treatment group."
	@echo "figs/fig2.png    : Plot of survival curves by serum bilirubin group."