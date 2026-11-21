---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 9a575a9d-2319-460c-a3a0-8c57d588572b
    - 17b60946-a452-4069-838b-2b35bf98cebb
    - a9fd5254-2b3d-4e9e-9c19-9ec328b2a766
  started: 2026-08-27T15:54:00-05:00
  ended: null
---
# pnpm 11 Global Tooling, and Scheduled Jobs That Fail Loudly

A `pnpm add` at the prompt errored, and behind it was a global npm toolchain
that had been broken since 2026-05-08 and a pair of daily jobs that had been
failing, then not running at all, without ever saying so.

The durable account is two ADRs in `bukzor/dotfiles`; read those first, not
this file: `docs/dev/adr/2026-08-27-000-pnpm-11-global-tooling-mechanism.md`
(what pnpm 11 changed and what replaced it) and
`docs/dev/adr/2026-08-27-001-scheduled-job-health.md` (why nobody noticed).

Current state: pnpm 11/12 global tooling and both daily jobs are fixed and
verified under a cron-identical environment (corepack self-hosted via
`pnpm add -g`, stale `~/bin/corepack` removed); failures now reach the
user through the shell-start warning and the tmux status bar
(`bin/cron-status`).

## Live follow-ups

- [ ] Decide whether to report pnpm's third bug upstream. Two were ruled
      not-worth-filing (`ERR_PNPM_UNEXPECTED_STORE` recommends a command that
      cannot fix it; `pnpm config set --global` refuses to run in exactly the
      state it would repair). The third surfaced after that ruling and is
      worse: under 11.0.8, `pnpm add -g --allow-build=bun bun` landed in a
      fresh empty global directory and **unlinked the five unrelated global
      bins**. Global installs are keyed on effective settings.
      `Skill(upstream-reporting)` if it goes.
- Nothing else is known-broken: both jobs were re-run under a cron-identical
  `env -i ... PATH=/usr/bin:/bin` shell and exited 0. That environment, not
  a login shell, is the one that matters here.
- Unbuilt idea, awaiting the owner's ruling (see `~/.claude/todo.md`): wire
  `bin/alert` into the cron-failure path so a failed job pushes a real-time
  notification. Not built; autonomous desktop notifications from cron is a
  noise-level judgment call, not a refactor.
- Smaller items live in `~/.claude/todo.md` (trash purge, `~/prefix/npm/`,
  the `functions.sh` loop, corepack's version-coupled shims).

## Traps worth not re-deriving

- pnpm 11.24 gives each global package its own hashed directory and keeps no
  aggregate manifest. Anything you symlink into the global root will be
  orphaned the next time pnpm renames it -- which is every settings change.
- `status` is read-only in zsh. A `status=$?` in shared shell config breaks
  every zsh startup; the four-shell `redo test` fan-out is what caught it,
  along with busybox awk rejecting bare `length`.
- Clean stderr is not the signal for shell-config health; errexit is. A
  failed command substitution prints nothing and exits 1, which a login
  shell shrugs off and every `set -e` cron job dies on.
- `har-browse` is now installed globally from the working tree
  (`pnpm add -g <path>`), so `har-browse`/`cdp-to-har` on PATH run the repo
  copy -- relevant to `har-browse-completeness-bugs.md`.

## Addenda

Dated pickup write-ups in `pnpm-11-tooling-and-cron-health.kb/`:
2026-08-27 (the original fixes) and 2026-09-10/17 (pnpm 12 broke corepack;
tmux alerting; PATH-shadowing correction `9d49617`).

The incident-forensics kb there, `pnpm-corepack-cjs-mjs-2026-09-12/`, is the
full record of the 2026-09-12/17 corepack recurrence, moved here from a loose
`$HOME` directory (private, machine-scoped notes; not `dotfiles` material).
