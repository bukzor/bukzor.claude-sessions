---
captured: "2026-11-19"
method: ./2026-11-19-007-kernel-pnp-configuration-log-for-the-amd-gpu-last-7-days.sh
---

# Kernel-PnP Configuration log for the AMD GPU, last 7 days

```sh
'powershell.exe' '-NoProfile' '-Command' '$s=(Get-Date).AddDays(-7); Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Kernel-PnP/Configuration"; StartTime=$s} | ? { $_.Message -match "VEN_1002&DEV_731F" } | Select -First 30 TimeCreated,Id,@{n="Msg";e={($_.Message -split "`n")[0..6] -join " | "}} | Format-List'
```

```
```
