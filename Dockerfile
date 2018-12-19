FROM openanalytics/r-base

MAINTAINER Franck Soubès "franck.soubes@inra.fr"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    r-base \
    emacs \
    wget \
    gdebi-core \
    libcurl4-openssl-dev\
    libcairo2-dev \
    libjpeg-dev \
    libtiff5-dev \
    libv8-3.14-dev \
    libxt-dev \
    libxml2-dev \
    libxml2 \
    git \
    libssl-dev \
    libssh2-1-dev \
    libnlopt-dev \
    libpython2.7 \
    python-pip \
    python-virtualenv \
    gcc \
    gfortran \
    g++ \
    make \
    openjdk-8-jdk

RUN apt-get update && apt-get install

RUN R CMD javareconf
RUN  R -e """list.of.packages <- c('rJava','shiny','shinythemes','shinyjs','ggplot2','shinyBS','plyr','shinyFiles','BH','data.table','DT','readr','colourpicker','shinydashboard','heatmaply','tools','devEMF','R.devices','FactoMineR','factoextra','gplots','V8','RColorBrewer','foreach','doParallel','gridExtra','plotly','dplyr','reticulate','Hmisc');new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])];if(length(new.packages)) install.packages(new.packages);lapply(list.of.packages,function(x){suppressPackageStartupMessages(library(x,character.only=TRUE))})"""
RUN  R -e 'source(file = "http://bioconductor.org/biocLite.R");biocLite("RDAVIDWebService");'
RUN  R -e 'source(file = "http://bioconductor.org/biocLite.R");biocLite(c("org.Hs.eg.db","org.Mm.eg.db","org.Dr.eg.db","org.Gg.eg.db","org.Gg.eg.db","org.Ce.eg.db","org.Rn.eg.db","org.Ss.eg.db"));'

RUN mkdir /root/matrix
COPY matrix/ /root/matrix

COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838


CMD ["R", "-e", "shiny::runApp('/root/matrix')"]
