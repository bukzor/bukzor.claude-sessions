Part of `../chatfs-cli-mockup-open-todo-sweep.md`.

# 2026-07-18: verified and committed the 2026-07-17 chatfs_sh work

Picked up a fully-staged-but-uncommitted tree left by the prior
session (19 files: new `chatfs_sh.py`, `chatfs_locks.py`'s
`os.set_inheritable`, all 13 production call sites migrated, two
`todo.kb/` files closed, `todo.md` updated, devlog
`2026-07-17-001-chatfs-sh-close-fds-false-replaces-pass-fds-wiring.md`).
User asked "is this something we should commit?" — reviewed the full
staged diff (spot-checked representative files across all three
providers, confirmed the `subprocess.run` → `chatfs_sh.run` swap is
mechanical and consistent), independently reran `pytest -q` (86
passed) and `basedpyright .` (0/0/0) rather than trusting the
prior session's recorded numbers (75/75 — suite grew since).

The "staged changes" turned out to be an interrupted `git pull
worktree/atomic-chat-dir-regen/ --ff` (a `MERGE_HEAD` was still
present, left by a previous session that resolved but never
committed it) — not standalone work. First attempt used
`git commit-staged … -F <message-file>`, which silently produced a
*merge* commit (parents `6d98f99`+`ff1879f`) carrying a bespoke
feature-commit message instead of the repo's established
`Merge worktree/atomic-chat-dir-regen` convention (see `6d98f99`/
`d2effd0`/`0856b3f`) — pushed as `7febe2f` before the mismatch was
noticed. User caught it ("those changes shouldn't be in a merge
commit") and asked to fix rather than leave it. Reworded in place
without re-resolving anything: `git commit-tree` on `7febe2f`'s
existing (already-verified) tree with the same two parents and the
standard message, confirmed `git diff` between old and new commit
was empty, moved `main` via `git update-ref` (not `reset --hard`,
to avoid clobbering an unrelated uncommitted `todo.md` edit sitting
in the working tree), then `git push --force-with-lease`. Final
commit: `4c75787`.

This only completes the merge through `ff1879f` — the worktree
branch has since advanced 6 more commits (`aad5b3f`..`76f98c1`,
already pushed to `origin/atomic-chat-dir-regen`) that close the
*entire* parent atomic-chat-dir-regen task; see
`chatfs-atomic-regen-locks-wiring.md`. That merge is now a `todo.md`
"Next" item in the incubator (added this session, not yet
committed). No code changes made this session beyond the message
fix; no new backlog items beyond that pending merge and the
pre-existing `chatfs_sh.run` fd-inheritance coverage-gap note (now
moot — closed on the worktree branch, will resolve once that merge
lands).
