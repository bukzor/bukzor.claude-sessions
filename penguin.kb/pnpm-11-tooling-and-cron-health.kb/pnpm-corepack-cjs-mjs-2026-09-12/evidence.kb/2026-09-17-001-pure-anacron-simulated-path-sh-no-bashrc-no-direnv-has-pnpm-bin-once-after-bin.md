---
captured: "2026-09-17"
method: ./2026-09-17-001-pure-anacron-simulated-path-sh-no-bashrc-no-direnv-has-pnpm-bin-once-after-bin.sh
---

# Pure anacron-simulated PATH (sh, no bashrc, no direnv) has pnpm/bin once, after ~/bin

```sh
'bash' '-c' '/bin/sh -c ". /home/bukzor/.profile; echo \$PATH" | tr : "\n" | nl'
```

```
     1	/home/bukzor/bin
     2	/home/bukzor/.local/bin
     3	/home/bukzor/.cargo/bin
     4	/home/bukzor/prefix/cargo/bin
     5	/home/bukzor/prefix/pnpm/bin
     6	/home/bukzor/.volta/bin
     7	/home/bukzor/.bun/bin
     8	/home/bukzor/prefix/golang/bin
     9	/sbin
    10	/usr/sbin
    11	/opt/homebrew/sbin
    12	/opt/homebrew/bin
    13	/home/bukzor/bin/shim
    14	/home/bukzor/.local/share/nvim/mason/bin
    15	/home/bukzor/.venv/bin
    16	/usr/local/bin
    17	/usr/bin
    18	/bin
    19	/usr/local/games
    20	/usr/games
```
