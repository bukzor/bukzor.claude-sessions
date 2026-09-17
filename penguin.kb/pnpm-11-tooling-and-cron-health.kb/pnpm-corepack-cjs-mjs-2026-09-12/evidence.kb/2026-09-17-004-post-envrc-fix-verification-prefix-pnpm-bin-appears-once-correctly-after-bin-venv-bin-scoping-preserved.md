---
captured: "2026-09-17"
method: ./2026-09-17-004-post-envrc-fix-verification-prefix-pnpm-bin-appears-once-correctly-after-bin-venv-bin-scoping-preserved.sh
---

# Post-envrc-fix verification: prefix/pnpm/bin appears once, correctly after ~/bin, .venv/bin scoping preserved

```sh
'bash' '-c' 'cd /home/bukzor && direnv allow . && eval "$(direnv export bash)" && echo "$PATH" | tr : "\n" | nl'
```

```
[0mdirenv: loading ~/.envrc
[0mdirenv: export +CHATFS_CACHE +CONFIG_FILE_PATH ~PATH
     1	/home/bukzor/.venv/bin
     2	/home/bukzor/bin
     3	/home/bukzor/.local/bin
     4	/home/bukzor/.cargo/bin
     5	/home/bukzor/prefix/cargo/bin
     6	/home/bukzor/prefix/pnpm/bin
     7	/home/bukzor/.volta/bin
     8	/home/bukzor/.bun/bin
     9	/home/bukzor/prefix/golang/bin
    10	/sbin
    11	/usr/sbin
    12	/opt/homebrew/sbin
    13	/opt/homebrew/bin
    14	/home/bukzor/bin/shim
    15	/home/bukzor/.local/share/nvim/mason/bin
    16	/usr/local/bin
    17	/usr/bin
    18	/bin
    19	/usr/local/games
    20	/usr/games
```
