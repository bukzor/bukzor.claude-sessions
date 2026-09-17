---
status: done
requires-sudo: false
---

# Clear the corrupted pnpm 12.4.1 corepack cache entry

`~/.cache/node/corepack/v1/pnpm/12.4.1/.corepack` recorded the wrong
`bin/pnpm.cjs` path (written by the stale corepack 0.34.0). Confirmed
this doesn't self-heal: running the *fixed* corepack (0.36.0) against
the still-present bad cache entry reproduced the identical
`MODULE_NOT_FOUND` -- corepack reuses existing cache metadata rather
than re-deriving it on every invocation. Clearing it was required, not
just cosmetic.

Applied 2026-09-17:

```sh
rm -rf ~/.cache/node/corepack/v1/pnpm/12.4.1
```

Verified: `~/prefix/pnpm/bin/corepack pnpm@12.4.1 --version` now
re-downloads and reports `12.4.1` cleanly
(`../evidence.kb/2026-09-17-003-post-remediation-verification-fixed-corepack-resolves-pnpm-12-4-1-cron-path-picks-it-directly.md`).
Purely a cache directory; safe, re-populated on next use.
