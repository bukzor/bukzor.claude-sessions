---
status: refuted
---

# Refuted: pnpm 12.4.1's own npm package regressed vs. 12.3.4

Considered because the failure appeared exactly when the target version
moved from 12.3.4 to 12.4.1. Refuted by a direct field-by-field diff of
the two versions' `package.json` (`evidence.kb/2026-09-16-003-*` and the
`.bin`/`.type` comparison taken during triage): identical except for the
`version` string. Both ship the identical `bin/pnpm.mjs`-only layout.
The version bump is the *trigger* that forced a fresh `corepack use`
resolution (see `../timeline.kb/2026-09-12-000-first-failure.md`), not a
defect in pnpm's release.
