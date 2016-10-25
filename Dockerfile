FROM debian:stretch
MAINTAINER rasmus
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

RUN apt-get update -y -q && \
    apt-get install -y -q --no-install-recommends \
            fgallery \
            imagemagick \
            exiftran \
            zip \
            liblcms2-utils \
            libimage-exiftool-perl \
            libcpanel-json-xs-perl \
            jpegoptim \
            pngcrush \
            p7zip \
            facedetect \
            python \
            python-opencv \
            libopencv-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
