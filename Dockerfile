#! /usr/local/bin/docker
FROM rocker/tidyverse

# install R packages
RUN Rscript -e "install.packages(c('survival','ggplot2','ggpubr','survminer','devtools'))"

# make a project directory in the container
RUN mkdir /project
RUN mkdir /project/output

# set working directory
# WORKDIR /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/R/*.R

# make container entry point bash
CMD make -C project report