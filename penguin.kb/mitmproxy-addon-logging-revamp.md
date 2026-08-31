---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 0e4fc526-a59c-4fa6-8fb4-1abd81499542
  started: 2026-08-31T10:33:54-05:00
  ended: null
---
# Mitmproxy Addon Logging Revamp

The events channel is built and live. Addon events now land in one tailable
file per event type under `log/events/`, named by the logger that emitted them.
Three commits: `2726c6c` (the flocked, day-sharded fd primitives), `5fedd10`
(the handler, the addon, the taxonomy, `syscapture` emitting), `41e04e8`
(`lifecycle.reload`, verified against the running proxy).

Task and remaining subtasks: `/home/bukzor/claude/mitmproxy/.claude/todo.md`,
second top-level entry. Narrative:
`/home/bukzor/claude/mitmproxy/session.kb/2026-08-31-events-get-their-own-channel.md`.
Design: `design/040-design.kb/events-are-separate-from-logs.md` and
`ease-of-operation.kb/reload-rediscovers-open-fds.md`.

## What a next session most needs to know

The task's original justification was wrong and is corrected in the todo:
`log/prompt-captures/` is content-addressed, so it already changed only on
news. The events file removes ~0.7% of `driftwatch.sh`'s wakes, not ~98% --
288 of ~290 are the 300s ceiling, and the ceiling is the real lever.

Ratified by the operator this session: addon-reload and module-reload are
**exactly synonymous** (no `done()`/`DoneHook`, no module state, idempotent
reinstall on both paths); events are date-sharded because a date makes a shard
*finished*, which is the unit compression and `held_open()` act on; the
nine-name taxonomy; `/proc/self/fd` alone, no `/proc/locks`.

## Open work

- [ ] Restart the proxy so `-s logging_handlers.py` load-ordering takes effect
      -- the running instance predates that line and installed the handler via
      `reload.py` instead, so `lifecycle.startup` would miss its own records.
- [ ] Six of nine taxonomy names still have no emitter (`lifecycle.startup`,
      `incident.*`, `housekeeping.*`).
- [ ] Four unratified defaults awaiting a ruling, batched in todo.md rather
      than left as loose ends: the events logger's `INFO` level, emit-time
      flock contention going to `handleError` instead of an incident, the 2 MB
      tripwire and `MIN_COMPRESS_BYTES` round numbers, and two agent-authored
      testing rules now marked vetoable in the design entries.
- [ ] `driftwatch.sh` rewiring, the growth tripwire, the compression size
      floor, the `tail -F` symlink, folding in `quietconn` -- all in todo.md.
