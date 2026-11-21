# 2026-08-27: completed this session

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
