# docker-for-ctf

This branch handles Pwnable

## Setup

- Ubuntu 22.04 @ amd64
- With following apt packages:
  - `file`
  - `gdb`
- GDB extensions
  - [`PEDA`](https://github.com/longld/peda.git)
    - Pioneer of GDB extensions for CTF
    - [Fixing clear screen issue](./.devcontainer/files/fix-clearscreen.patch)
  - ⭐️ [`pwndbg`](https://github.com/pwndbg/pwndbg)
    - Successor of PEDA, more powerful and useful.
  - [`Pwngdb`](https://github.com/scwuaptx/Pwngdb)
    - Another successor of PEDA, less feature than Pwndbg, but more for heap exploitation.
  - ⭐️ [`GEF`](https://github.com/hugsy/gef)
    - GDB Enhanced Features, a modern GDB plugin with many enhancements.
  - Can switch above extensions by [`.gdbinit`](./.devcontainer/files/.gdbinit)
    - If you want to use PEDA, just run `gdb-peda`
    - If you want to use pwndbg, just run `gdb-pwndbg`
    - If you want to use Pwngdb, just run `gdb-pwngdb`
    - If you want to use GEF, just run `gdb-gef`
- Python
  - With following packages:
    - `pwntools`
      - A CTF framework for Python, useful for scripting and automation.
