Part of `../chatfs-cli-mockup-open-todo-sweep.md`.

# 2026-07-15: atomic chat-dir regeneration — design redone, not implemented

Worked in the `atomic-chat-dir-regen` worktree
(`/home/bukzor/repo/github.com/bukzor/prototype.chatfs/worktree/atomic-chat-dir-regen/`),
not the main checkout this entry's `cwd:` names — same repo, separate
working tree.

User asked to fix `.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-...md`,
calling it "both overdetermined and poorly designed." Ground-up redo:
problem inventory independent of any doc (five destroy-then-rebuild
sites: path_render's derived surface, `meta.json`, `capture()`,
view-symlink cleanup), then a full design session that replaced the
2026-07-14 "v2" per-artifact-helpers design (found to violate its own
success criteria — mixed old/new artifact sets visible to all readers,
an ENOENT window on every swap, in-memory buffering instead of
disk-spooled staging).

Landed design (not yet implemented):

- **Layout** moves captured exhaust out of `.chat/$UUID/` into a
  parallel `.data/$UUID/` tree, leaving `.chat/$UUID/` 100% derived and
  promotable as one unit (with a `.data` symlink back for inspection —
  keeps `grep -r`/`rg` working, since they don't follow encountered dir
  symlinks). Recorded as `[!TODO]` blocks in
  `design.kb/040-design.kb/chat-as-directory.md` (+ three
  `chat-as-directory.kb/` sub-docs) and `deterministic-regeneration.md`.
- **Mechanism** written as a design-sketch module,
  `chatfs_atomic.py` — imported nowhere yet, basedpyright-clean
  (0/0/0). Three public names (`read_locked`/`write_locked`/`staged`)
  over a private `_promote` kernel; `staged` recovers stale
  scratch/swap state on entry, promotes on success
  (`os.replace` for files/symlinks, `renameat2(RENAME_EXCHANGE)` for
  dirs with a two-rename-via-`.old` fallback), and preserves a failed
  attempt's on-disk bytes as `.fail` (latest-wins) on exception.
- Task file rewritten around this:
  `.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-regeneration-...md`
  (same slug, redesigned content — problem/pointers/steps, mechanism
  detail left to the sketch).

Mid-session realignment: after the user's "one staged call for splat,
running inside it" correction, the assistant initially re-answered
inside the wrong frame (shrinking an API instead of restructuring the
pipeline) — see
`devlog/2026-07-15-000-atomic-regeneration-design-settled.md`'s
"Principles surfaced" for the pivotal-word trace
(`Skill(claude-realignment)` was invoked to unstick it).

**Not done:** no wiring. `chatfs_atomic.py` has no call sites; the
layout migration, splat's output-dir argument, and the three
`path_render` rewrites are all still `[ ]` in the task file. Two
environment notes for next pickup: `uv run basedpyright` is broken in
this worktree (`error: Distribution not found at:
file://.../worktree/basedpyright-as-pyright` — a sibling-worktree path
dependency; `uvx basedpyright <file>` works as a stopgap for
single-file checks, but won't catch cross-module issues once
`chatfs_atomic.py` gets imported); and `Skill(llm-subtask)`'s `session
end` marker still points at a `bin/session-end` that doesn't exist in
that skill's `bin/` (the dedicated `Skill(session-end)` is what
actually ran) — noticed, not fixed, not worth its own tracking entry.

Full session writeup:
`devlog/2026-07-15-000-atomic-regeneration-design-settled.md`. Not yet
committed as of this addendum — see that session's closing steps.
