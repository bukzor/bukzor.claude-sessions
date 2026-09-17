---
captured: "2026-09-16"
method: ./2026-09-16-002-bin-corepack-wrapper-source-routes-to-volta-node-bundled-corepack.sh
---

# bin/corepack wrapper source (routes to volta node bundled corepack)

```sh
'cat' '/home/bukzor/bin/corepack'
```

```
#!/bin/sh
# corepack, as shipped with volta's current node.
# Bypasses volta's shim to avoid PATH injection, and follows node upgrades.
exec "$(dirname "$(volta which node)")/corepack" "$@"
```
