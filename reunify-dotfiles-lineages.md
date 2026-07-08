---
cwd: /home/bukzor
session:
  uuid: 545f4138-cfb5-410d-b6f4-2d73afd7856a
  started: 2026-07-06T18:30:00-05:00
  ended: 2026-07-08T08:14:12-05:00
---
# Reunify Dotfiles Lineages (supertask)

Umbrella for the multi-session effort to converge svelte-crostini ↔ main
(disjoint histories, no merge base; 58 shared paths differ) to identical
content, merge with zero conflicts, and live on main. The planning session
(uuid above) produced the full plan; execution spans several future sessions.

Plan of record — do not duplicate here:

- Goal block + execution order: `~/.claude/todo.md`
- Task files (one per session/commit-group): `~/.claude/todo.kb/reunify-dotfiles/`
- Working agreements (topology, single-writer-per-branch, file ownership):
  `~/.claude/todo.kb/reunify-dotfiles/CLAUDE.md`

Execution order: CI/testing foundations (paired with
`todo.kb/2026-07-07-001-shell-function-unit-testing-and-ci-regression-harness.md`
— one harness decision serves both; see sibling session entry
`shell-function-unit-testing-and-ci-regression-harness.md`) → 000 shell
unification → 001/002/003 (parallelizable) → 005 zsh port → 004 hand-merges
→ 006 final merge + home switchover.

Operating loop: `cd ~ && claude --model fable`, `/session-start` (picks up
the todo.md goal block), work one group, `/session-end`. Main-branch commits
happen only in the clone at `~/repo/github.com/bukzor/dotfiles`; svelte
commits only in `~`. No worktrees.

Delete this file when the supertask's todo.md goal block is fully checked
and 006's switchover is done.
