---
at: "2026-09-17T15:21:21-05:00"
source: "evidence.kb/2026-09-17-005-recovery-confirmed-manual-run-succeeds-end-to-end-warning-cleared.md"
confidence: observed
---

# User-triggered manual run succeeds end-to-end; warning clears

After all fixes applied (`bin/corepack` removed, stale cache cleared,
`.envrc` deduplicated), user ran `logrotate-cron pnpm-upgrade-g`
manually. Full success: global packages upgraded, `corepack use
pnpm@latest` resolved pnpm 12.4.2 cleanly (a version never directly
tested during the investigation, which was pinned to 12.4.1 -- good
sign the fix isn't overfit to one version), smoke test passed, status
file written as `0`, `cron-status` now silent. Anacron's own scheduled
run tomorrow (2026-09-18) is expected to succeed the same way.
