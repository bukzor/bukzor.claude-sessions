---
status: confirmed
evidence:
  - "driftwatch.sh:97-99 (read in full 2026-09-23, source of record: /home/bukzor/claude/mitmproxy/driftwatch.sh)"
  - evidence.kb/2026-09-23-004-re-arm-cadence-collapse-30min-normal-to-5s-storm-session-cc47a367.md
---

# Why the loop is self-sustaining: driftwatch.sh always prints on its first pass

`driftwatch.sh` starts each run with `previous=''` (line 99), by design
("arming the watch reports whatever accumulated while no session was
open, and an all-clear proves it is live" -- the script's own comment).
That means every *fresh* process -- and `Monitor(driftwatch.sh)` starts
a wholly fresh process on every call, per
`monitor-does-not-dedupe-on-rearm.md` -- immediately prints and
therefore immediately notifies, whether or not anything actually
changed.

Transcript timing confirms it: task `bmqq4a6ve` armed at 15:30:55.039Z,
notified at 15:30:58.239Z -- 3.2s later, not plausibly a real file
change being noticed, but that process's own bootstrap print. The agent
reads this as "an event," replies "no action needed," and (per the
other finding) re-arms anyway -- which starts the next fresh process,
which immediately prints, which notifies, which gets re-armed. The loop
needs no external input once it starts; its ~5s period is round-trip
tool-call + reply latency, not any real signal.
