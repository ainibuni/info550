#! /usr/local/bin/Rscript

# installing R packages
installed_pkgs <- row.names(installed.packages())
pkgs <- c("survival", "survminer")
for(p in pkgs){
  if(!(p %in% installed_pkgs)){
    install.packages(p)
  }
}