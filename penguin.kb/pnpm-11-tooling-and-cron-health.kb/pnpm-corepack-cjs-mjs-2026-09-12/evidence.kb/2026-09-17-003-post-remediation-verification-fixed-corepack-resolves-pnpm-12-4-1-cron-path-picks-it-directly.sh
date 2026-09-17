#!/bin/sh
# Method for 2026-09-17-003-post-remediation-verification-fixed-corepack-resolves-pnpm-12-4-1-cron-path-picks-it-directly.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'echo "== corepack pnpm@12.4.1 --version ==" && /home/bukzor/prefix/pnpm/bin/corepack pnpm@12.4.1 --version; echo "== cron-simulated corepack resolution =="; /bin/sh -c ". /home/bukzor/.profile; command -v corepack"'
