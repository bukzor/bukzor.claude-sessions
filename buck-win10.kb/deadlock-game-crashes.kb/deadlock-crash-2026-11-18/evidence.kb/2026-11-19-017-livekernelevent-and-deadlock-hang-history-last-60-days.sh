#!/bin/sh
# Method for 2026-11-19-017-livekernelevent-and-deadlock-hang-history-last-60-days.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=(Get-Date).AddDays(-60); Id=1001,1002,10002} | ? { $_.Message -match "LiveKernelEvent|deadlock.exe" } | % { $p1 = if ($_.Message -match "P1: (\S+)") { $matches[1] } else { "" }; "{0:yyyy-MM-dd HH:mm} {1,-6} P1={2}" -f $_.TimeCreated,$_.Id,$p1 }'
