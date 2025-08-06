define init-peda
  source ~/.gdb/peda/peda.py
end
document init-peda
  Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
  https://github.com/longld/peda
end

define init-pwndbg
  source ~/.gdb/pwndbg/gdbinit.py
end
document init-pwndbg
  Initializes pwndbg
  https://github.com/pwndbg/pwndbg
end

define init-gef
  source ~/.gdb/gef/gdbinit.py
end
document init-gef
  Initializes GEF (GDB Enhanced Features)
  https://github.com/hugsy/gef
end

define init-pwngdb
  source ~/.gdb/peda/peda.py
  source ~/.gdb/pwngdb/pwngdb.py
  source ~/.gdb/pwngdb/angelheap/gdbinit.py
end
document init-pwngdb
  Initializes pwngdb
  https://github.com/scwuaptx/Pwngdb
end

# define hook-run
# python
# import angelheap
# angelheap.init_angelheap()
# end
# end
