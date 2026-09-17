---
status: confirmed
evidence:
  - ../evidence.kb/2026-09-16-004-pnpm-12-4-1-extracted-bin-contains-only-mjs-no-cjs-confirms-shipped-layout.md
  - ../evidence.kb/2026-09-16-003-corepack-corepack-cache-metadata-12-3-4-working-mjs-vs-12-4-1-broken-cjs.md
---

# pnpm 12.x (and 11.x) ship only `bin/pnpm.mjs`; `bin/pnpm.cjs` never exists

Confirmed on the actual extracted tarball contents for both 12.3.4 and
12.4.1: `bin/` holds `pnpm.mjs` and `pnpx.mjs` only. The package's own
`package.json` `bin` field doesn't even point there directly -- it points
to a root-level `pnpm` POSIX-shell launcher, which `exec`s `bin/pnpm.mjs`
itself. There is no code path in pnpm 12 that produces or reads a `.cjs`
file. Any consumer (corepack 0.34.0, in this incident)
that assumes `.cjs` for pnpm ≥6.0.0 will fail for every pnpm 11.x/12.x
version, regardless of which one, with the same `MODULE_NOT_FOUND`.
