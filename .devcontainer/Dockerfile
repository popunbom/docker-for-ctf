ARG UBUNTU_VERSION
FROM mcr.microsoft.com/devcontainers/base:${UBUNTU_VERSION}
USER root

# apt-get
# REF: https://scrapbox.io/takker/Ubuntu%E3%81%AE%E3%83%AC%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%82%B5%E3%83%BC%E3%83%90%E3%82%92%E6%97%A5%E6%9C%AC%E5%9B%BD%E5%86%85%E3%81%AE%E3%81%AB%E5%A4%89%E6%9B%B4
RUN sed -i.bak \
  -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" \
  /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  # zsh \
  locales \
  build-essential \
  htop \
  # psmisc \
  # vim-gtk \
  # curl \
  file \
  # wget \
  # git 
  python2-dev python3-dev

# Python
RUN curl -fsSL https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2 -
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 -


# local settings
ENV TZ=Asia/Tokyo
RUN locale-gen en_US.UTF-8 \
  && locale-gen ja_JP.UTF-8

ARG USER=root
ARG HOME=/root

# shell
ADD files/zshrc ${HOME}/.zshrc
RUN chsh -s /usr/bin/zsh
RUN git clone --depth 1 \
  https://github.com/zsh-users/zsh-autosuggestions \
  ${HOME}/.zsh/zsh-autosuggestions
RUN git clone --depth 1 \
  https://github.com/junegunn/fzf.git \
  ${HOME}/.fzf \
  && ${HOME}/.fzf/install

ADD files/scripts ${HOME}/scripts
