---
cwd: /home/bukzor
session:
  uuid:
    - 545f4138-cfb5-410d-b6f4-2d73afd7856a
    - 58689610-0fee-4260-ac2f-eccd37c487f8
    - 21220341-2ef8-4c38-81ce-050119106309
    - 3d5f08d8-08c4-4a84-ab3a-4b161b0c8427
    - 08a2b58d-5de2-4b5a-a991-ee74f5e0e78a
  started: 2026-07-06T18:30:00-05:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Reunify Dotfiles Lineages (supertask)

Umbrella for the multi-session effort to converge svelte-crostini ↔ main
(disjoint histories, no merge base; 58 shared paths differ) to identical
content, merge with zero conflicts, and live on main. The planning session
(uuid above) produced the full plan; execution spans several future sessions.

Plan of record — do not duplicate here:

- Goal, execution order, operating loop:
  `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.md` (pointed to from
  `~/.claude/todo.md`)
- Task files (one per session/commit-group): `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.kb/`
- Working agreements (topology, single-writer-per-branch, file ownership):
  `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.kb/CLAUDE.md`

See sibling session entry `shell-function-unit-testing-and-ci-regression-harness.md`
for the CI/testing-foundations pairing.

Delete this file when the supertask's todo.kb entry is fully checked and
006's switchover is done.

## Status (2026-11-25)

Every host's `~` is on main. Unit 009 ran on penguin 2026-11-25: it merged
svelte's last 10 commits into main, switched `~`, and renamed
`merged/svelte-crostini` on origin. Its report and 3 open questions are in
the 009 handoff file (path in the plan's 006 kb).

buck-win10's "plan-kb edits go on both branches" rule (its sessions.kb
commit of 2026-11-24) expired when 009 renamed svelte. Its entry's
Workspaces line and the plan's topology table are now stale; both are
buck-win10's to fix, below.

- [ ] buck-win10 (coordinator): review the 009 report, update 006's
      checkboxes and the topology table, prune `dotfiles--svelte-crostini`
      (its branch is gone from origin).
- [ ] User rulings, put to the user 2026-11-25 with these recommendations
      (penguin acts on them once given):
  - 009 OQ1: delete `mechanical-fast-forwards_check.sh`,
    `final-merge_check.sh`, and `check-sh.yml`'s `fetch-depth` comment.
    Recommend yes: main's Check sh is red, and both scripts were to last
    only until 006.
  - 009 OQ3: rename the general clone's local `svelte-crostini` to
    `merged/svelte-crostini`. Recommend yes; the 2026-11-18 ruling
    already says "locally and on the remote".
  - 006 push-vs-hold: recommend closing; the 2026-11-22 ruling in
    `git/conventions.md` ("push each commit once it is stable") settles it.
  - 006 `ci-vim-config-tests`: open, no recommendation. Peers' vim WIP
    in `~` mirrors it, so the ruling also routes that work.
- [ ] 006's "`git status` clean" waits on peers committing their WIP in `~` (009 OQ2).

Also this session, 2026-11-25: made the tmux session's handed-off
last commit (`todo.kb/2026-11-25-004`, done): closed its four briefs, and
filed its open rulings in `~/.claude/todo.md` and its `dead-sessions` item
in bukzor-agent-skills' todo.

## Addenda

Dated pickup write-ups (2026-07-09 through 2026-07-13) moved to
`reunify-dotfiles-lineages.kb/` — one file per addendum, `ls` for the
full chronological list. Latest: 2026-07-13, task 004 (hand-merge true
divergences) 7/10 themes done — remaining: vim lua files,
kitty.conf+.gitmodules, claude config; 006 (final merge + switchover)
strictly last.

buck-win10's side of the effort (folding its `wsl-buck-win10` branch into
main) has its own entry: `../buck-win10.kb/reunify-dotfiles-lineages.md`.
