## My Project

For my survival analysis project, I will use the data from the Mayo Clinic  trial in primary biliary cirrhosis (PBC) of the liver conducted between 1974 and 1984. The dataset contains a total of 424 PBC patients.

To analyze the data you will need to install some `R` packages. The required packages can be installed using `R` commands.

```
installed_pkgs <- row.names(installed.packages())
pkgs <- c("survival", "survminer")
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
```

## Execute the analysis

To execute the analysis, from the project folder you can run

```
Rscript -e "rmarkdown::render('INFO 550 HW3.Rmd', output_file = 'report.html')"
```

This will create a file called `report.html` output in your directory that contains the results.
