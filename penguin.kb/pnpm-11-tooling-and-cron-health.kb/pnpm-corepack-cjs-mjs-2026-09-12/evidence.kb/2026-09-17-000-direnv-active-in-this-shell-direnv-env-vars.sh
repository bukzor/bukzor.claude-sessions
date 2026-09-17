#!/bin/sh
# Method for 2026-09-17-000-direnv-active-in-this-shell-direnv-env-vars.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'env | grep -E "^DIRENV_"'
