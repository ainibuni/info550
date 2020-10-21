# rule for installing R packages
.PHONY: install
install: R/00_install_pkgs.R
	chmod +x R/00_install_pkgs.R && R/00_install_pkgs.R

# rule for making report
report.html: figs/fig1.png figs/fig2.png R/04_report.Rmd raw_data/project1_data-1.csv
	cd R && Rscript -e "rmarkdown::render('04_report.Rmd', output_file = '../report.html')"

# rule for making figure 1
figs/fig1.png: R/02_make_fig1.R clean_data/data.csv
	chmod +x R/02_make_fig1.R && R/02_make_fig1.R

# rule for making figure 2
figs/fig2.png: R/03_make_fig2.R clean_data/data.csv
	chmod +x R/03_make_fig2.R && R/03_make_fig2.R

# rule for cleaning data
clean_data/data.csv: R/01_clean_data.R raw_data/project1_data-1.csv
	chmod +x R/01_clean_data.R && R/01_clean_data.R

.PHONY: help
help:
	@echo "report.html : Generate final analysis report."
	@echo "data.csv    : Clean raw data project1_data-1.csv."
	@echo "fig1.png    : Plot of survival curves by treatment group."
	@echo "fig2.png    : Plot of survival curves by serum bilirubin group."