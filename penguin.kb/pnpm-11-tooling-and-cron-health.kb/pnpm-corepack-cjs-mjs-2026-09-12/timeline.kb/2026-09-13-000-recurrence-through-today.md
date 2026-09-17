---
at: "2026-09-13T00:05:01-05:00"
source: /home/bukzor/.local/state/cron/pnpm-upgrade-g.log
confidence: observed
---

# Daily recurrence, unchanged, through 2026-09-16

Identical failure recurs at every subsequent daily run:
`2026-09-13T00:05:01`, `2026-09-14T00:05:01`, `2026-09-15T00:05:01`,
`2026-09-16T00:05:01` -- same target version (pnpm 12.4.1 is still
"latest"), same `Cannot find module '.../12.4.1/bin/pnpm.cjs'`, same
`ERROR(1)`. None of these runs show a "Downloading the pnpm ... binary"
line before the crash, meaning each run reuses the already-cached (and
already-wrong) `12.4.1` extraction from 2026-09-12 rather than
re-fetching -- consistent with the mechanism in `../root-cause.md`
(the wrong `bin` path comes from which `corepack` binary runs, not from
a corrupted download, so re-fetching under the same binary would
reproduce the identical `.corepack` metadata anyway).

The user's WARNING alert on the 2026-09-16 run is what triggered this
investigation.
