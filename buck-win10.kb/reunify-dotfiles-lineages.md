---
cwd: /home/bukzor
session:
  uuid:
    - 4e422e7d-7c8e-4238-8bd3-6312acf6d448
    - 576192e1-bd4e-4b2e-b9bb-ef2a11093839
    - 78c99d42-9016-4cc8-926b-5ab86f150e58
    - eac9f069-da3b-47bc-9bd4-981218045b9d
  started: 2026-11-10T18:38:24+00:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Reunify Dotfiles Lineages (buck-win10)

buck-win10's share of the dotfiles reunification: fold this host's branch,
`wsl-buck-win10`, into main, then switch `~` to main with penguin at task 006.
This is now the effort's main entry: penguin's share ended 2026-11-25
(`../penguin.kb/reunify-dotfiles-lineages.md`, which holds the early addenda).

Plan of record, on main in `~`: `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.md`
(`git -C ~ pull --ff-only` first).

## Host state (2026-11-18)

- `~` and the Windows home `/mnt/c/Users/worki` are both on `main` (both
  pulled to `055b482`; WSL `~` at `a62398f` on 2026-11-24, after a stale
  local main whose 7 commits origin already held as rebased copies). Old branches: `merged/wsl-buck-win10`; the
  Windows home's local `merged/svelte-crostini`.
- Merge done: main `ff853dc` (2026-11-18). CI on main green: Check sh,
  Lint Lua, Check Vim, Check Neovim (ubuntu, windows, macOS stable).
- `claude` is the native install in `~/.local/bin` (as penguin). The
  running sessions' pnpm copy `~/.local/share/pnpm/claude` remains.
- Workspaces: `dotfiles--svelte-crostini`, obsolete (see Open).
  `dotfiles--main` moved to `~/trash/` 2026-11-24 per the user's
  ruling: `~` on main is the working copy.
- `/etc/service` is a symlink to `~/.config/runit/buck-win10/` (commit
  `8a0b0b2`); its `windows-appdata` service keeps AppData mounted at
  `~/.config/windows`.
- Untracked user data left in place per user ruling ("leave them",
  2026-11-18): `~/deadlock-builds-recovery/`, `~/willy-practice.txt`,
  Windows `deadlock-levels.tsv`, `projects/`.

## Open

As of 2026-11-25 (penguin): one lineage. Every host's `~` is on main;
origin holds only `main` and `merged/*`. 009 is done and reviewed, all of
006's user rulings are applied, and main's CI is green.

- [x] 2026-11-27: `dotfiles--svelte-crostini` trashed (clean, HEAD =
      `merged/svelte-crostini`). Local `main` reset to origin (9becce9); its
      one local commit was the same patch. Stale dirty copies of
      `lazy-lock.json` and SendMessage `description.md` (origin had
      newer ones) were dropped; backups in `~/trash/sync-main-2026-11-27/`.
- [x] 2026-11-27: 006 OQ3's ruling applied to buck-win10's general clone
      `~/repo/github.com/bukzor/dotfiles` too: branch renamed
      `merged/svelte-crostini`, its `main` fast-forwarded.
- [ ] 006's "`git -C ~ status` clean" waits on peers' uncommitted work in
      `~` on each host (penguin: skill-uri, nvim lsp, pnpm config,
      `conventions.md`, others). buck-win10's remainder (2026-11-27):
      - `sessions.kb` gitlink: lazy by design (its CLAUDE.md); bump at close.
      - `.claude/todo.kb/2026-11-24-000-WSL-disk-layout.*` and its
        `todo.md` line: an idle 2026-11-24 session's finished plan. To
        commit at session end.
      - `.claude/settings.json` `verbose: false`: edited 2026-11-27 14:55,
        likely the user's `/config`. Needs the user's word.
      - mitmproxy upstream captures `Bash/upstream.d/harness-sonnet-2.1.330.md`
        and `Monitor/upstream.d/v2.1.330.md` (2026-11-23), not yet
        reviewed for folding into the stubs (cf. penguin's `829b906`).
      - `deadlock-builds-recovery/`, `willy-practice.txt`: left in place
        by ruling (2026-11-18), so "clean" can't hold literally here.
- [ ] Orphan WIP found 2026-11-27 in the general clone (uncommitted, dated
      2026-09-20/21, never on any branch): new `bin/claude-api-spend` (Admin
      API cost report) and `claude-usage-rate`'s `CLAUDE_CODE_OAUTH_TOKEN`
      fallback, plus `trash/` in `.gitignore`. Port to `~`, or drop?
- [ ] Then close the plan: record its commit range, `git rm -r` its kb,
      close `todo.kb/2026-06-03-001`, delete both hosts' reunify entries
      (dotfiles `.claude/todo.md`, under the Reunify line).

Per-task follow-ups were routed 2026-11-18 to their owners' task lists:
dotfiles `.claude/todo.md` (pnpm `claude`, AppData mount, `wsl.sh` runit),
`~/.claude/.claude/todo.md` (router-debug projects dir), bukzor-tools
`.claude/todo.md` (`init.templateDir` rewrite), and
`~/claude/deadlock/.claude/todo.md` (commit `docs/games/`).

Standing vetoes ([!DRAFT], silence lets them stand) are in the plan's 006
file and the 004/006 handoff Decisions; the latest: macOS CI `stable`-only,
nvim 0.9.5 untested on Windows, CI `fetch-depth` item moot.

## Addenda

Dated pickup write-ups in `reunify-dotfiles-lineages.kb/`. Latest:
2026-11-10 — third lineage found and planned, branch cleanup, per-host runit.
