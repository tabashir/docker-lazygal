FROM debian:stretch
MAINTAINER rasmus
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

RUN apt-get update -y -q && \
    apt-get install -y -q \
            fgallery \
            facedetect
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
            libopencv-dev # && \
    # auto_install=`apt-mark showauto`  && \
    # apt-get remove --purge -y ${auto_install}
