# 2026-09-10/17: pnpm 12 broke corepack, alerting still didn't reach usage

Two commits, pushed on `svelte-crostini`: `2109e91` (corepack) and `80149a4`
(ledger). Root-caused via `~/.local/state/cron/pnpm-upgrade-g.log`:
`pnpm-upgrade-g` had failed nightly since 2026-09-07 because pnpm 12 moved
to a native binary that corepack couldn't invoke until its own 0.35.0, and
no node build here bundled a corepack that new. Fixed by self-hosting
corepack via `pnpm add -g` instead of relying on node's bundle -- full
account in `docs/dev/adr/2026-09-10-000-corepack-self-hosted-via-pnpm-add-g.md`.
Deliberately no self-heal added for the poisoned-cache failure mode.

Separately, the user corrected a belief I'd stated as fact: `cron-status.sh`
"warns at shell start" was read as covering ongoing use, but this machine's
panes run 6-17+ days without a shell restart, so the warning had never once
reached the pane where the failing job actually lived. Fixed by polling the
same status files from tmux's `status-right` (`bin/cron-status`, shared with
the rc.d warning) -- `docs/dev/adr/2026-09-10-001-tmux-status-bar-cron-alerting.md`.
That incident's lesson (a trigger's reach decays with session age; polling a
continuously-visible surface doesn't) is now a checkable claim ledger,
`docs/dev/user-attention.claims.md` (`Skill(llm-claims-kb)`), extended after
reading `bin/alert` to add a fourth channel kind (push, coverage bounded by
call sites rather than session lifecycle) -- see
`tmux-window-naming-and-alert-identity.md`, the sibling entry for that code.

**Unbuilt idea, awaiting the owner's ruling** (see `~/.claude/todo.md`):
wire `bin/alert` into the cron-failure path (`bin/cron-status` or its
callers) so a failed job pushes a real-time notification instead of waiting
up to 15s for the tmux poll, or being silent entirely outside tmux. Not
built -- autonomous desktop notifications from a cron job is a noise-level
judgment call, not a refactor.

**Correction, same day**: the ADR's PATH-shadowing claim ("self-hosted
corepack shadows `~/bin/corepack` automatically") turned out wrong for
cron specifically -- found by a third, independent recurrence of this
exact failure class in a concurrent investigation
(`pnpm-11-tooling-and-cron-health.kb/pnpm-corepack-cjs-mjs-2026-09-12/`,
incident-forensics kb, not committed to `dotfiles`; root-caused,
fixed, and verified 2026-09-17): the real order is direnv-gated (`~/.envrc`'s
`path_add` re-prepends `~/prefix/pnpm/bin` ahead of `~/bin` on every
direnv-hooked prompt, masking the bug interactively; cron's plain
`/bin/sh` has no direnv and hits stale `~/bin/corepack` directly). Their
remediation removes `~/bin/corepack` outright (staged, not committed --
not mine to land). Pushed a correction commit rather than rewriting the
original claim: `9d49617`.
