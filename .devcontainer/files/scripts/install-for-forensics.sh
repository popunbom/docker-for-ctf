#!/bin/bash

apt-get update && apt-get install -y \
  exiftool \
  binwalk \
  foremost \
  stepic \
  steghide \
  testdisk \
  pngcheck \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
