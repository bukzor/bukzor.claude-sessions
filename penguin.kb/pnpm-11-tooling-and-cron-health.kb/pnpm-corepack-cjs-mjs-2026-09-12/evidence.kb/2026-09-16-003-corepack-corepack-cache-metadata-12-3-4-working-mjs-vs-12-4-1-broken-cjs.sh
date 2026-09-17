#!/bin/sh
# Method for 2026-09-16-003-corepack-corepack-cache-metadata-12-3-4-working-mjs-vs-12-4-1-broken-cjs.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'echo "--- 12.3.4 ---"; cat /home/bukzor/.cache/node/corepack/v1/pnpm/12.3.4/.corepack; echo; echo "--- 12.4.1 ---"; cat /home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/.corepack; echo'
