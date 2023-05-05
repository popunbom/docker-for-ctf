#!/bin/bash

# Add apt repository for 'Kali Linux'
# REF: https://miloserdov.org/?p=3609
apt-get update && apt-get install -y \
  gnupg \
  aptitude \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

curl https://archive.kali.org/archive-key.asc > /tmp/archive-key.asc
apt-key add /tmp/archive-key.asc 
echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list
echo 'Package: *' > /etc/apt/preferences.d/kali.pref && \
  echo 'Pin: release a=kali-rolling' >> /etc/apt/preferences.d/kali.pref && \
  echo 'Pin-Priority: 50' >> /etc/apt/preferences.d/kali.pref
apt-get update

# Example: Install 'wpscan' package from Kali Linux repo
# $ aptitude install -t kali-rolling wpscan
