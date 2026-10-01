#!/bin/sh
# Method for 2026-09-23-001-dmesg-oom-killer-events-around-the-storm.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'dmesg -T | grep -B5 -A2 -i "oom\|killed process\|out of memory"'
