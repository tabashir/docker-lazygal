#!/bin/bash

cd "/gallery/files/"
ls /gallery/files
ls /gallery/files/photos
ls /gallery/files/website

if [ -d "photos" ]; then
  echo "photos folder exists, running conversion..."
  mkdir -p website
  cd website
  python /gallery/lazygal/lazygal.py --make-dir-zip --original --output-directory=/gallery/files/website /gallery/files/photos
fi
