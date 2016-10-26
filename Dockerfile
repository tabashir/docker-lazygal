FROM debian:stretch
MAINTAINER rasmus
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

## Install fgallery from the Debian repo.  It's available from Stretch.

## Facedetect depends on opencv.  The default Debian package pulls in
## Xorg dependencies.  Built a light opencv to support facedetect.

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
            p7zip && \
    # facedetect \
    # python-opencv \
    # libopencv-dev \
    apt-get install -y -q --no-install-recommends \
            python-dev \
            python-numpy \
            libtbb2 \
            libtbb-dev \
            libjpeg-dev \
            libpng-dev \
            libtiff-dev \
            libjasper-dev \
            build-essential \
            cmake \
            git \
            wget \
            unzip \
            pkg-config && \
    cd /tmp/ && \
    cv_version='3.1.0' && \
    wget https://github.com/Itseez/opencv/archive/"$cv_version".zip && \
    unzip -q "$cv_version".zip && \
    mkdir opencv-"$cv_version"/cmake_binary && \
    cd opencv-"$cv_version"/cmake_binary && \
    cmake -DENABLE_PRECOMPILED_HEADERS=OFF -D WITH_CUDA=OFF -D CMAKE_INSTALL_PREFIX=/usr/ .. && \
    make install && \
    cd /tmp/ && \
    rm "$cv_version".zip && \
    rm -r opencv-"$cv_version" && \
    wget https://github.com/wavexx/facedetect/archive/master.zip && \
    unzip -q -p master.zip facedetect-master/facedetect > /usr/bin/facedetect && \
    chmod +x /usr/bin/facedetect && \
    rm master.zip && \
    apt-get -y -qq purge build-essential cmake git wget unzip && \
    apt-get -y -qq clean all && \
    apt-get -y -qq autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/{doc,locale,man}

