FROM ubuntu:18.04

# [18.04] change apt repository to JP
# REF: https://linuxfan.info/ubuntu-18-04-server-basic-settings
RUN perl -p -i.bak \
  -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' \
  /etc/apt/sources.list

# apt update && apt upgrade
RUN apt-get update && apt upgrade -y

# [18.04] stop interactive for tzdata
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# Bash PS1
RUN echo 'export PS1="\[$(tput bold)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;229m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;251m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> ~/.bashrc

# Locale settings
RUN apt-get install -y locales \
  && locale-gen en_US.UTF-8 \
  && locale-gen ja_JP.UTF-8 \
  && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

# Install packages
RUN apt-get install -y \
  build-essential \
  bash-completion \
  # gdb \
  less \
  htop \
  psmisc \
  vim-gtk \
  curl \
  file \
  wget \
  git 

# gdb-peda
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit

# for Forensics 
RUN apt-get install -y \
  exiftool \
  binwalk \
  foremost \
  stepic \
  steghide \
  testdisk \
  pngcheck

# for Crypto
RUN apt-get install -y john

# Install Python 2.x and 3.x
RUN apt-get install -y \
  python-dev python3-dev

# Install: pip, iPython
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python -  && pip2 install ipython
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 - && pip3 install ipython

# [Py2] Pwntools
RUN pip2 install pwntools
# [Py3] python3-pwntools
RUN pip3 install pwntools

# Pwntools: qemu
RUN apt-get install -y qemu-user

# [Py3] angr
RUN pip3 install angr

# Homebrew(Linuxbrew)
RUN git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
RUN ~/.linuxbrew/Homebrew/bin/brew shellenv >> ~/.bashrc


# 32-bit (Intel 80386 / i386) executable environment
# RUN dpkg --add-architecture i386
# RUN apt-get update
# RUN apt-get install -y \
#   lib32z1-dev \
#   gdb:i386
RUN apt-get install -y lib32z1-dev

# RsaCtfTool
RUN apt-get install -y \
  libgmp3-dev \
  libmpc-dev
RUN git clone https://github.com/Ganapati/RsaCtfTool.git ~/RsaCtfTool
RUN pip3 install -r ~/RsaCtfTool/requirements.txt

# gdb-multiarch
RUN apt-get install -y gdb-multiarch
