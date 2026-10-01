---
status: confirmed
evidence:
  - evidence.kb/2026-09-23-004-re-arm-cadence-collapse-30min-normal-to-5s-storm-session-cc47a367.md
  - timeline.kb/2026-09-23-000-rearm-loop-begins.md
---

# The proximate trigger: re-arming on content events, not just expiries

`Monitor`'s own tool_result is explicit: "you get one notice at expiry
-- re-arm if you still need the watch." For six days session `cc47a367`
honored that -- 254 of its 384 total re-arms have a gap over 600s,
matching the 30-minute expiry cadence, and content-only notifications
(e.g. 15:26:30Z, "no uncovered prompt copies") got a reply but no
re-arm.

Starting 15:30:55Z the pattern breaks: every notification, including
plain steady-state all-clears, gets an immediate re-arm. 124 of the
session's re-arms have sub-10s gaps, all after this point. This is the
proximate trigger for the process count blowup (see
`monitor-does-not-dedupe-on-rearm.md` for why a redundant re-arm is
costly rather than a harmless no-op).
