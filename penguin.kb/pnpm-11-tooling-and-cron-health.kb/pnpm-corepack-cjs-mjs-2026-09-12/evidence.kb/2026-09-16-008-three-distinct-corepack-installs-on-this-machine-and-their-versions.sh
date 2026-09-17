#!/bin/sh
# Method for 2026-09-16-008-three-distinct-corepack-installs-on-this-machine-and-their-versions.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'echo "prefix/pnpm/bin/corepack (pnpm global store):"; /home/bukzor/prefix/pnpm/bin/corepack --version; echo; echo "bin/corepack (routes to volta node, actually used by cron):"; /home/bukzor/bin/corepack --version; echo; echo "volta bundled node versions with local corepack:"; for v in 22.21.1 22.23.2 24.13.1; do f=/home/bukzor/.volta/tools/image/node/$v/lib/node_modules/corepack/package.json; echo "node $v -> corepack $(jq -r .version "$f")"; done'
