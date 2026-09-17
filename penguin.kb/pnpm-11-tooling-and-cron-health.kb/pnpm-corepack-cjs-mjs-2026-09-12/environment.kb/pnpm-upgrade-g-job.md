# pnpm-upgrade-g cron job

Scheduled via anacron (`~/.config/anacron/anacrontab`), not raw cron
despite the log path name: `1 5 pnpm-update set -e; . /home/bukzor/.profile;
logrotate-cron pnpm-upgrade-g`, i.e. daily, 5 minutes after boot/wake,
running under `/bin/sh` (anacron ignores `SHELL=`) with a freshly
sourced `~/.profile` -- no inherited interactive shell state.

`logrotate-cron` wraps the job so its stdout/stderr accumulate in
`~/.local/state/cron/pnpm-upgrade-g.log`, which is what surfaced this
incident as a "WARNING: cron job failed" alert -- that alerting path
already works correctly and caught the failure within its first
occurrence's day. The gap this incident exposes is remediation, not
detection.

The job itself (`bin/pnpm-upgrade-g`) reads its declared global-package
list from `~/.config/pnpm/global/package.json`, installs them all in one
`pnpm add -g` (fixed flag set, `--allow-build=bun`), then runs
`corepack use pnpm@latest` to move the `packageManager` pin in
`~/package.json`, then a smoke test (bin dir on `PATH`, all declared
packages present, pin matches running pnpm). `set -euo pipefail` + an
`ERR` trap means any failing step aborts the whole job loudly with
`ERROR(<code>)` -- which is why this incident's daily runs stop right
after the `corepack use` crash and never reach the smoke test.
