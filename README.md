# docker-for-ctf

Dockerfile for CTF (Capture The Flag)

```sh
$ docker run -it \
  -v "${PWD}":/ctf \
  --privileged \
  --cap-add=SYS_PTRACE \
  --security-opt="seccomp=unconfined" \
  popunbom/docker-for-ctf /bin/bash
```

## Features
- Base Image: `ubuntu:20.04`
  - Localize to `ja_JP.UTF-8`

- **Run with VSCode with "Remote - Containers" extension**
  1. Install **"Remote - Containers"** exteision
  2. Copy `.devcontainer` directory to your CTF project directory
  3. Run **"Remote-Containers: Reopen in Container"**

## General
- build-essential
- bash-completion
- less
- htop
- psmisc
- vim-gtk
- curl
- file
- wget
- git
- netcat (nc)

- Python: 2.7.x, 3.8.x
- Node.js: 14.x
- Homebrew(Linuxbrew)

- Add apt repository for Kali Linux

## Shell
- Default shell: zsh
- fzf
- zsh-autosuggestions

## Toolkits

### Crypto
- John the Ripper
- RsaCtfTool
- Dirb (wordlists)

### Forensics
- exiftool
- binwalk
- foremost
- stepic
- steghide
- testdisk
- pngcheck

### Pwn, Reversing
- gdb-multiarch, gdb-peda
  - qemu
- pwntools
- angr

- i386 libs (`lib32z1-dev`)

### Web
- sqlmap

## Author
Fumiya ENDOU <fantom0779@gmail.com>

## License
MIT
