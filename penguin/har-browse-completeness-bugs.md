---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/packages/har-browse
session:
  uuid:
    - c28da494-09a8-4d0e-9f4d-0b7e0c2ce421
  started: 2026-07-22T12:00:00-05:00
  ended: null
---
# har-browse completeness bugs (drain race + cache hydration)

Two real bugs behind the long-standing "wait until `has_more=false`"
flakiness on index-page captures, identified 2026-07-22. Taskfiles:
`packages/har-browse/.claude/todo.kb/2026-07-22-000-Done-Capturing-race-drops-in-flight-requests-with-no-drain.md`
(drain race — fixes 1+2 landed this session, commit `b571e99`; fix 3
and live-capture validation remain) and
`packages/har-browse/.claude/todo.kb/2026-07-22-001-claude-ai-revisits-render-from-persisted-React-Query-IndexedDB-cache--so-capture-sees-no-conversation-traffic.md`
(cache hydration — analysis only, `clearOriginStorage` fix not started).

The `has_more=false` symptom itself is still unattributed to either bug:
the only local claude capture (`a59dc891`) has no index-page data to
discriminate with. Needs a fresh live capture reproducing `has_more=false`
— ask-first browser/network action, not run any session so far. Both
taskfiles' first/early steps are blocked on this.

Devlog: `docs/dev/devlog/2026-07-22-000-har-browse-Done-Capturing-drain-race-fix.md`.
