FROM ubuntu:20.04
USER root

# [18.04] change apt repository to JP
# REF: https://linuxfan.info/ubuntu-18-04-server-basic-settings
RUN perl -p -i.bak \
  -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' \
  /etc/apt/sources.list

# apt update && apt upgrade
RUN apt-get update && apt upgrade -y

# Bash PS1
RUN echo 'export PS1="\[$(tput bold)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;229m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;251m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> ~/.bashrc


######### Locale settings ############
# [18.04] stop interactive for tzdata
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
# Install locales
RUN apt-get install -y locales \
  && locale-gen en_US.UTF-8 \
  && locale-gen ja_JP.UTF-8 \
  && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc


############### Install packages ###############
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

# Homebrew(Linuxbrew)
RUN git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
RUN ~/.linuxbrew/Homebrew/bin/brew shellenv >> ~/.bashrc

# Install Python 2.x and 3.x
RUN apt-get install -y \
  python-dev python3-dev

# Install: pip, iPython
RUN curl -fsSL https://bootstrap.pypa.io/pip/2.7/get-pip.py | python -  && pip2 install ipython
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 - && pip3 install ipython


######################## Crypto #########################
# John the Ripper
RUN apt-get install -y john
# RsaCtfTool
RUN apt-get install -y \
  libgmp3-dev \
  libmpc-dev
RUN git clone https://github.com/Ganapati/RsaCtfTool.git ~/RsaCtfTool
RUN pip3 install -r ~/RsaCtfTool/requirements.txt


###################### Forensics ########################
RUN apt-get install -y \
  exiftool \
  binwalk \
  foremost \
  stepic \
  steghide \
  testdisk \
  pngcheck


################### Pwn, Reversing ######################
# 32-bit (Intel 80386 / i386) executable environment
# RUN dpkg --add-architecture i386
# RUN apt-get update
# RUN apt-get install -y \
#   lib32z1-dev \
#   gdb:i386
RUN apt-get install -y lib32z1-dev

# gdb-multiarch
RUN apt-get install -y gdb-multiarch

# gdb-peda
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit

# Pwntools: qemu
RUN apt-get install -y qemu-user

# [Py2] Pwntools
RUN pip2 install pwntools
# [Py3] python3-pwntools
RUN pip3 install pwntools

# [Py3] angr
RUN pip3 install angr

# netcat (nc)
RUN apt-get install -y netcat

################### Web ######################

# Node.js v14.x
# Using Ubuntu
# https://github.com/nodesource/distributions/blob/master/README.md
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs

# Dirb (wordlists)
RUN wget https://jaist.dl.sourceforge.net/project/dirb/dirb/2.22/dirb222.tar.gz

# SQLMap
RUN pip3 install sqlmap

# REF: https://github.com/tianon/docker-brew-ubuntu-core/issues/122
# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
# Reinstall all currently installed packages in order to get the man pages back
RUN apt-get update && \
  dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
  rm -r /var/lib/apt/lists/*

# fix Python Library
RUN pip3 install six==1.15.0
RUN pip3 install jedi==0.17.2


# Add apt repository for 'Kali Linux'
# REF: https://miloserdov.org/?p=3609
RUN apt update
RUN apt install -y \
  gnupg \
  aptitude
RUN curl https://archive.kali.org/archive-key.asc > /tmp/archive-key.asc
RUN apt-key add /tmp/archive-key.asc 
RUN echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list
RUN echo 'Package: *' > /etc/apt/preferences.d/kali.pref && \
  echo 'Pin: release a=kali-rolling' >> /etc/apt/preferences.d/kali.pref && \
  echo 'Pin-Priority: 50' >> /etc/apt/preferences.d/kali.pref
RUN apt update
# Example: Install 'wpscan' package from Kali Linux repo
# RUN aptitude install -t kali-rolling wpscan

# Install: fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf && \
  /root/.fzf/install

# Install: zsh
RUN apt install -y zsh
ADD files/zshrc /root/.zshrc
RUN chsh -s /usr/bin/zsh
## zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions /root/.zsh/zsh-autosuggestions
