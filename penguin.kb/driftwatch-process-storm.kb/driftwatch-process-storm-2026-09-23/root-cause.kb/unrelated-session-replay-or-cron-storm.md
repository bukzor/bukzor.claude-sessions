---
status: refuted
---

# An unrelated cron job or session-replay harness spawned the duplicates

Early false lead: transcripts under `claude-code-holistics` and
`claude-subagent-experiments` matched "driftwatch.sh" 8 times each
within a file-mtime window overlapping the storm, raising a hypothesis
that some replay/archeology harness was re-executing historical
commands.

Refuted on closer inspection: filtering by file *mtime* rather than
each JSON line's own *timestamp* field is imprecise (mtime reflects
only the last write), and the string match was inside an unrelated
filename (`driftwatch-runs-promote.md`) in a `wc -c` directory listing
-- not an actual `driftwatch.sh` invocation. Rescanning every
transcript's per-message `timestamp` and actual `tool_use` blocks
(rather than raw substring matches) found the true and only source:
`Monitor` tool_use calls in session `cc47a367`, per
`root-cause.kb/rearm-leak-plus-shared-watch-cascade.md`.
