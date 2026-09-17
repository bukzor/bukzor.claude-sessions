---
at: "2026-09-10T09:10:00-05:00"
source: "mtime of prefix/pnpm global-store corepack/package.json and of .cache/node/corepack/v1/pnpm/12.3.4/.corepack (same minute); pnpm-upgrade-g comment '(found 2026-09-10 chasing the pnpm-12 MODULE_NOT_FOUND incident)'"
confidence: inferred
---

# A same-day run resolves `corepack` to the fixed 0.36.0 and succeeds

`prefix/pnpm/global/.../node_modules/corepack/package.json` (version
0.36.0) and `.cache/node/corepack/v1/pnpm/12.3.4/.corepack` (correctly
recording `bin/pnpm.mjs`) both carry an mtime of 2026-09-10 09:10. The
`pnpm-upgrade-g` script itself was edited the same day with a comment
referencing "chasing the pnpm-12 MODULE_NOT_FOUND incident" (see
`../evidence.kb/2026-09-16-001-pnpm-upgrade-g-script-source.md`, the
`installed()` function comment).

Read together, this is a manual/interactive session on 2026-09-10 that
hit a pnpm-12 MODULE_NOT_FOUND failure, worked on it, and in the process
ran `corepack use pnpm@latest` (or equivalent) under a shell whose PATH
put `prefix/pnpm/bin` ahead of `~/bin` -- resolving to the *fixed*
corepack 0.36.0 and writing correct `.mjs` metadata for 12.3.4.

Not directly observed: nobody captured that session's actual `PATH` or
`which corepack` output, so the exact mechanism is inferred rather than
witnessed. What is certain from the timestamps is that a working
resolution happened once, then the next scheduled (non-interactive) run
regressed -- see the 2026-09-12 entry.
