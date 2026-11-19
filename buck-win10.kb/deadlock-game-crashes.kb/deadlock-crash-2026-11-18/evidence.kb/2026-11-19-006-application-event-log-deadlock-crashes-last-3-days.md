---
captured: "2026-11-19"
method: ./2026-11-19-006-application-event-log-deadlock-crashes-last-3-days.sh
---

# Application event log, deadlock crashes, last 3 days

```sh
'powershell.exe' '-NoProfile' '-Command' '$s=(Get-Date).AddDays(-3); Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=$s} | ? { $_.Message -match "deadlock" } | Select -First 20 TimeCreated,Id,ProviderName,@{n="Msg";e={($_.Message -split "`n")[0..12] -join " | "}} | Format-List'
```

```


TimeCreated  : 11/18/2026 7:21:46 PM
Id           : 10002
ProviderName : Microsoft-Windows-Winsrv
Msg          : The following application was terminated because it was hung: deadlock.exe.

TimeCreated  : 11/17/2026 5:36:17 PM
Id           : 1002
ProviderName : Application Hang
Msg          : The program deadlock.exe version 0.0.0.0 stopped interacting with Windows and was closed. To see if 
               more information about the problem is available, check the problem history in the Security and 
               Maintenance control panel. | 

TimeCreated  : 11/17/2026 5:36:16 PM
Id           : 1001
ProviderName : Windows Error Reporting
Msg          : Fault bucket , type 0 | Event Name: AppHangB1 | Response: Not available | Cab Id: 0 |  | Problem 
               signature: | P1: deadlock.exe | P2: 0.0.0.0 | P3: 6af1fafe | P4: 2bd2 | P5: 134217728 | P6:  | P7: 



```
