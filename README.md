docker-fgallery
===============

A Dockerfile for installing fgallery.

fgallery is a static image gallery generation script, it takes images from a directory and generates a static HTML page
with the images displayed in a slideshow. It can be found at:

Forked from: http://www.thregr.org/~wavexx/software/fgallery/

Usage
-----

To use this image:

* create a folder (we'll refer to it as 'mountpath')
* copy your images folder into there as a subfolder called 'photos' (case sensitive)
* run:
    docker build -t fgallery-builder .
    docker run -i -v <mountpath>:/fgallery/gallery/ -t fgallery-builder

That will mount "mountpath" in the container and run the conversion script against the photos subfolder

The converted images will be created as a folder called 'website' inside the 'mountpath' folder
