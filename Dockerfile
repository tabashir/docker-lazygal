FROM ubuntu:trusty

RUN apt-get -y update && apt-get -y install \
  p7zip \
  unzip \
  unp \
  fish \
  wget \
  git \
  python3 \
  python3-gst-1.0 \
  python3-numpy \
  python3-genshi \
  python3-pillow \
  python-libxslt1 \
  python-opencv \
  imagemagick \
  exiftran zip \
  liblcms2-utils \
  libimage-exiftool-perl \
  libjson-perl \
  libjson-xs-perl \
  jpegoptim \
  pngcrush \
  libopencv-dev \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gir1.2-gstreamer-1.0 \
  gir1.2-gst-plugins-base-1.0 \
  libgexiv2-2 \
  libgexiv2-dev \
  liblocale-msgfmt-perl \
  xsltproc \
  gettext

WORKDIR /gallery/
ARG LAZYGAL_VERSION=0.9.2
RUN wget https://sml.zincube.net/~niol/repositories.git/lazygal/snapshot/lazygal-${LAZYGAL_VERSION}.tar.bz2 
RUN tar jxvf lazygal-${LAZYGAL_VERSION}.tar.bz2
RUN mv lazygal-${LAZYGAL_VERSION} lazygal
RUN mkdir files

# VOLUME ["/gallery/files/"]

ADD run_conversion.sh /gallery/run_conversion.sh
RUN chmod +x /gallery/run_conversion.sh

CMD ["/gallery/run_conversion.sh" ]
