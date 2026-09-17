---
status: refuted
---

# Refuted: corrupted or interrupted download of the pnpm 12.4.1 tarball

Considered because the failure is `MODULE_NOT_FOUND` for a file that
"should" exist. Refuted by direct inspection: the extracted
`.cache/node/corepack/v1/pnpm/12.4.1/` tree is complete and internally
consistent (`README.md`, `CHANGELOG.md`, full `dist/node_modules/`
dependency tree, a valid root `pnpm` shell launcher, valid
`bin/pnpm.mjs`/`bin/pnpm.mjs`). Nothing is missing except the file
corepack's *own* metadata claims should be there (`bin/pnpm.cjs`), which
pnpm 12 never ships under any circumstance -- see
`../findings.kb/pnpm-12-ships-no-cjs-bin.md`. A corrupted-download theory
would predict missing or truncated *real* files, not a consistently
wrong path to a file class that doesn't exist in any pnpm 12 release.
