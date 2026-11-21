# Read into a claim ledger, 2026-09-17

A later session (unrelated line of work: cron-alerting, see
`pnpm-11-tooling-and-cron-health.md`) read `bin/alert`, its commits, and
this devlog while extending `docs/dev/user-attention.claims.md`
(`Skill(llm-claims-kb)`, pushed `80149a4`). `alert` is now formalized there
as a **push channel** -- fires when the caller calls out rather than being
polled or triggered by session lifecycle, so its coverage is exactly its
call sites (`ALERT_PUSH`, `PUSH_BOUNDED_BY_CALLSITES`,
`PUSH_ATTEMPTS_LOGGED` in `docs/dev/user-attention.claims.kb/`). The
`log_alert`-under-`set -e` follow-up in `../tmux-window-naming-and-alert-identity.md`'s Open follow-ups is now also tracked as an open
claim there (`ALERT_LOG_DESYNC`) -- same open question, now checkable
alongside the ledger's others rather than only living in this file's prose.
Nothing here was built or fixed; this is a cross-reference, not a
resolution.
