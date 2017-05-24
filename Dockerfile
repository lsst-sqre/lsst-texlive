# Dockerized texlive
#
# https://github.com/lsst-sqre/lsst-texlive

FROM ubuntu:trusty
MAINTAINER LSST SQuaRE <sqre-admin@lists.lsst.org>

ENV LANG C.UTF-8

# Matches installation in early Travis PDF installations
# h/t https://github.com/thomasWeise/docker-texlive/blob/master/image/Dockerfile
# h/t https://github.com/harshjv/docker-texlive-2015/blob/master/Dockerfile
RUN apt-get update && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        make \
        git \
        texlive-fonts-recommended \
        texlive-latex-extra \
        texlive-fonts-extra \
        dvipng \
        texlive-latex-recommended \
        latexmk \
        poppler-utils \
        latex-xcolor \
        lmodern \
        texlive-xetex \
        texlive-generic-recommended \
        texlive-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*
