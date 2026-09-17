#!/bin/sh
# Method for 2026-09-17-005-recovery-confirmed-manual-run-succeeds-end-to-end-warning-cleared.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'echo "status:"; cat /home/bukzor/.local/state/cron/pnpm-upgrade-g.status; echo "cron-status (empty = clean):"; /home/bukzor/bin/cron-status; echo "(none)"; echo "log tail:"; tail -25 /home/bukzor/.local/state/cron/pnpm-upgrade-g.log'
