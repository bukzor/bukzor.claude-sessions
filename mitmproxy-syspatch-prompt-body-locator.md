---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: 4c07d8be-16e0-4010-bec9-503fbacfbe3a
  started: null
  ended: 2026-07-03T15:24:23-05:00
---
# Mitmproxy Syspatch — Prompt-Body Locator Incidents

Live traffic hit `syspatch.py`'s `assert len(system) == 1` (a
content-blocks `system` list with zero blocks matching
`\nYou are an interactive agent`), spamming Addon errors on every such
request. This session routed that failure through the existing
content-addressed capture system (`patch-failures/`, rule
`_locate-system-prompt`, kind `found-N-prompt-bodies`): capture once per
distinct content, warn once, pass the request through unpatched.
Committed as 77815a8; verified offline with fake flows.

Root cause of the zero-body traffic is still unknown — diagnosis is
blocked until the next live occurrence lands a capture.

- [ ] Triage the first `_locate-system-prompt` capture (details in
  `/home/bukzor/claude/mitmproxy/.claude/todo.md`)
