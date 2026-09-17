---
at: "2026-08-27T17:33:43-05:00"
source: git log -1 cab90f2 -- bin/corepack
confidence: observed
---

# `bin/corepack` wrapper introduced, routing through volta's node

Commit `cab90f2` ("pnpm: reconfigure global tooling for pnpm 11") adds
`~/bin/corepack`:

```sh
#!/bin/sh
# corepack, as shipped with volta's current node.
# Bypasses volta's shim to avoid PATH injection, and follows node upgrades.
exec "$(dirname "$(volta which node)")/corepack" "$@"
```

Intent per the commit message: pnpm 11 can no longer self-update, so
`corepack use pnpm@latest` becomes the only way to move the pin, and this
wrapper is how `corepack` itself is reached. Design assumption: routing
through volta's node means corepack "follows node upgrades" and stays
current that way, instead of being pinned to a snapshot.

This is the root-cause mechanism this incident traces back to -- see
`../root-cause.md`.
