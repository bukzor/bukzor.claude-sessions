---
status: confirmed
evidence:
  - ../evidence.kb/2026-09-16-005-cron-anacron-equivalent-path-resolves-corepack-to-volta-bundled-0-34-0-not-the-fixed-pnpm-store-0-36-0.md
  - ../evidence.kb/2026-09-16-008-three-distinct-corepack-installs-on-this-machine-and-their-versions.md
---

# The cron job's `corepack` resolves to volta's bundled 0.34.0, not the pnpm-managed 0.36.0

Three `corepack` executables exist on this machine:

1. `/home/bukzor/prefix/pnpm/bin/corepack` -- pnpm's own global store,
   kept current by `pnpm-upgrade-g` itself (`corepack@latest` is one of
   the 7 declared packages). Currently 0.36.0.
2. `/home/bukzor/bin/corepack` -- a hand-written wrapper that execs
   `$(dirname "$(volta which node)")/corepack`, i.e. whatever corepack
   ships bundled with volta's pinned node. Currently resolves to 0.34.0
   (bundled with node 22.21.1, installed December 2025).
3. `~/.volta/bin/corepack` -- volta's own shim (bypassed by #2's design;
   not directly relevant here).

Under a `.profile`-sourced non-interactive shell -- the same
construction anacron's job line uses (`. /home/bukzor/.profile;
logrotate-cron pnpm-upgrade-g`) -- `PATH` puts `/home/bukzor/bin` ahead
of `/home/bukzor/prefix/pnpm/bin`, so plain `corepack` resolves to
binary #2, version 0.34.0.
