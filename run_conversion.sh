#!/bin/bash

cd "/gallery/files/"

if [ -d "photos" ]; then
  echo "photos folder exists, running conversion..."
  mkdir -p website
  cd website
  /gallery/lazygal/lazygal.py --make-dir-zip --original --output-directory=/gallery/files/album /gallery/files/photos
fi
