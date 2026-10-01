---
status: confirmed
evidence:
  - evidence.kb/2026-09-23-000-full-process-tree-around-driftwatch-raw.md
  - "session cc47a367 transcript: each Monitor(driftwatch.sh) tool_result carries a distinct task-id (bxpw68l5l, bmqq4a6ve, b61btobee, ...)"
---

# Monitor starts an independent process every call; nothing kills the prior one

Each `Monitor(driftwatch.sh)` call gets its own task-id and starts a new
`bash -c '... && ./driftwatch.sh'` process. Re-arming while the
previous task's watch has not expired does not replace, cancel, or
dedupe against it -- the prior `driftwatch.sh` and its `inotifywait`
child simply keep running, no longer read by anything, invisible to the
agent (which only sees notifications addressed to its latest task-id).

This is why the six days of expiry-only re-arms produced no leak (each
re-arm followed the prior task's genuine end at 30 minutes) while the
12-minute notification-triggered loop produced ~124 permanently
running duplicates: one per iteration, matching the observed process
count almost exactly (130 live at discovery = 1 legitimate + 129 from
the loop, evidence.kb/000).
