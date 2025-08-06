FROM --platform=linux/amd64 mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
    file gdb

USER vscode

# Setup gdb
RUN mkdir -p /home/vscode/.gdb \
  && git clone https://github.com/pwndbg/pwndbg /home/vscode/.gdb/pwndbg && (cd /home/vscode/.gdb/pwndbg && ./setup.sh) \
  && git clone https://github.com/scwuaptx/Pwngdb /home/vscode/.gdb/pwngdb \
  && git clone https://github.com/longld/peda.git /home/vscode/.gdb/peda \
  && mkdir -p /home/vscode/.gdb/gef && curl -L https://gef.blah.cat/py > /home/vscode/.gdb/gef/gdbinit.py

# [gdb-peda] Patching
COPY files/fix-clearscreen.patch /home/vscode/.gdb/peda/
RUN cd /home/vscode/.gdb/peda \
  && patch -p1 < fix-clearscreen.patch

# Copy files
COPY files/usr/local/bin/* /usr/local/bin/
COPY files/home/vscode/* /home/vscode/
