---
captured: "2026-11-19"
method: ./2026-11-19-010-kernel-pnp-configuration-log-last-2-days-display-related.sh
---

# Kernel-PnP Configuration log, last 2 days, display-related

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Kernel-PnP/Configuration"; StartTime=(Get-Date).AddDays(-2)} | ? { $_.Message -match "1002|Display|Radeon" } | Format-List TimeCreated,Id,Message'
```

```


TimeCreated : 11/18/2026 7:22:52 PM
Id          : 410
Message     : Device DISPLAY\ACR0E9F\1&8713bca&0&UID0 was started.
              
              Driver Name: monitor.inf
              Class GUID: {4d36e96e-e325-11ce-bfc1-08002be10318}
              Service: monitor
              Lower Filters: 
              Upper Filters: 

TimeCreated : 11/18/2026 7:22:52 PM
Id          : 400
Message     : Device DISPLAY\ACR0E9F\1&8713bca&0&UID0 was configured.
              
              Driver Name: monitor.inf
              Driver Package ID: monitor.inf_amd64_04cfd6f6b14e8ef6
              Class GUID: {4d36e96e-e325-11ce-bfc1-08002be10318}
              Driver Date: 06/21/2006
              Driver Version: 10.0.26100.9818
              Driver Provider: Microsoft
              Driver Section: PnPMonitor.Install
              Driver Rank: 0xFF2000
              Matching Device ID: *PNP09FF
              Outranked Drivers: 
              Device Updated: false
              Parent Device: ROOT\BasicDisplay\0000

TimeCreated : 11/18/2026 7:22:52 PM
Id          : 442
Message     : Device settings for DISPLAY\ACR0E9F\1&8713bca&0&UID0 were not migrated from previous OS installation due 
              to partial or ambiguous device match.
              
              Last Device Instance ID: DISPLAY\ACR0E9F\7&2d7ce99a&3&UID260
              Class GUID: {4d36e96e-e325-11ce-bfc1-08002be10318}
              Location Path: 
              Migration Rank: 0xF00000000000F120
              Present: false
              Status: 0xC0000719



```
