ARG R_BASE_VERSION=4.0.2
FROM r-base:${R_BASE_VERSION}

ARG BUILD_DATE
LABEL name="infotechsoft/metabolomics" \
        description="XCMS, CAMERA, and Warpgroup on R ${R_BASE_VERSION}" \
        maintainer="Thomas J. Taylor <thomas@infotechsoft.com>" \
        build-date="${BUILD_DATE}"

RUN apt-get update && \
    apt-get install -y gcc g++ \
                       libcairo2-dev libxt-dev libssl-dev libssh2-1-dev apt-utils gfortran \
                       aptitude libcurl4-openssl-dev libxml2-dev libxml2-dev libnetcdf-dev

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile \
    && Rscript -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install(version = "3.11"); BiocManager::install(c("xcms", "CAMERA"))' \
    && install.r  data.table \
                  doParallel \
                  ggplot2 \
                  plyr \
                  dplyr \
                  igraph \
                  import \
                  devtools \
    && Rscript -e "devtools::install_github('nathaniel-mahieu/warpgroup')"