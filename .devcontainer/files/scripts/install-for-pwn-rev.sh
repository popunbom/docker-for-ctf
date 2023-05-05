#!/bin/bash

set -euxo pipefail

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# apt-get
apt-get update && apt-get install -y \
  gdb \
  gdb-multiarch \
  netcat \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

if [[ SUPPORT_I386 ]]; then
  dpkg --add-architecture i386
  apt-get update && apt-get install -y \
    lib32z1-dev \
    gdb:i386 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
fi

# Setup gdb tools
mkdir -p ${HOME}/.gdb \
  && git clone https://github.com/pwndbg/pwndbg ${HOME}/.gdb/pwndbg && (cd ${HOME}/.gdb/pwndbg && ./setup.sh) \
  && git clone https://github.com/scwuaptx/Pwngdb ${HOME}/.gdb/pwngdb \
  && git clone https://github.com/longld/peda.git ${HOME}/.gdb/peda \
  && mkdir -p ${HOME}/.gdb/gef && curl -L https://gef.blah.cat/py > ${HOME}/.gdb/gef/gdbinit.py
# [gdb-peda] Patching
( \
  cd ${HOME}/.gdb/peda \
  && curl -fsSL https://gist.githubusercontent.com/popunbom/aa944a6efd9ddb141fc48539f97327d5/raw/fix-clearscreen.patch \
  | patch -p1 \
)
cp -vrf ${SCRIPT_DIR}/files/.gdbinit ~/.gdbinit
# Add shortcuts
cp -vrf ${SCRIPT_DIR}/files/usr/local/bin/* /usr/local/bin

# angr
pip3 install angr
