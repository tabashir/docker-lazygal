FROM ubuntu:trusty

RUN apt-get -y update
RUN apt-get -y install imagemagick exiftran zip liblcms2-utils libimage-exiftool-perl libjson-perl libjson-xs-perl jpegoptim pngcrush p7zip python-opencv libopencv-dev unp unzip fish wget python3-numpy git gstreamer1.0-plugins-base gstreamer1.0-plugins-good gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 python3-gst-1.0 python3-genshi libgexiv2-2 python3-pillow python3 liblocale-msgfmt-perl xsltproc python-libxslt1 gettext

WORKDIR /gallery/
RUN wget https://sml.zincube.net/~niol/repositories.git/lazygal/snapshot/lazygal-0.9.2.tar.bz2 -O lazygal.bz2
RUN tar jxvf lazygal.bz2
RUN mkdir files

# VOLUME ["/gallery/files/"]

ADD run_conversion.sh /gallery/run_conversion.sh
RUN chmod +x /gallery/run_conversion.sh

CMD ["/gallery/run_conversion.sh" ]
