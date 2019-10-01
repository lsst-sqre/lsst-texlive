# Dockerized texlive
#
# https://github.com/lsst-sqre/lsst-texlive

FROM ubuntu:bionic
MAINTAINER LSST SQuaRE <sqre-admin@lists.lsst.org>

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive 

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
        lmodern \
        texlive-xetex \
        texlive-generic-recommended \
        texlive-full && \
    # Purge documentation
    apt-get purge -f -y \
        make-doc \
        texlive-fonts-extra-doc \
        texlive-fonts-recommended-doc \
        texlive-humanities-doc \
        texlive-latex-base-doc \
        texlive-latex-extra-doc \
        texlive-latex-recommended-doc \
        texlive-metapost-doc \
        texlive-pictures-doc \
        texlive-pstricks-doc \
        texlive-science-doc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

CMD ["/bin/echo", "See https://github.com/lsst-sqre/lsst-texlive for usage."]
