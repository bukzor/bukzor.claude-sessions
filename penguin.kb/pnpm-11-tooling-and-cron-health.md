---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 9a575a9d-2319-460c-a3a0-8c57d588572b
    - 17b60946-a452-4069-838b-2b35bf98cebb
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

## Completed this session

Three commits on `svelte-crostini`, pushed: `3f0a8ba` (shell), `cab90f2`
(pnpm), `f0e66ec` (cron).

- Root cause: `.config/pnpm/rc`'s `prefix=` configured pnpm 10's global root,
  bin dir, and store. pnpm 11 reads only `config.yaml`, where `prefix` does
  not exist -- so the nightly job that installed pnpm 11 silently moved every
  global path to defaults whose bin dir is not on PATH, and failed every run
  after.
- `.config/pnpm/config.yaml` now declares `globalBinDir`/`globalDir`
  (camelCase only; `${HOME}` expands, `~` and `$HOME` do not). Store left at
  the XDG default.
- corepack is the pnpm entry point again -- `pnpm add -g pnpm` and, under
  corepack, `pnpm self-update` both refuse. `bin/corepack` reaches it via
  `volta which node`. `bin/pnpm-upgrade-g` rewritten: declared set from the
  tracked manifest, one install with a fixed flag list, `--allow-build=bun`,
  `corepack use pnpm@latest`, and a smoke test that would have caught the
  original failure on day one.
- Two separate aborts of `.profile` under errexit, both dating to the
  2026-07-09 env.d migration and both fatal to every anacron job: a `grep`
  matching nothing in `path.sh`, and `HOMEBREW="$(command -v brew)"` in
  `300-homebrew.sh`, which runs six hundred numbers before PATH gets
  homebrew. Nothing read `$HOMEBREW`, so it is gone. `source_dir` now reports
  a file whose last command failed, with errexit still armed, and
  `.profile_test.sh` sources under `set -e` -- the mode cron uses, and the
  one its existing clean-stderr assertion could never see.
- `logrotate-cron` writes `<job>.status`; `.config/sh/rc.d/cron-status.sh`
  warns at shell start; `.config/anacron/cron-health_check.sh` joins the
  `redo test` fan-out.
- Retired: `~/prefix/pnpm/{5,v3,store}` (6G by `df`), a 92M npm-global Claude
  Code at `~/prefix/{bin,lib}`, `.npmrc`, and `pi` (broken upstream) with the
  `~/node_modules` and `~/pnpm-lock.yaml` it dragged along.

## Follow-on, 2026-09-10/17: pnpm 12 broke corepack, alerting still didn't reach usage

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
