#!/bin/sh
# Method for 2026-09-23-000-full-process-tree-around-driftwatch-raw.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'ps -efly --forest | grep -C10 driftwatch'
