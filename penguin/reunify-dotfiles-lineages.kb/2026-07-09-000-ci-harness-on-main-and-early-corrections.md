# 2026-07-09: CI harness landed on main, early portability/verification corrections

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
