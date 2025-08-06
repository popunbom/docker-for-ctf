#!/bin/bash

# Node.js v18.x
# REF: https://github.com/nodesource/distributions/blob/master/README.md
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -

# Dirb (wordlists)
( \
  cd ~ \
  && curl -fsSL https://jaist.dl.sourceforge.net/project/dirb/dirb/2.22/dirb222.tar.gz \
  | tar -xzvf \
)

# SQLMap
pip3 install sqlmap
