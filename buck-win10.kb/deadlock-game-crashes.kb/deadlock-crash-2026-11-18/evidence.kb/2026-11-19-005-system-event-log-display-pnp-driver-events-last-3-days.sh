#!/bin/sh
# Method for 2026-11-19-005-system-event-log-display-pnp-driver-events-last-3-days.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' '$s=(Get-Date).AddDays(-3); Get-WinEvent -FilterHashtable @{LogName="System"; StartTime=$s} | ? { $_.ProviderName -match "Display|amd|Kernel-PnP|UserPnp|DeviceSetup|WHEA|Kernel-Power|Dxgk|LiveKernel" -or $_.Message -match "Radeon|731F|display driver" } | Select -First 80 TimeCreated,Id,ProviderName,LevelDisplayName,@{n="Msg";e={($_.Message -split "`n")[0..2] -join " | "}} | Format-List'
