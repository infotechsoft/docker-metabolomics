# docker-metabolomics
Mass Spectrometry and Metabolomics Tools in Docker

## Usage
Start a container with the default R interpeter
```
docker run -it --rm -v "${PWD}"/data -w /data infotechsoft/metabolomics
```
Start a container with a BASH shell
```
docker run -it --rm -v "${PWD}"/data -w /data infotechsoft/metabolomics /bin/bash
```

## Build Details
 * [r-base](https://hub.docker.com/_/r-base/): 4.0.2
 * Bioconductor Packages:
   * [XCMS](https://bioconductor.org/packages/release/bioc/html/xcms.html) LC/MS and GC/MS Data Analysis
   * [CAMERA](https://bioconductor.org/packages/release/bioc/html/CAMERA.html) Collection of annotation related methods for mass spectrometry data
   * [Warpgroup](https://github.com/nathaniel-mahieu/warpgroup) processing chromatography-mass spectrometry data

# License
View [R-project license](http://www.r-project.org/Licenses/) information for the software contained in this image.

# Maintainer 
![INFOTECH Soft](http://infotechsoft.com/wp-content/uploads/2017/04/InfotechSoft_logo-small.png "INFOTECH Soft, Inc.")