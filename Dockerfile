FROM debian:sid
MAINTAINER rasmus
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

## Install fgallery from the Debian repo.  It's available in Stretch.

## Facedetect depends on opencv.  The default Debian package pulls in
## Xorg dependencies.  Built lighter opencv to support facedetect.

RUN use_facedetect="1" && \
    cv_version='3.1.0' && \
    apt-get update -y -q && \
    apt-get install -y -qq --no-install-recommends \
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
    if [ "$use_facedetect" -ge 0 ]; then \
        apt-get install -y -qq --no-install-recommends \
                python \
                python-dev \
                python-numpy \
                libpython2.7 \
                libjpeg-dev \
                libpng-dev \
                libtiff-dev \
                libjasper-dev \
                build-essential \
                cmake \
                libc6 \
                git \
                wget \
                unzip \
                pkg-config && \
            cd /tmp/ && \
            wget -q --no-check-certificate https://github.com/Itseez/opencv/archive/"$cv_version".zip && \
            unzip -q "$cv_version".zip && \
            mkdir opencv-"$cv_version"/cmake_binary && \
            cd opencv-"$cv_version"/cmake_binary && \
            cmake -DENABLE_PRECOMPILED_HEADERS=OFF \
                  -D CMAKE_INSTALL_PREFIX=/usr/  -D CMAKE_BUILD_TYPE=MINSIZEREL \
                  -D BUILD_DOCS=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D WITH_OPENCL=OFF -D WITH_V4L=OFF \
                  -D BUILD_WITH_DEBUG_INFO=OFF -D BUILD_opencv_apps=OFF -D WITH_IPP=OFF  \
                  -D BUILD_opencv_video=OFF -D BUILD_opencv_videoio=OFF -D BUILD_opencv_calib3d=OFF -D BUILD_opencv_highgui=OFF -D BUILD_opencv_calib3d=OFF -D BUILD_opencv_ts=OFF \
                  .. && \
            make install && \
            mv /usr/share/OpenCV /usr/share/opencv && \
            rm "/tmp/$cv_version".zip && \
            rm -r /tmp/opencv-"$cv_version" && \
            cd /tmp/ && \
            wget -q --no-check-certificate https://github.com/wavexx/facedetect/archive/master.zip && \
            unzip -q -p master.zip facedetect-master/facedetect > /usr/bin/facedetect && \
            chmod +x /usr/bin/facedetect && \
            rm master.zip && \
            apt-get -y -qq purge build-essential cmake git wget unzip python-dev libc6-dev \
        ; fi;  \
    apt-get -y -qq clean all && \
    apt-get -y -qq autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc && \ 
    rm -rf /usr/share/locale && \
    rm -rf /usr/share/man && \
    rm -rf /include        
