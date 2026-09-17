#!/bin/sh
# Method for 2026-09-16-005-cron-anacron-equivalent-path-resolves-corepack-to-volta-bundled-0-34-0-not-the-fixed-pnpm-store-0-36-0.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'env -i HOME="$HOME" USER="$USER" SHELL=/bin/bash /bin/bash -lc "set -e; . /home/bukzor/.profile; echo PATH=\$PATH; echo ---; which -a corepack; echo ---; corepack --version" 2>&1'
