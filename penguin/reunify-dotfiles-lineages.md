---
cwd: /home/bukzor
session:
  uuid:
    - 545f4138-cfb5-410d-b6f4-2d73afd7856a
    - 58689610-0fee-4260-ac2f-eccd37c487f8
  started: 2026-07-06T18:30:00-05:00
  ended: null
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

## For User Review (2026-07-09, latest)

CI-foundations is now fully checked off (only remaining item, CI
`fetch-depth: 0`, is deferred to whichever of 001/006 writes the first
cross-ref check — not a blocker). Task 000 (shell config unification):
svelte-side done earlier; this session did the main-side mechanical
mirror — `.config/sh` tree + `.profile`/`.bashrc` + both test files copied
to `dotfiles--main-reunify`, all 20 shell-matrix cells + no-dead-paths
check green via the vendored zero-dependency harness. Commits: `d7dac7a`
(main), `1aedb00` (svelte, task-file updates).

Two narrow harness/gitignore gaps found and fixed while mirroring (both
additive, not the full ignore-scheme reconciliation 004 owns):
`test.do` on main predated `.bashrc_test.sh` (added on svelte after the
harness first landed) and silently skipped its whole shell matrix;
`.config/.gitignore`'s and `lib/.gitignore`'s un-ignore-everything-non-dotfile
rules were also un-ignoring generated `*.tested`/`*.checked` stamp
certificates — added re-ignores to both.

Decision made: main's homebrew PATH port keeps svelte's current
unconditional prepend, no OSTYPE branch (user chose this over adopting
main's original Linux-append rationale, to avoid a live PATH-ordering
change on this actual machine).

New finding, recorded in 003's task file: the main-reunify clone's root
`CLAUDE.md`/`.claude/CLAUDE.md` carry an old, different convention set
(TodoWrite-disabled/`bin/trash`/"REVIEW NEEDED:", self-declared as
overriding everything) — superseded by the current `~/.claude` system,
flagged as a concrete example under 003's already-planned `.claude/`
main-only-subset triage.

Still open in 000: folding in main-only `.sh_env` content (OSTYPE/CPUTYPE
exports, macOS `path_helper`, TMPDIR selection, private-dotfiles hook,
TERM-fixing) — plan written in the task file, TERM-fixing flagged as the
one fragile piece to scope carefully if it doesn't test clean.

### Earlier 2026-07-09 work (superseded/resolved, kept for context)

1. **Resolved (was flagged blocked, then corrected on your
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
2. **Portability gap, not yet a blocker:** `with_pty` (helper for
   task 000's `-i` startup tests) wraps `script -qec`, which is
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
4. Checked for a live collision risk (flagged an earlier session: a
   concurrent session once renamed a directory mid-edit under `~`).
   Grepped `sessions.kb` for other entries scoped to `cwd: /home/bukzor`
   with no `ended:` — one hit, `move-skill-triggers-to-must-read-kb.md`,
   but it has no `session.uuid` (never started, planned only). No active
   writer found — rechecked this session too, same result.
