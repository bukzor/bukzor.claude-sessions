---
at: "2026-09-12T00:05:02-05:00"
source: /home/bukzor/.local/state/cron/pnpm-upgrade-g.log
confidence: observed
---

# First failure: `corepack use pnpm@latest` crashes on pnpm 12.4.1

Cron run `2026-09-12T00:05:02,231990366-05:00`. `pnpm add -g` upgrades
the 7 declared global packages (including `corepack@latest` itself)
successfully. Then `corepack use pnpm@latest` resolves "latest" to
12.4.1, prints "Installing pnpm@12.4.1 in the project...", and
immediately crashes:

```
Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'
...
ERROR(1)
```

`.cache/node/corepack/v1/pnpm/12.4.1/.corepack` was written at
`2026-09-12T00:05:07` (5 seconds after the run started) recording
`bin: {"pnpm": "./bin/pnpm.cjs", ...}` -- see
`../evidence.kb/2026-09-16-003-*.md`. The extracted package under that
directory contains only `.mjs` files, never `.cjs` -- see
`../evidence.kb/2026-09-16-004-*.md`.

This is the incident's first occurrence and, per the daily log, recurs
identically every day through 2026-09-16 (today) with no variation in
the error text.
