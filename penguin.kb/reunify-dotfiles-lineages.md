---
cwd: /home/bukzor
session:
  uuid:
    - 545f4138-cfb5-410d-b6f4-2d73afd7856a
    - 58689610-0fee-4260-ac2f-eccd37c487f8
    - 21220341-2ef8-4c38-81ce-050119106309
    - 3d5f08d8-08c4-4a84-ab3a-4b161b0c8427
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

## Status (2026-11-24, written from buck-win10)

Merged: main `ff853dc` (2026-11-18) holds all three lineages; CI green;
buck-win10's `~` is on main. Everything else waits on penguin.

- [ ] Penguin's next session: run `git -C ~ pull --ff-only` (`~` is
      `svelte-crostini`, and the brief arrived there 2026-11-18), then do
      the task in
      `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.kb/2026-07-06-006-Final-merge-and-home-switchover.kb/2026-11-18-009-penguin-switch-to-main.md`.
      It switches `~` to main and renames `svelte-crostini` to
      `merged/svelte-crostini`. svelte has penguin commits main lacks
      (through 2026-11-22); the brief's opening step merges them.
      Append this session's uuid above.

## Addenda

Dated pickup write-ups (2026-07-09 through 2026-07-13) moved to
`reunify-dotfiles-lineages.kb/` — one file per addendum, `ls` for the
full chronological list. Latest: 2026-07-13, task 004 (hand-merge true
divergences) 7/10 themes done — remaining: vim lua files,
kitty.conf+.gitmodules, claude config; 006 (final merge + switchover)
strictly last.

buck-win10's side of the effort (folding its `wsl-buck-win10` branch into
main) has its own entry: `../buck-win10.kb/reunify-dotfiles-lineages.md`.
