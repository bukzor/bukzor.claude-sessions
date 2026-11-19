---
captured: "2026-11-19"
method: ./2026-11-19-005-system-event-log-display-pnp-driver-events-last-3-days.sh
---

# System event log, display/PnP/driver events, last 3 days

```sh
'powershell.exe' '-NoProfile' '-Command' '$s=(Get-Date).AddDays(-3); Get-WinEvent -FilterHashtable @{LogName="System"; StartTime=$s} | ? { $_.ProviderName -match "Display|amd|Kernel-PnP|UserPnp|DeviceSetup|WHEA|Kernel-Power|Dxgk|LiveKernel" -or $_.Message -match "Radeon|731F|display driver" } | Select -First 80 TimeCreated,Id,ProviderName,LevelDisplayName,@{n="Msg";e={($_.Message -split "`n")[0..2] -join " | "}} | Format-List'
```

```


TimeCreated      : 11/18/2026 7:22:52 PM
Id               : 1
ProviderName     : Parsec Virtual Display Driver
LevelDisplayName : Information
Msg              : Device attached (obj: 0xfffffddaae9cce38, status: STATUS_SUCCESS)

TimeCreated      : 11/18/2026 7:22:48 PM
Id               : 219
ProviderName     : Microsoft-Windows-Kernel-PnP
LevelDisplayName : Warning
Msg              : The driver \Driver\WUDFRd failed to load. | Device: ROOT\DISPLAY\0000 | Status: 0xC0000365

TimeCreated      : 11/18/2026 7:22:48 PM
Id               : 172
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : Connectivity state in standby: Disconnected, Reason: NIC compliance

TimeCreated      : 11/18/2026 7:22:48 PM
Id               : 41
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Critical
Msg              : The system has rebooted without cleanly shutting down first. This error could be caused if the 
                   system stopped responding, crashed, or lost power unexpectedly.

TimeCreated      : 11/18/2026 1:58:40 PM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 52 to 54. |  | Reason Unknown 

TimeCreated      : 11/18/2026 1:58:40 PM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 51 to 52. |  | Reason SxTransition 

TimeCreated      : 11/18/2026 1:57:31 PM
Id               : 107
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system has resumed from sleep.

TimeCreated      : 11/18/2026 1:57:27 PM
Id               : 42
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system is entering sleep. |  | Sleep Reason: Application API

TimeCreated      : 11/18/2026 1:57:27 PM
Id               : 40
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The driver \Driver\vpcivsp for device ROOT\VPCIVSP\0000 stopped the power transition.

TimeCreated      : 11/18/2026 1:57:26 PM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 50 to 51. |  | Reason InputHid 

TimeCreated      : 11/18/2026 1:57:26 PM
Id               : 187
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : User-mode process attempted to change the system state by calling SetSuspendState or 
                   SetSystemPowerState APIs.

TimeCreated      : 11/18/2026 9:37:32 AM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 48 to 50. |  | Reason InputHid 

TimeCreated      : 11/18/2026 9:37:31 AM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 47 to 48. |  | Reason SxTransition 

TimeCreated      : 11/18/2026 9:37:30 AM
Id               : 131
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : Firmware S3 times. ResumeCount: 3, FullResume: 2093, AverageResume: 2094

TimeCreated      : 11/17/2026 9:53:27 PM
Id               : 107
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system has resumed from sleep.

TimeCreated      : 11/17/2026 9:53:25 PM
Id               : 42
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system is entering sleep. |  | Sleep Reason: Application API

TimeCreated      : 11/17/2026 9:53:25 PM
Id               : 40
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The driver \Driver\vpcivsp for device ROOT\VPCIVSP\0000 stopped the power transition.

TimeCreated      : 11/17/2026 9:53:25 PM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 46 to 47. |  | Reason InputAccelerometer 

TimeCreated      : 11/17/2026 9:53:25 PM
Id               : 187
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : User-mode process attempted to change the system state by calling SetSuspendState or 
                   SetSystemPowerState APIs.

TimeCreated      : 11/16/2026 5:24:17 PM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 44 to 46. |  | Reason InputAccelerometer 

TimeCreated      : 11/16/2026 4:23:11 PM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 43 to 44. |  | Reason SessionUnlock 

TimeCreated      : 11/16/2026 11:16:11 AM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 41 to 43. |  | Reason Unknown 

TimeCreated      : 11/16/2026 11:16:10 AM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 40 to 41. |  | Reason SxTransition 

TimeCreated      : 11/16/2026 11:16:09 AM
Id               : 131
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : Firmware S3 times. ResumeCount: 2, FullResume: 2093, AverageResume: 2095

TimeCreated      : 11/16/2026 12:50:38 AM
Id               : 107
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system has resumed from sleep.

TimeCreated      : 11/16/2026 12:50:37 AM
Id               : 42
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system is entering sleep. |  | Sleep Reason: Application API

TimeCreated      : 11/16/2026 12:50:36 AM
Id               : 40
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The driver \Driver\vpcivsp for device ROOT\VPCIVSP\0000 stopped the power transition.

TimeCreated      : 11/16/2026 12:50:36 AM
Id               : 566
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : The system session has transitioned from 39 to 40. |  | Reason InputHid 

TimeCreated      : 11/16/2026 12:50:36 AM
Id               : 187
ProviderName     : Microsoft-Windows-Kernel-Power
LevelDisplayName : Information
Msg              : User-mode process attempted to change the system state by calling SetSuspendState or 
                   SetSystemPowerState APIs.



```
