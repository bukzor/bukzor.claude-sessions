---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - a163f613-c7fb-401f-a116-e07f889c6ed0
  started: 2026-08-18T14:43:00-05:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Mitmproxy Memory Leak Followups

The 2026-08-18 leak (TUI flow store, ~526 MiB in 28 h) is diagnosed,
fixed (proxy.sh now execs headless mitmdump), and fully documented in
`proxy-memory-leak-2026-08-18/` in the repo. What remains is
verification and one decision, detailed in that kb's `todo.kb/`:

- [ ] User restarts the proxy once so the new `quietconn.py` `-s` line
      loads (new addon lines don't hot-reload).
- [ ] On/after 2026-08-19: capture proxy RSS as fix verification --
      expect ~100 MiB (startup-sized), not traffic-sized.
- [ ] User rules on standing proxy-RSS monitoring (nothing would alert
      before an OOM kill today; this incident was caught by eyeball).

Delete this file once the day-after check passes and the monitoring
question is settled.
