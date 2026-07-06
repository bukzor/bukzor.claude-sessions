---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: f112d88d-a1e4-4d3d-9030-cad9db0971a4
  started: null
  ended: 2026-07-04T18:12:23-05:00
cost-benefit-sweh:
  timebox:
    '@value': 0
    rationale: 'pointer entry: session ended 2026-07-04; sole open item is live verification, tracked in mitmproxy/.claude/todo.md'
    confidence: confident
  benefit-2w:
    '@value': 0
    confidence: confident
---
# Mitmproxy — Uncaught-Exception Capture (reusing patch-failures)

Extended the `patch-failures/` content-addressed incident system (previously
patch-application-issue-only) to also catch uncaught exceptions escaping any
of the three addon hooks. Extracted the generic capture primitives
(`content_hash`, `save_body`, `save_incident`, the `Incident` record, renamed
from `PatchIssue`) out of `syspatch.py` into a new `incidents.py`, added
`incidents.capture_uncaught(rule, exc, capture_dir)`, and wrapped
`request`/`response` in `syspatch.py`, `thinkpatch.py`, `flow2jsonl.py` in
try/except: capture under rule `_uncaught-{addon}` (kind = exception class
name), then re-raise — capture, not fail-soft. Documented in
`CLAUDE.kb/patch-failure-triage.md`.

Verified offline: `check_patches.py` still zero-warnings after the rename;
an ad hoc (uncommitted, discarded) smoke script drove malformed flows through
all three addons' hooks and confirmed capture + dedup + re-raise. No live
`proxy.sh` run yet, and no permanent test exists for `capture_uncaught` — see
open items below and `mitmproxy/.claude/ideas.kb/2026-07-03-000-addon-level-request-tests-via-mitmproxytest.md`.

- [x] Verify uncaught-exception capture end-to-end live — proven 2026-07-04
  by a real capture from live traffic (thinkpatch disabled-thinking
  `AssertionError`, `_uncaught-thinkpatch/4380a5b276ed`); root cause fixed
  in mitmproxy repo commit 42fe263.
