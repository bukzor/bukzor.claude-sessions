#!/bin/sh
# Method for 2026-11-19-009-winsrvext-user32-shutdown-block-events-full-text.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="System"; StartTime=[datetime]"2026-11-18 18:00"; EndTime=[datetime]"2026-11-18 19:22"} | Format-List TimeCreated,Id,ProviderName,Message'
