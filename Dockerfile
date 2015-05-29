FROM phusion/baseimage:0.9.16

ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /fgallery nobody && \
 chown -R nobody:users /home

# chfn workaround - Known issue within Dockers
RUN ln -s -f /bin/true /usr/bin/chfn

 # Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install fgallery

RUN apt-get -y update
RUN apt-get -y install imagemagick exiftran zip liblcms2-utils libimage-exiftool-perl libjson-perl libjson-xs-perl jpegoptim pngcrush p7zip python-opencv libopencv-dev unp unzip fish wget python-numpy

RUN wget --no-check-certificate http://www.thregr.org/~wavexx/software/fgallery/releases/fgallery-LATEST.zip
RUN unp fgallery-LATEST.zip
RUN rm fgallery-LATEST.zip
RUN mv fgallery-* fgallery

#Expose Volumes
VOLUME ["/fgallery/gallery/"]
WORKDIR /fgallery/

# Expose Port
EXPOSE 8000

RUN wget --no-check-certificate https://github.com/wavexx/facedetect/archive/master.zip
RUN unzip -p master.zip facedetect-master/facedetect > /usr/bin/facedetect
RUN chmod +x /usr/bin/facedetect

CMD ["/bin/bash"]
