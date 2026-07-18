---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/worktree/atomic-chat-dir-regen/docs/dev/design-incubators/chatfs-cli-mockup
session:
  uuid: # chronological; append your uuid when picking this entry up
    - b4dd7904-4ff2-4415-ad9c-78365469a19b
    - 0af6958c-01be-4bac-beea-8dbd7a152555
  started: 2026-07-17T13:23:22-05:00
  ended: null
---
# chatfs Atomic Chat-Dir Regeneration — Locks Wiring

Continuing `.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-regeneration-...md`
(steps 1-4 landed: crash-matrix tests, `.data/$UUID` layout migration,
splat output-dir arg, path_render stage-and-promote rewrite) and its
child `.claude/todo.kb/2026-07-17-000-chatfs-locks-...md`.

Progress through the first session: filled both deliberately-stubbed
subprocess tests in `chatfs_locks_test.py` (16/16, 0 stubs), migrated
`chatfs_atomic`'s superseded lock helpers into `chatfs_locks`, rewrote
its locking-contract docstring, and landed `staged()` self-locking its
own anchor (superseding the planned misuse-guard assert). Full suite
75/75 (78 minus 3 deleted-not-moved `DescribeLocking` tests),
basedpyright 0/0/0.

Second session (2026-07-17, later): the child task's last item --
"route subprocess call sites through `chatfs_locks.run`" -- was
redirected mid-task (user call): use the new `chatfs_sh.py` (a
shell-tracing `subprocess.run` wrapper the user had already added,
unwired) instead, with `close_fds=False` so a spawned child inherits
the whole fd table (plain Unix exec semantics) rather than Python's
PEP-446 opt-out-by-default fd hiding. For lock fds to actually survive
through that, `chatfs_locks._locked` now marks its anchor fd
`os.set_inheritable(fd, True)` at open time. `chatfs_locks.run` (the
`pass_fds`-based wrapper) stays, narrowed to test/orchestration use in
its docstring. All 13 production call sites wired (`run_pluck`,
`capture()`'s har-browse, every provider's path_render splat/render +
path_browse/url_render/url_browse delegate calls). Hand-verified live
that a child spawned via `chatfs_sh.run` alone (no `pass_fds`) borrows
the parent's lock. 75/75 tests, basedpyright 0/0/0. Commit `9784154`.
Devlog: `devlog/2026-07-17-001-chatfs-sh-close-fds-false-replaces-pass-fds-wiring.md`.

Child task `2026-07-17-000-chatfs-locks-...md` is now fully closed (all
implementation steps + success criteria checked) -- candidate for
`todo clear` deletion once its devlog cross-reference is confirmed
stable, not yet done this session.

**Coverage gap noted, not yet closed:** no automated test exercises
`chatfs_sh.run`'s fd-inheritance specifically (only the hand-verification
above) -- the existing `chatfs_locks_test.py::DescribeSubprocessReentry`
tests still go through `chatfs_locks.run`'s `pass_fds`, not the
`close_fds=False` path production code now actually uses. Small
(~15-20 min): add a variant of `it_reenters_the_parents_write_lock_without_deadlock`
that spawns via `chatfs_sh.run` instead of the test's own `child()`
helper.

Remaining in the parent task: `capture()`/`meta.json` through `staged`,
view-symlink place-then-purge inversion, unwrap the five `[!TODO]`
design docs, kill-mid-flight test.

Taskfiles:
`.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-regeneration---stage-and-rename--never-rewrite-in-place.md`,
`.claude/todo.kb/2026-07-17-000-chatfs-locks--fill-test-stubs--migrate-chatfs-atomic-lock-helpers--wire-call-sites.md`
(closed).
Devlogs: `devlog/2026-07-17-000-chatfs-locks-stub-tests-and-child-script-extraction.md`,
`devlog/2026-07-17-001-chatfs-sh-close-fds-false-replaces-pass-fds-wiring.md`.
