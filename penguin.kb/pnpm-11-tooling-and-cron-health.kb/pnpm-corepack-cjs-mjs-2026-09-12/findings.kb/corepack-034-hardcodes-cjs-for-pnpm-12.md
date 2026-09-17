---
status: confirmed
evidence:
  - ../evidence.kb/2026-09-16-006-volta-bundled-corepack-0-34-0-pnpm-range-table-catch-all-6-0-0-bin-pnpm-cjs-no-v11-v12-mjs-override.md
  - ../evidence.kb/2026-09-16-007-pnpm-global-store-corepack-0-36-0-fixed-unused-by-cron-pnpm-range-table-11-0-0-bin-pnpm-mjs.md
---

# corepack 0.34.0's embedded pnpm table has no `.mjs` override; 0.36.0 does

corepack ships a hardcoded `config.json` (bundled into
`dist/lib/corepack.cjs`) mapping semver ranges of each package manager to
a `bin` path template. For pnpm, comparing the two installed corepack
versions on this machine:

- **0.34.0** (volta-bundled, actually invoked by cron):
  `"<6.0.0"` → `bin/pnpm.js`, `">=6.0.0"` → `bin/pnpm.cjs` -- a single
  catch-all for every pnpm 6.x through 12.x (and beyond).
- **0.36.0** (pnpm-managed global store, not invoked by cron):
  `"<6.0.0"` → `bin/pnpm.js`, `"6.x || 7.x || 8.x || 9.x || 10.x"` →
  `bin/pnpm.cjs`, `">=11.0.0"` → `bin/pnpm.mjs` -- correctly split out
  once pnpm 11 switched its bin file extension.

0.34.0 was released before pnpm's v11 `.cjs`→`.mjs` migration was known
to corepack; 0.36.0 has the fix. Both numbers are real, currently-installed
binaries on this machine -- this isn't a hypothetical version gap.
