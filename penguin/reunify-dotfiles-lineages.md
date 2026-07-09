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

## For User Review (2026-07-09)

Worked CI-foundations' remaining checklist down to one blocked item.
Landed on svelte (`~`): `skip_if_absent`/`with_pty` helpers in
`lib/sh/assert.sh` (+ co-located `assert_test.sh`, the harness's first
self-test), two portability bugs in `test.do`/`default.tested.do` found
via a scratch dry-run (unguarded glob/literal loops broke on a checkout
missing the shell-config surface), and `HACKING.md` documenting the
harness. All committed on svelte-crostini; `redo test` green there
throughout.

1. **Resolved 2026-07-09 (was flagged blocked, then corrected on your
   feedback):** I'd initially escalated "land the harness on main" as
   blocked on task-004-owned root `.gitignore`, presenting it as a
   decision only you/004 could make. You pointed out that was silly —
   the plan is amendable, not frozen because a file got assigned to a
   later task. Correct: the fix needed was a narrow, additive `!`
   opt-in for four new root files plus two new nested `.gitignore`s
   (`.github/`, `.local/share/redo/`), not the full ignore-scheme
   reconciliation 004 actually owns (main's deny-first vs. svelte's
   allowlist-of-ignores — still open). Landed directly: commit `b59d84f`
   in `dotfiles--main-reunify`, `./.local/share/redo/do -c test` green
   there. Noted the narrow/full split in 004's task file so it doesn't
   redo the slice.
2. **Portability gap, not yet a blocker:** `with_pty` (new helper for
   task 000's future `-i` startup tests) wraps `script -qec`, which is
   util-linux-only (`-e`/`--return`, added 2.35). BSD/macOS `script(1)`
   has no equivalent flag. Fine today — both runners (crostini, GitHub
   ubuntu-latest) are Linux — but if a startup test ever needs to run on
   macOS, `with_pty` needs a second implementation or an OSTYPE branch.
3. **Corrected a stale planning assumption:** CI-foundations' Open
   Questions claimed main's `.github/` carries Check Vim/Neovim/lint-lua
   to reconcile against svelte's check-sh.yml. Verified empirically
   (`git ls-tree origin/main -- .github` is empty; local `main` ==
   `origin/main`) — main has zero tracked `.github/` files. All four
   workflows exist only on svelte. Nothing to reconcile there for now;
   corrected in the task file.
4. Checked for a live collision risk (flagged last session: a
   concurrent session once renamed a directory mid-edit under `~`).
   Grepped `sessions.kb` for other entries scoped to `cwd: /home/bukzor`
   with no `ended:` — one hit, `move-skill-triggers-to-must-read-kb.md`,
   but it has no `session.uuid` (never started, planned only). No active
   writer found.
