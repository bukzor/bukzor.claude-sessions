#!/bin/sh
# Method for 2026-11-19-014-all-kernel-pnp-and-application-events-17-27-19-22-on-2026-11-18.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Kernel-PnP/Configuration","Microsoft-Windows-Kernel-PnP/Device Management","Application"; StartTime=[datetime]"2026-11-18 17:27"; EndTime=[datetime]"2026-11-18 19:22:30"} -ErrorAction SilentlyContinue | Select TimeCreated,LogName,Id,ProviderName,@{n="Msg";e={($_.Message -split "`n")[0..1] -join " | "}} | Format-Table -AutoSize -Wrap | Out-String -Width 240'
