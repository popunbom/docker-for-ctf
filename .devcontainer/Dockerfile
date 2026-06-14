FROM mcr.microsoft.com/devcontainers/base:trixie

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  file \
  python3 python3-pip \
  ltrace nasm gdb \
  ;

# Install python packages
RUN pip install --break-system-packages --no-cache-dir \
  six \
  ipython \
  pwntools

USER vscode

# Setup gdb
RUN mkdir -p /home/vscode/.gdb \
  && git clone https://github.com/pwndbg/pwndbg /home/vscode/.gdb/pwndbg && (cd /home/vscode/.gdb/pwndbg && ./setup.sh) \
  && git clone https://github.com/scwuaptx/Pwngdb /home/vscode/.gdb/pwngdb \
  && git clone https://github.com/longld/peda.git /home/vscode/.gdb/peda \
  && mkdir -p /home/vscode/.gdb/gef && curl -L https://gef.blah.cat/py > /home/vscode/.gdb/gef/gdbinit.py \
  ;

# [gdb-peda] Patching
COPY files/peda/* /home/vscode/.gdb/peda/
RUN cd /home/vscode/.gdb/peda \
  && patch -p1 < patch.patch \
  ;

# Copy files
COPY files/usr/local/bin/* /usr/local/bin/
COPY files/home/vscode/* /home/vscode/
