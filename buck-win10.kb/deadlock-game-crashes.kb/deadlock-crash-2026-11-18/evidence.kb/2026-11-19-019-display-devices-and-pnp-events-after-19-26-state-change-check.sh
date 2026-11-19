#!/bin/sh
# Method for 2026-11-19-019-display-devices-and-pnp-events-after-19-26-state-change-check.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-PnpDevice -Class Display | Format-Table FriendlyName,Status,Problem -AutoSize; Get-WinEvent -FilterHashtable @{LogName="System","Microsoft-Windows-Kernel-PnP/Configuration","Application"; StartTime=[datetime]"2026-11-18 19:26"} -ErrorAction SilentlyContinue | ? { $_.Message -match "1002|Radeon|Display|amd|dwm" } | Format-List TimeCreated,LogName,Id,ProviderName,@{n="Msg";e={($_.Message -split "`n")[0..3] -join " | "}}'
