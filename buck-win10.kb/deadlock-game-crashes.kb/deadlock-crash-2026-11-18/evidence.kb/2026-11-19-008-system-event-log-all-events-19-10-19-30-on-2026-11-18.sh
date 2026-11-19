#!/bin/sh
# Method for 2026-11-19-008-system-event-log-all-events-19-10-19-30-on-2026-11-18.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="System"; StartTime=[datetime]"2026-11-18 19:10"; EndTime=[datetime]"2026-11-18 19:30"} | Select TimeCreated,Id,ProviderName,LevelDisplayName,@{n="Msg";e={($_.Message -split "`n")[0..1] -join " | "}} | Format-Table -AutoSize -Wrap | Out-String -Width 220'
