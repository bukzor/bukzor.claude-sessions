---
status: rejected
requires-sudo: false
---

# Have `pnpm-upgrade-g`'s smoke test assert which `corepack` it used

The systemic gap this incident exposes: nothing checks that the
`corepack` binary a run actually resolves to is the one the maintainer
intends (the pnpm-managed, continuously-upgraded one), so silent
PATH/environment drift between interactive and cron contexts goes
unnoticed until a version bump needs the fixed behavior. Detection of
*that this job failed* already works (the cron log + user alert); this
would add detection of *why it's about to fail*, before the crash.

Add to `smoke_test()` (or a preflight before the `corepack use` step) an
assertion like:

```sh
resolved="$(command -v corepack)"
expected="$HOME/prefix/pnpm/bin/corepack"  # or wherever it ends up pointing post-remediation
if [ "$resolved" != "$expected" ]; then
  echo >&2 "FAIL: corepack resolved to $resolved, expected $expected"
  failed=1
fi
```

Turns a cryptic `MODULE_NOT_FOUND` three steps later into a direct,
actionable failure at the point PATH drift actually occurs.

## Rejected, 2026-09-17

Too brittle, and measures the wrong thing. What we actually care about
is whether the cron job runs successfully -- and the job's own
`set -euo pipefail` + ERR trap + logrotate-cron's exit-code alerting
*is* ground truth for that already; it's what caught this exact
incident. A hardcoded "expected `corepack` path" is a second,
independently-maintained source of truth about correctness that can
drift out of sync with reality on its own (e.g. if the pnpm store path
ever legitimately changes) -- a proxy correlated with success, not
success itself. It could fail closed (false alarm on a legitimate path
change) or pass while something else is broken, either way adding
noise without adding signal beyond what the existing failure mode
already provides. The actual fix was removing the PATH-order
dependency (`remove-obsolete-bin-corepack-wrapper.md`,
`deduplicate-envrc-pnpm-bin-entry.md`), not defending against it.
