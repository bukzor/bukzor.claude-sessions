---
status: likely
evidence:
  - evidence.kb/2026-09-23-001-dmesg-oom-killer-events-around-the-storm.md
  - "driftwatch.sh:39 WATCHED=(log/events/capture log/events/incident system-prompts.kb blocks.d); the pass's own successful --promote commits into system-prompts.kb (comment at driftwatch.sh:30-31: \"The pass's own commit lands there too\")"
---

# 124 idle watchers should be cheap; the OOM points at a mutual-wake cascade

The duplicate processes themselves are individually tiny (~3MB RSS
each per evidence.kb/000, idle in `inotifywait`) -- not, by themselves,
enough to explain an OOM kill on a 14GiB host with headroom before the
storm. But `driftwatch.sh` watches `system-prompts.kb`, and its own
promotion pass commits into that same directory on success. With ~124
concurrent instances all watching the same paths, any one instance's
own successful promote wakes every sibling simultaneously, each
spawning its own `claude-mitmproxy-survey-captures`/
`claude-mitmproxy-gc-patch-failures` subprocess (uv venv + git, not
free) -- turning what should be at most one promotion-pass execution
per real change into a cascade sized to the duplicate count.

Consistent with dmesg (evidence.kb/001): the process that actually
invoked the OOM killer is `claude-mitmprox` (PID 29205, comm truncated
at 15 chars) -- in the same PID range as the storm's own spawns, not
the long-lived CLI process that was ultimately killed (PID 14326).
Not confirmed by a direct process snapshot at the peak (none was taken
before the kill), so `status: likely` rather than `confirmed`.
