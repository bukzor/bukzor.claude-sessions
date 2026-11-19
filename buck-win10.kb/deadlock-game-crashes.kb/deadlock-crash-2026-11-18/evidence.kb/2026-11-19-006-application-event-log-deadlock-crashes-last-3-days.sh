#!/bin/sh
# Method for 2026-11-19-006-application-event-log-deadlock-crashes-last-3-days.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' '$s=(Get-Date).AddDays(-3); Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=$s} | ? { $_.Message -match "deadlock" } | Select -First 20 TimeCreated,Id,ProviderName,@{n="Msg";e={($_.Message -split "`n")[0..12] -join " | "}} | Format-List'
