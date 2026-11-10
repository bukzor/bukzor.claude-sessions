---
cwd: /home/bukzor
session:
  uuid:
    - 4e422e7d-7c8e-4238-8bd3-6312acf6d448
  started: 2026-11-10T18:38:24+00:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Reunify Dotfiles Lineages (buck-win10)

buck-win10's share of the dotfiles reunification: fold this host's branch,
`wsl-buck-win10`, into main, then switch `~` to main with penguin at task 006.
The effort's main entry is `../penguin.kb/reunify-dotfiles-lineages.md`.

Plan of record (lives on svelte-crostini; on this host, read it in the
workspace): `~/repo/github.com/bukzor/dotfiles--svelte-crostini/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.md`.
This host's task: `…/2026-07-08-000-Reunify-dotfiles.kb/2026-11-10-000-Fold-wsl-buck-win10-into-main.md`.
Pull that workspace before reading (`git -C ~/repo/github.com/bukzor/dotfiles--svelte-crostini
pull --ff-only`): penguin may have pushed plan changes since.

## Host state (2026-11-10)

- `~` is on `wsl-buck-win10` (renamed from `master`), with ~24 uncommitted
  modified files and several untracked WSL paths; the fold task lists them.
- Workspaces: `~/repo/github.com/bukzor/dotfiles--svelte-crostini/` (clean).
  `dotfiles--main` gets created when the fold starts.
- `/etc/service` is a symlink to `~/.config/runit/buck-win10/` (commit
  `8a0b0b2`); its `windows-appdata` service keeps AppData mounted at
  `~/.config/windows`.

## Open

- [x] Fold task done (2026-11-10, svelte `c130c1c`): main `30895e0` merges
      `wsl-buck-win10`, `.claude/` reconciled to svelte (`937c97d`); main ↔
      svelte at 28 conflicts. `dotfiles--main` workspace exists here.
- [ ] Close the fold's handoff kb once the user has reviewed it: `git rm -r
      …/2026-11-10-000-Fold-wsl-buck-win10-into-main.kb/` (subagent-handoffs, Close)
- [ ] Next on this host: task 004 (hand-merge main ↔ svelte); its new fold
      leftovers: `.envrc`, `bin/alternatives/.gitignore`, `bin/brew` ruby26 `PATH`
- [ ] `~/claude/router-debug` moved from `~/router-debug`: rename
      `~/.claude/projects/-home-bukzor-router-debug/` to match? (user's call)
- [ ] Deadlock notes now untracked in `~/claude/deadlock/docs/games/`
      (moved by fold unit 004); commit there when no peer is live in it
- [ ] Confirm the AppData mount returns after the next WSL restart
      (`findmnt ~/.config/windows`)
- [ ] `setup/alpine/wsl.sh` writes a `wsl.conf` with no `[boot]` runsvdir
      command, so a freshly provisioned distro would never start runit
- [x] `recover-deadlock-builds-and-snapshotter` migrated here verbatim
      (`838f45d`; user: the Steam ID being public is fine), and dotfiles'
      `.claude/sessions.kb` on `wsl-buck-win10` is now this repo as a
      submodule (`4795ca9`)

## Overlap

- A peer session works in the same `~` on `wsl-buck-win10`'s `.claude/` and
  onboarded `../buck-win10.kb/` (`f9c5c03`). Same repo, same refs: its next
  commit lands on top of this session's work with no sync step.

## Addenda

Dated pickup write-ups in `reunify-dotfiles-lineages.kb/`. Latest:
2026-11-10 — third lineage found and planned, branch cleanup, per-host runit.
