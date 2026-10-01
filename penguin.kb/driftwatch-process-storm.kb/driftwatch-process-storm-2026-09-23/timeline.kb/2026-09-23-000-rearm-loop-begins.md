---
at: 2026-09-23T15:30:55.039Z
source: session cc47a367 transcript line 4198 (evidence.kb/004)
confidence: observed
---

# Re-arm cadence collapses from ~30min to ~5s

After investigating a transient `promotion.refused`/`incident.uncaught`
event (a `.git/index.lock` collision that had already self-resolved),
the agent re-arms `driftwatch.sh` (task `bmqq4a6ve`) and, from this call
on, re-arms again after every subsequent notification -- including
plain all-clear content events, not just expiries. First sub-10s gap:
5.776s (15:30:55.039Z -> 15:31:00.815Z). 124 of the remaining re-arms in
this session have gaps under 10s.
