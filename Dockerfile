FROM debian:stretch
MAINTAINER rasmus
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

RUN apt-get --yes --force-yes update -q && \
    apt-get install --yes --force-yes \
            imagemagick \
            exiftran \
            zip \
            liblcms2-utils \
            libimage-exiftool-perl \
            libjson-perl \
            libjson-xs-perl \
            jpegoptim \
            pngcrush \
            p7zip \
            python-opencv \
            libopencv-dev \
            unp \
            unzip \
            fish \
            wget \
            python-numpy && \
    apt-get clean
