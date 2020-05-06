# docker-for-ctf

Docker Container for CTF (Capture The Flag)

## Features

- Image: `ubuntu:18.04`
- Localize to `ja_JP.UTF-8`

- Installed: build-essential, bash-completion, less, htop, psmisc, vim-gtk, curl, file, wget, git

- Language: Python(2.7.x, 3.x) with IPython

- Package Manager: Homebrew(Linuxbrew)

- **Run with VSCode with "Remote - Containers" extension**

## Toolkits

### Crypto
- John the Ripper
- RsaCtfTool

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

## Author
Fumiya ENDOU<fantom0779@gmail.com>

## License
MIT
