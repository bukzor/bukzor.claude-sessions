---
cwd: /home/bukzor
session:
  uuid:
    - 4e422e7d-7c8e-4238-8bd3-6312acf6d448
    - 576192e1-bd4e-4b2e-b9bb-ef2a11093839
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

## Host state (2026-11-18)

- `~` and the Windows home `/mnt/c/Users/worki` are both on `main` (both
  pulled to `055b482`). Old branches: `merged/wsl-buck-win10`; the
  Windows home's local `merged/svelte-crostini`.
- Merge done: main `ff853dc` (2026-11-18). CI on main green: Check sh,
  Lint Lua, Check Vim, Check Neovim (ubuntu, windows, macOS stable).
- `claude` is the native install in `~/.local/bin` (as penguin). The
  running sessions' pnpm copy `~/.local/share/pnpm/claude` remains.
- Workspaces: `dotfiles--svelte-crostini` (plan kb lives here) and
  `dotfiles--main` (kept until 006 closes, [!DRAFT] in the plan).
- `/etc/service` is a symlink to `~/.config/runit/buck-win10/` (commit
  `8a0b0b2`); its `windows-appdata` service keeps AppData mounted at
  `~/.config/windows`.
- Untracked user data left in place per user ruling ("leave them",
  2026-11-18): `~/deadlock-builds-recovery/`, `~/willy-practice.txt`,
  Windows `deadlock-levels.tsv`, `projects/`.

## Open

- [ ] Penguin (user, on penguin): start a session there with "Do the task in
      `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.kb/2026-07-06-006-Final-merge-and-home-switchover.kb/2026-11-18-009-penguin-switch-to-main.md`".
      Then here: review its report, confirm `merged/svelte-crostini` on origin.
- [ ] Until 009 renames svelte-crostini: plan-kb commits go on svelte, then
      `git merge origin/svelte-crostini` in `dotfiles--main`. Each svelte push
      also starts svelte's old CI (Check sh hangs 6h, `macos-12` never
      schedules): cancel them with `gh run cancel` (done 2026-11-18 18:4x).
- [ ] Once no session runs it: trash `~/.local/share/pnpm/claude` and its
      package ([!DRAFT] in the plan; `installMethod` is `native`).
- [ ] Close the plan once the user is satisfied: record its commit range,
      `git rm -r` the plan kb, retire `dotfiles--main`, end this entry.
- [ ] claude-tokens installer (bukzor-tools repo) and `init.templateDir`:
      route to bukzor-tools' own todo.kb (unrouted since 2026-11-18).
- [ ] `~/claude/router-debug` moved from `~/router-debug`: rename
      `~/.claude/projects/-home-bukzor-router-debug/` to match? (user's call)
- [ ] Deadlock notes now untracked in `~/claude/deadlock/docs/games/`
      (moved by fold unit 004); commit there when no peer is live in it
- [ ] Confirm the AppData mount returns after the next WSL restart
      (`findmnt ~/.config/windows`)
- [ ] `setup/alpine/wsl.sh` writes a `wsl.conf` with no `[boot]` runsvdir
      command, so a freshly provisioned distro would never start runit

Standing vetoes ([!DRAFT], silence lets them stand) are in the plan's 006
file and the 004/006 handoff Decisions; the latest: macOS CI `stable`-only,
nvim 0.9.5 untested on Windows, CI `fetch-depth` item moot.

## Addenda

Dated pickup write-ups in `reunify-dotfiles-lineages.kb/`. Latest:
2026-11-10 — third lineage found and planned, branch cleanup, per-host runit.
