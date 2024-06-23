FROM rocker/rstudio

RUN apt update
RUN Rscript -e 'install.packages("pak"); library(pak)'
RUN Rscript -e 'pak::pkg_install("tidyverse"); library(tidyverse)'
RUN Rscript -e 'pak::pkg_install("BiocManager"); library(BiocManager)'
RUN Rscript -e 'BiocManager::install("cytolib"); library(cytolib)'
RUN Rscript -e 'BiocManager::install("flowCore"); library(flowCore)'
RUN Rscript -e 'BiocManager::install("openCyto"); library(openCyto)'
RUN Rscript -e 'BiocManager::install("flowWorkspace"); library(flowWorkspace)'
RUN Rscript -e 'pak::pkg_install("rlbarter/superheat"); library(superheat)'
RUN Rscript -e 'pak::pkg_install("DillonHammill/CytoExploreRData"); library(CytoExploreRData)'
RUN Rscript -e 'pak::pkg_install("DillonHammill/CytoExploreR"); library(CytoExploreR)'
RUN rstudio-server version

ENTRYPOINT /init
