#!/bin/sh
# Method for 2026-09-16-007-pnpm-global-store-corepack-0-36-0-fixed-unused-by-cron-pnpm-range-table-11-0-0-bin-pnpm-mjs.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' $'python3 - /home/bukzor/prefix/pnpm/global/v11/adf3fc848a3c3e600d24f23fec5516aeaea2f4df874d4b3004985b7f01a21293/node_modules/corepack/dist/lib/corepack.cjs <<\'PYEOF\'\nimport sys, re\ndata = open(sys.argv[1], encoding=\'utf-8\', errors=\'replace\').read()\nidx = data.find(\'registry.npmjs.org/pnpm\')\nprint(data[max(0,idx-200):idx+1300])\nPYEOF'
