---
status: confirmed
evidence:
  - remediations.kb/kill-duplicate-processes.md
---

# Killing driftwatch.sh's bash parent does not kill its inotifywait child

Discovered while cleaning up the storm's duplicates: `kill <pid>` on
each of the 129 `/bin/bash ./driftwatch.sh` processes left all 129
`inotifywait` children alive, reparented to `systemd --user` (PID
269) -- a miniature recurrence of the same orphaning shape as the
storm itself, just not self-sustaining (no loop re-arming them).
`driftwatch.sh` has no trap to kill its own child on exit/signal, and a
plain SIGTERM to a bash process does not propagate to already-forked
children. Anyone repeating this cleanup needs a second pass matching
`inotifywait -qq -t 3600` PPIDs, not just `driftwatch.sh` itself.
