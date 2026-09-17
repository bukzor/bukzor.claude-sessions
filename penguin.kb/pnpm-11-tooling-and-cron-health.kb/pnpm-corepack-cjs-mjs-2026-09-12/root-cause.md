# Root cause: confirmed, fixed, and verified

`~/bin/corepack` routed every `corepack` invocation through whatever
corepack ships bundled with volta's currently-pinned Node (22.21.1 →
corepack 0.34.0), a deliberate design choice from `cab90f2` meant to keep
corepack current "for free" as Node upgrades. Node's corepack-bundling
cadence lags corepack's own release cadence: 0.34.0 predates the fix
(`nodejs/corepack#887`) for pnpm 11/12's move to a `bin/pnpm.mjs`-only
layout, so its embedded version table still maps every pnpm ≥6.0.0 to
`bin/pnpm.cjs` -- a file pnpm 11.x/12.x never ship.

A second, separately-installed corepack (0.36.0, in pnpm's own global
store, kept current because `pnpm-upgrade-g` upgrades `corepack` as one
of its own declared global packages) *does* have the fix. Which of the
two plain `corepack` resolves to was a PATH-order question -- and the
deciding factor was **whether direnv's hook had fired for `$HOME`**, not
"interactive vs. cron" as first framed. `~/.config/sh/env.d/900-path.sh`
deliberately puts `~/bin` ahead of `prefix/pnpm/bin` (its own comment:
"enable `~/bin/` unconditionally"); `~/.envrc`'s `path_add` call
unconditionally re-prepends `prefix/pnpm/bin` ahead of that on every
direnv-hooked prompt, silently inverting the intended order. Anacron's
job (plain `/bin/sh`, no `.bashrc`, no direnv hook) saw the *un-inverted*
order and hit the stale binary; the 2026-09-10 working run happened to
be direnv-active. See `findings.kb/direnv-masks-the-bug-by-reordering-path.md`.

Losing alternatives, kept in `root-cause.kb/` for the record:
corrupted/interrupted download (refuted -- the extraction is complete
and internally consistent), and a regression in pnpm 12.4.1's own
package (refuted -- byte-identical layout to the working 12.3.4 apart
from the version string).

## Fixed, 2026-09-17

Two coupled changes, both applied and verified end-to-end
(`evidence.kb/2026-09-17-003-...md`):

- `git rm bin/corepack` -- removed the obsolete wrapper outright rather
  than repointing it, so `corepack` now falls through PATH to
  `prefix/pnpm/bin/corepack` (0.36.0) unconditionally, cron included.
  Staged, not yet committed (user's call when to land it).
- `rm -rf ~/.cache/node/corepack/v1/pnpm/12.4.1` -- cleared the bad
  cached metadata; confirmed the fixed corepack alone was *not*
  sufficient without this, since it reuses existing cache entries
  rather than re-deriving them.

Post-fix, the cron-simulated shell now resolves `corepack` directly to
`prefix/pnpm/bin/corepack`, and that binary correctly resolves and
downloads pnpm 12.4.1.

The `~/.envrc` PATH-duplication was also fixed: `prefix/pnpm/bin/` was
removed from its `path_add` call, since it's a global-tool entry that
`900-path.sh` already covers unconditionally and had no reason to be
tree-scoped (unlike `.venv/bin`, which stays) --
`remediations.kb/deduplicate-envrc-pnpm-bin-entry.md`.

Upstream: a comment documenting the Node-bundled-corepack angle was
posted to `nodejs/corepack#775`
(<https://github.com/nodejs/corepack/issues/775#issuecomment-5720549030>),
since that thread hadn't yet covered "stale bundled corepack, no
diagnostic" as a distinct cause. See `reports.kb/corepack-775-comment.md`.

See `findings.kb/` for the evidence-backed claims and `remediations.kb/`
for what was done.
