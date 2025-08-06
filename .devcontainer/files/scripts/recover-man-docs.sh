#!/bin/bash

# REF: https://github.com/tianon/docker-brew-ubuntu-core/issues/122

# Do not exclude man pages & other documentation
rm /etc/dpkg/dpkg.cfg.d/excludes

# Reinstall all currently installed packages in order to get the man pages back
apt-get update \
  && dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
