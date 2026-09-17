---
captured: "2026-09-16"
method: ./2026-09-16-005-cron-anacron-equivalent-path-resolves-corepack-to-volta-bundled-0-34-0-not-the-fixed-pnpm-store-0-36-0.sh
---

# Cron/anacron-equivalent PATH resolves corepack to volta-bundled 0.34.0, not the fixed pnpm-store 0.36.0

```sh
'bash' '-c' 'env -i HOME="$HOME" USER="$USER" SHELL=/bin/bash /bin/bash -lc "set -e; . /home/bukzor/.profile; echo PATH=\$PATH; echo ---; which -a corepack; echo ---; corepack --version" 2>&1'
```

```
Failed to connect to user scope bus via local transport: $DBUS_SESSION_BUS_ADDRESS and $XDG_RUNTIME_DIR not defined (consider using --machine=<user>@.host --user to connect to bus of other user)
PATH=/home/bukzor/bin:/home/bukzor/.local/bin:/home/bukzor/.cargo/bin:/home/bukzor/prefix/cargo/bin:/home/bukzor/prefix/pnpm/bin:/home/bukzor/.volta/bin:/home/bukzor/.bun/bin:/home/bukzor/prefix/golang/bin:/sbin:/usr/sbin:/opt/homebrew/sbin:/opt/homebrew/bin:/home/bukzor/bin/shim:/home/bukzor/.local/share/nvim/mason/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
---
/home/bukzor/bin/corepack
/home/bukzor/prefix/pnpm/bin/corepack
---
0.34.0
```
