#!/bin/bash

cd "/fgallery/gallery/"

if [ -d "photos" ]; then
  echo "photos folder exists, running conversion..."
  /fgallery/fgallery -v -j 3  photos website
fi
