#!/bin/sh
# Method for 2026-11-19-013-setupapi-dev-log-sections-since-2026-11-01.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'awk '\''/^>>>  \[/{keep=0} /Section start 2026\/11/{keep=1} keep'\'' /mnt/c/Windows/INF/setupapi.dev.log | grep -E '\''>>>|Section start|<<<|1002|731F|isable|Exit status'\'' | tail -60'
