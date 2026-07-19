---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/worktree/atomic-chat-dir-regen/docs/dev/design-incubators/chatfs-cli-mockup
session:
  uuid: # chronological; append your uuid when picking this entry up
    - b4dd7904-4ff2-4415-ad9c-78365469a19b
    - 0af6958c-01be-4bac-beea-8dbd7a152555
    - ac0e5d81-2ea8-4c05-a254-4b8dfa894b3c
    - cb7476cb-4ba0-4e71-9e5d-cbea96c357c7
  started: 2026-07-17T13:23:22-05:00
  ended: 2026-07-18T14:59:01-05:00 # parent task fully closed this session
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

**Coverage gap closed 2026-07-18** (third session): added
`it_reenters_the_parents_write_lock_via_chatfs_sh_run` to
`chatfs_locks_test.py`, spawning via `chatfs_sh.run` instead of the
test's own `child()` helper. `chatfs_sh.run` gained an optional
`timeout` param (unused by production, exists so the test fails fast
rather than hanging on a regression). Mutation-tested by hand (flipped
`close_fds` to `True`, confirmed `TimeoutExpired` at 10s, reverted).
Landed after this session merged `main` into `atomic-chat-dir-regen`
(clean merge, `05f0e6e`) -- 87/87 tests (11 new from main's
`chatfs_aistudio_layout_test.py`), basedpyright 0/0/0. Devlog
`devlog/2026-07-18-000-chatfs-sh-run-fd-inheritance-coverage-gap-closed.md`.
Not yet committed.

**Ride-alongs closed 2026-07-18** (fourth session): `capture()` now
wraps its two outputs (`cdp.jsonl`, `conversation_filename`) in one
outer `chatfs_locks.write_locked(data_dir)` spanning two inner
`chatfs_atomic.staged()` calls — a failed browse leaves the prior
`cdp.jsonl` untouched (was: unlinked before browse ran), a failed pluck
leaves the prior `conversation.json` untouched even though a
successful browse's new `cdp.jsonl` is kept. `place_meta` gained the
same shape for `meta.json` + the view symlink, plus the place-then-
purge inversion (`_purge_view_symlinks` gained a `keep` param so the
fresh symlink survives its own immediately-following purge pass — the
one wrinkle that made the "obvious" reordering not work standalone).
5 new tests in `chatfs_layout_test.py`, each hand-mutation-tested
(revert fix → confirm new test fails → restore). pytest 91/91,
basedpyright 0/0/0. Commit `6132c4d`. Devlog
`devlog/2026-07-18-001-capture-place-meta-ride-alongs-through-staged.md`.

Housekeeping same session: deleted `todo.kb/2026-07-17-000-chatfs-
locks-...md` (fully closed, cross-referenced by two devlogs already) —
todo.md's own write-up for that item was rewritten from a now-dead
markdown link to plain prose.

**Parent task fully closed 2026-07-18** (fifth session): the two
remaining items landed and this sessions.kb thread ends here.

- Unwrapped the five `[!TODO]` design docs (`chat-as-directory.md`,
  `captured-vs-derived.md`, `pipeline-implications.md`,
  `view-symlink.md`, `deterministic-regeneration.md`) -- verified each
  block's claims against ground truth first (read `chatfs_atomic.py`,
  `chatfs_layout.py`'s `place_meta`/`capture`/`_purge_view_symlinks`,
  and a `path_render.py` leaf directly), then removed the `[!TODO]`
  markup per `Skill(llm-design-kb)`'s doc-driven-development
  convention. Beyond markup removal: the layout diagram redrawn
  (`.data/$UUID` is a sibling of `.chat/$UUID`, not nested inside it),
  the purge-allowlist section rewritten as staged-promotion (that
  mechanism no longer exists), `pipeline-implications.md` rewritten
  per-script against the real code. Also fixed a stale line found
  along the way: `chatfs_atomic.py`'s docstring still said "imported
  nowhere yet" (false since 2026-07-17). Commit `e49ab0f`.
- Added the kill-mid-flight test the requirement itself specifies
  ("kill a sync mid-flight; the mount continues serving the previous
  content without errors") -- `DescribeKillMidFlight` in
  `chatfs_atomic_test.py`, 4 tests, **real** `SIGKILL` against a real
  child process (the existing crash-matrix tests all hand-craft the
  on-disk fingerprint instead). Synchronization: the child
  monkeypatches `os.rename`/`os.unlink` from itself (not from
  `chatfs_atomic.py`), prints "ready" at the instrumented point, then
  self-`SIGSTOP`s; the parent's blocking `readline()` is the sync
  primitive (no sleep, no race), then sends `SIGKILL` -- a stopped
  process still dies immediately on `SIGKILL` per POSIX. Covers the
  three fingerprints `recover()`'s docstring names plus a fourth for
  the real `RENAME_EXCHANGE` path's post-promote cleanup crash. Found
  and fixed a real deadlock in the test helper itself: an
  unconditional `proc.stderr.read()` before `SIGKILL` blocked forever,
  since a `SIGSTOP`ped-not-exited child's stderr pipe never hits EOF.
  Each boundary hand mutation-tested (shifted the pause point; forced
  the fallback path) and confirmed to fail correctly, then reverted.
  Commit `152b31b`. Both commits pushed.

Every Implementation Step and Success Criterion in the task file is now
`[x]`. Left the file in place rather than `todo clear`-deleting it --
its own Notes say it re-homes with the code at graduation, and its
`redo`-tool rejected-alternative isn't duplicated in any devlog/ADR.
pytest 95/95, basedpyright 0/0/0.

Taskfiles:
`.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-regeneration---stage-and-rename--never-rewrite-in-place.md`
(fully closed, kept in place -- see above; the child
`2026-07-17-000-chatfs-locks-...md` is deleted, see above).
Devlogs: `devlog/2026-07-17-000-chatfs-locks-stub-tests-and-child-script-extraction.md`,
`devlog/2026-07-17-001-chatfs-sh-close-fds-false-replaces-pass-fds-wiring.md`,
`devlog/2026-07-18-000-chatfs-sh-run-fd-inheritance-coverage-gap-closed.md`,
`devlog/2026-07-18-001-capture-place-meta-ride-alongs-through-staged.md`,
`devlog/2026-07-18-002-design-doc-unwrap-and-kill-mid-flight-tests-close-the-atomic-regen-task.md`.

Next up per `todo.md`: AI Studio provider parity ladder
(`todo.kb/2026-06-20-000-aistudio-provider-parity-ladder.md`), or the
strategic claude-code-as-next-provider item -- neither is a
continuation of this thread; pick up via a fresh sessions.kb entry (or
`chatfs-cli-mockup-open-todo-sweep.md`) if resuming.
