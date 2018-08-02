ARG R_BASE_VERSION=3.5.1
FROM r-base:${R_BASE_VERSION}

LABEL name="infotechsoft/xcms-warpgroup" \
        release-date="2018-08-05" \
        description="XCMS, CAMERA, and Warpgroup on R" \
        maintainer="Thomas J. Taylor <thomas@infotechsoft.com>"

RUN apt-get update && \
    apt-get install -y gcc g++ \
                       libcairo2-dev libxt-dev libssl-dev libssh2-1-dev apt-utils gfortran \
                       aptitude libcurl4-openssl-dev libxml2-dev libxml2-dev libnetcdf-dev

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile \
    && Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite(c("xcms", "CAMERA"))' \
    && install.r  data.table \
                  doParallel \
                  ggplot2 \
                  plyr \
                  dplyr \
                  igraph \
                  import \
                  devtools \
    && Rscript -e "devtools::install_github('nathaniel-mahieu/warpgroup')"