#!/bin/sh
# Method for 2026-11-19-016-livekernelreports-directory.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'find /mnt/c/Windows/LiveKernelReports -newermt 2026-11-17 -printf "%TY-%Tm-%Td %TH:%TM %s %p\n" 2>&1 | sort'
