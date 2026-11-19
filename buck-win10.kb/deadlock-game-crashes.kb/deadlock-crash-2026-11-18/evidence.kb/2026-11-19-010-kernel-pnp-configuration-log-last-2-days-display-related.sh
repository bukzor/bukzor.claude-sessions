#!/bin/sh
# Method for 2026-11-19-010-kernel-pnp-configuration-log-last-2-days-display-related.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Kernel-PnP/Configuration"; StartTime=(Get-Date).AddDays(-2)} | ? { $_.Message -match "1002|Display|Radeon" } | Format-List TimeCreated,Id,Message'
