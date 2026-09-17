#!/bin/sh
# Method for 2026-09-17-004-post-envrc-fix-verification-prefix-pnpm-bin-appears-once-correctly-after-bin-venv-bin-scoping-preserved.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'cd /home/bukzor && direnv allow . && eval "$(direnv export bash)" && echo "$PATH" | tr : "\n" | nl'
