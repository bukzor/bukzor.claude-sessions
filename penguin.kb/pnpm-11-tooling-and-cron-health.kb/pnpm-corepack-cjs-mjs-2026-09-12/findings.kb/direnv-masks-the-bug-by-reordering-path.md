---
status: confirmed
evidence:
  - ../evidence.kb/2026-09-17-000-direnv-active-in-this-shell-direnv-env-vars.md
  - ../evidence.kb/2026-09-17-001-pure-anacron-simulated-path-sh-no-bashrc-no-direnv-has-pnpm-bin-once-after-bin.md
  - ../evidence.kb/2026-09-17-002-direnv-stdlib-path-add-unconditional-prepend-no-path-external-dedup.md
---

# The real switch is "direnv active", not "interactive vs. cron"

`~/.envrc` (this home repo has one at its root) calls
`path_add PATH .venv/bin prefix/pnpm/bin/` on every direnv-hooked
prompt. direnv's `path_add` (its stdlib generic version of `PATH_add`)
unconditionally prepends -- it only dedupes against entries direnv
itself previously added, not against `prefix/pnpm/bin` already placed
by `~/.config/sh/env.d/900-path.sh`. Each firing prepends a second
`prefix/pnpm/bin` in front of the existing one, which also happens to
land it ahead of `~/bin`.

A pure `. ~/.profile` under `/bin/sh` (no `.bashrc`, no direnv hook --
exactly what anacron runs) shows `prefix/pnpm/bin` exactly once, after
`~/bin`, matching `900-path.sh`'s own explicit ordering intent (its
comment: "enable `~/bin/` unconditionally", placed last in a
last-wins-prepend list so it wins). So `~/bin` ahead of
`prefix/pnpm/bin` is the *designed* order; direnv silently inverts it
for `~/bin`-or-below whenever its hook has fired.

Consequence for this incident: any shell without direnv's hook having
fired for `$HOME` -- not just cron specifically -- would hit the same
stale-corepack bug interactively. The 2026-09-10 working run
(`../timeline.kb/2026-09-10-000-interactive-run-masks-the-bug.md`)
worked because it was a direnv-active session, not because it was
interactive per se.

Fixed 2026-09-17: `prefix/pnpm/bin/` removed from `.envrc`'s `path_add`
call (`../remediations.kb/deduplicate-envrc-pnpm-bin-entry.md`) --
it was a global-tool entry with no reason to be tree-scoped in the
first place, unlike `.venv/bin`, which stays. `900-path.sh`'s
order is no longer inverted in direnv-active shells either.
