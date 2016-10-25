FROM phusion/baseimage:0.9.16

ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

#Expose Volumes
VOLUME ["/opt/fgallery/gallery/"]
WORKDIR /opt/fgallery/

# Expose Port
EXPOSE 8000

# Configure user nobody to match unRAID's settings
RUN usermod -u 99 nobody && \
usermod -g 100 nobody && \
usermod -d /fgallery nobody && \
chown -R nobody:users /home && \

# chfn workaround - Known issue within Dockers
ln -s -f /bin/true /usr/bin/chfn && \

 # Disable SSH
rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh && \

# Install fgallery

apt-get --yes --force-yes update -q && \
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
wget 
python-numpy && \

wget -P /tmp --no-check-certificate http://www.thregr.org/~wavexx/software/fgallery/releases/fgallery-LATEST.zip && \
cd /opt && \
unzip /tmp/fgallery-LATEST.zip && \
mv fgallery-* fgallery && \

wget --no-check-certificate https://github.com/wavexx/facedetect/archive/master.zip && \
unzip -p master.zip facedetect-master/facedetect > /usr/bin/facedetect && \
chmod +x /usr/bin/facedetect

