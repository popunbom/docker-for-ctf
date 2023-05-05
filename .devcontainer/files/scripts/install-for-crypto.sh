#!/bin/bash

# RsaCtfTool
apt-get update && apt-get install -y \
  libgmp3-dev \
  libmpc-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

git clone https://github.com/Ganapati/RsaCtfTool.git ~/RsaCtfTool
pip3 install -r ~/RsaCtfTool/requirements.txt
