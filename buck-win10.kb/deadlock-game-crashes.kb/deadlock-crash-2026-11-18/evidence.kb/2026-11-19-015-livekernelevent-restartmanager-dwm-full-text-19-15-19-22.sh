#!/bin/sh
# Method for 2026-11-19-015-livekernelevent-restartmanager-dwm-full-text-19-15-19-22.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=[datetime]"2026-11-18 19:15"; EndTime=[datetime]"2026-11-18 19:22:30"} | Format-List TimeCreated,Id,ProviderName,Message'
