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

One lineage: every host's `~` is on main, and origin holds only `main`
plus `merged/*` (svelte-crostini, wsl-buck-win10, ci-vim-config-tests).
Penguin has no dotfiles workspaces besides `~`; the general clone sits on
`merged/svelte-crostini`. All of 006's user rulings are given and applied;
its checkboxes and the topology table are current. Main's Check sh runs
without the reunify-era branch checks.

- [ ] buck-win10: trash `dotfiles--svelte-crostini` (branch gone from
      origin) and refresh its own entry,
      `../buck-win10.kb/reunify-dotfiles-lineages.md`.
- [ ] 006's "`git -C ~ status` clean" waits on peers' uncommitted work in
      `~` (skill-uri, nvim lsp, pnpm config, `conventions.md`, others).
- [ ] Then close the plan: record its commit range, `git rm -r` its kb,
      close `todo.kb/2026-06-03-001`, delete this entry.

## Addenda

Dated pickup write-ups (2026-07-09 through 2026-07-13) moved to
`reunify-dotfiles-lineages.kb/` — one file per addendum, `ls` for the
full chronological list. Latest: 2026-07-13, task 004 (hand-merge true
divergences) 7/10 themes done — remaining: vim lua files,
kitty.conf+.gitmodules, claude config; 006 (final merge + switchover)
strictly last.

buck-win10's side of the effort (folding its `wsl-buck-win10` branch into
main) has its own entry: `../buck-win10.kb/reunify-dotfiles-lineages.md`.
