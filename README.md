docker-lazygal
==============

A Dockerfile for generating LazyGal galleries

https://sml.zincube.net/~niol/repositories.git/lazygal/about/


Usage
-----

Make a folder (I refer to it here as $WORKSPACE)

Into this folder, checkout this repo and your photos so you have:

workspace/
  docker-lazygal
  photos

cd ${WORKSPACE}/docker-lazygal

docker build -t lazygal-builder .

docker run -t -v "${WORKSPACE}":/gallery/files lazygal-builder

This will create a folder called 'website'. It will take a long time to run if you have a lot of images.

Then serve your files with:

docker-compose up -d



