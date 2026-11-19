#!/bin/sh
# Method for 2026-11-19-002-steam-gameprocess-log-tail.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'tail -n 80 '\''/mnt/c/Program Files (x86)/Steam/logs/gameprocess_log.txt'\'''
