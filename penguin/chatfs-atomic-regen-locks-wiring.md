---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/worktree/atomic-chat-dir-regen/docs/dev/design-incubators/chatfs-cli-mockup
session:
  uuid: # chronological; append your uuid when picking this entry up
    - b4dd7904-4ff2-4415-ad9c-78365469a19b
  started: 2026-07-17T13:23:22-05:00
  ended: null
---
# chatfs Atomic Chat-Dir Regeneration — Locks Wiring

Continuing `.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-regeneration-...md`
(steps 1-4 landed: crash-matrix tests, `.data/$UUID` layout migration,
splat output-dir arg, path_render stage-and-promote rewrite) and its
child `.claude/todo.kb/2026-07-17-000-chatfs-locks-...md`.

Progress this session: filled both deliberately-stubbed subprocess
tests in `chatfs_locks_test.py` (16/16, 0 stubs) — one proves a genuine
kernel-level `flock` block from an unrelated process tree, the other
proves the borrowed-lock table re-serializes correctly two `exec`s
deep. In passing, extracted the file's inline `python -c` scripts to
real files under `chatfs_locks_test/`. Full suite 78/78, basedpyright
0/0/0. Confirmed the migration's former "blocked on coordination" note
is resolved — the parent task's step 4 already targets `chatfs_locks`.

Remaining in the child task: migrate `chatfs_atomic`'s superseded lock
helpers into `chatfs_locks` (unblocked), rewrite its locking-contract
docstring, optional misuse guard, wire `chatfs_locks.run` through
subprocess call sites. Remaining in the parent task: `capture()`/
`meta.json` through `staged`, view-symlink place-then-purge inversion,
unwrap the five `[!TODO]` design docs, kill-mid-flight test.

Taskfiles:
`.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-regeneration---stage-and-rename--never-rewrite-in-place.md`,
`.claude/todo.kb/2026-07-17-000-chatfs-locks--fill-test-stubs--migrate-chatfs-atomic-lock-helpers--wire-call-sites.md`.
Devlog: `devlog/2026-07-17-000-chatfs-locks-stub-tests-and-child-script-extraction.md`.
