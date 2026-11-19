#!/bin/sh
# Method for 2026-11-19-001-crash-dump-listing.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'ls -la --time-style=full-iso '\''/mnt/c/Program Files (x86)/Steam/dumps/'\'' '\''/mnt/c/Program Files (x86)/Steam/steamapps/common/Deadlock/game/bin/win64/'\''*.mdmp'
