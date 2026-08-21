---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - a163f613-c7fb-401f-a116-e07f889c6ed0
    - d9c01051-1ea5-4762-b3c7-2b4465ba068d
  started: 2026-08-18T14:43:00-05:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Mitmproxy Memory Leak Followups

The 2026-08-18 leak (TUI flow store, ~526 MiB in 28 h) is diagnosed,
fixed (proxy.sh now execs headless mitmdump), and fully documented in
`proxy-memory-leak-2026-08-18/` in the repo. What remains is one
decision, detailed in that kb's `todo.kb/`:

- [x] User restarts the proxy once so the new `quietconn.py` `-s` line
      loads (new addon lines don't hot-reload). Done 2026-08-18 16:01
      (pid 29920, via commit `324b7e4`).
- [x] On/after 2026-08-19: capture proxy RSS as fix verification --
      expect ~100 MiB (startup-sized), not traffic-sized. Done
      2026-08-21: 99 MiB -> 141 MiB over ~66.6 h (~0.63 MiB/h), ~30x
      slower than the pre-fix leak rate --
      `proxy-memory-leak-2026-08-18/findings.kb/headless-mitmdump-growth-rate-is-normal.md`.
- [ ] User rules on standing proxy-RSS monitoring (nothing would alert
      before an OOM kill today; this incident was caught by eyeball).
      Still open: the day-3 read shows slow-but-monotonic growth, no
      plateau/shrink -- close as "normal, no monitoring needed", or add
      a cheap periodic RSS log / watch longer first?

Delete this file once the monitoring question is settled.
