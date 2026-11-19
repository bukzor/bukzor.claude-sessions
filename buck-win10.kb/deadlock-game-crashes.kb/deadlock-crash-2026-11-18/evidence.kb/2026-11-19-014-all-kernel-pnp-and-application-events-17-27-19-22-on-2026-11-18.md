---
captured: "2026-11-19"
method: ./2026-11-19-014-all-kernel-pnp-and-application-events-17-27-19-22-on-2026-11-18.sh
---

# All Kernel-PnP and Application events 17:27-19:22 on 2026-11-18

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Kernel-PnP/Configuration","Microsoft-Windows-Kernel-PnP/Device Management","Application"; StartTime=[datetime]"2026-11-18 17:27"; EndTime=[datetime]"2026-11-18 19:22:30"} -ErrorAction SilentlyContinue | Select TimeCreated,LogName,Id,ProviderName,@{n="Msg";e={($_.Message -split "`n")[0..1] -join " | "}} | Format-Table -AutoSize -Wrap | Out-String -Width 240'
```

```

TimeCreated           LogName        Id ProviderName                     Msg                                                                                                                                               
-----------           -------        -- ------------                     ---                                                                                                                                               
11/18/2026 7:21:46 PM Application 10002 Microsoft-Windows-Winsrv         The following application was terminated because it was hung: deadlock.exe.                                                                       
11/18/2026 7:21:46 PM Application  4004 Microsoft-Windows-Winlogon       The Windows logon process has failed to terminate the currently logged on user's processes.                                                       
11/18/2026 7:21:32 PM Application  1001 Windows Error Reporting          Fault bucket , type 0 | Event Name: LiveKernelEvent                                                                                               
11/18/2026 7:21:32 PM Application  1001 Windows Error Reporting          Fault bucket , type 0 | Event Name: LiveKernelEvent                                                                                               
11/18/2026 7:20:31 PM Application     0 Dwminit                          The Desktop Window Manager process has exited. (Process exit code: 0x00000001, Restart count: 1, Primary display device ID: AMD Radeon RX 5600 XT)
11/18/2026 7:18:43 PM Application 10001 Microsoft-Windows-RestartManager Ending session 0 started ?2026?-?11?-?19T01:15:05.826831000Z.                                                                                     
11/18/2026 7:15:05 PM Application 10000 Microsoft-Windows-RestartManager Starting session 0 - ?2026?-?11?-?19T01:15:05.826831000Z.                                                                                         
11/18/2026 7:08:39 PM Application 16384 Microsoft-Windows-Security-SPP   Successfully scheduled Software Protection service for re-start at 2126-10-26T01:08:39Z. Reason: RulesEngine.                                     
11/18/2026 7:08:09 PM Application 16394 Microsoft-Windows-Security-SPP   Offline downlevel migration succeeded.                                                                                                            
11/18/2026 7:06:01 PM Application 16384 Microsoft-Windows-Security-SPP   Successfully scheduled Software Protection service for re-start at 2126-10-26T01:06:01Z. Reason: RulesEngine.                                     
11/18/2026 7:05:30 PM Application 16394 Microsoft-Windows-Security-SPP   Offline downlevel migration succeeded.                                                                                                            
11/18/2026 7:04:50 PM Application 16384 Microsoft-Windows-Security-SPP   Successfully scheduled Software Protection service for re-start at 2126-10-26T01:04:50Z. Reason: RulesEngine.                                     
11/18/2026 7:04:18 PM Application 16394 Microsoft-Windows-Security-SPP   Offline downlevel migration succeeded.                                                                                                            
11/18/2026 6:32:16 PM Application 16384 Microsoft-Windows-Security-SPP   Successfully scheduled Software Protection service for re-start at 2126-10-26T00:32:16Z. Reason: RulesEngine.                                     
11/18/2026 6:31:46 PM Application 16394 Microsoft-Windows-Security-SPP   Offline downlevel migration succeeded.                                                                                                            
11/18/2026 5:48:53 PM Application 16384 Microsoft-Windows-Security-SPP   Successfully scheduled Software Protection service for re-start at 2126-10-25T23:48:53Z. Reason: RulesEngine.                                     
11/18/2026 5:48:23 PM Application 16394 Microsoft-Windows-Security-SPP   Offline downlevel migration succeeded.                                                                                                            
11/18/2026 5:34:24 PM Application 16384 Microsoft-Windows-Security-SPP   Successfully scheduled Software Protection service for re-start at 2126-10-25T23:34:24Z. Reason: RulesEngine.                                     
11/18/2026 5:33:53 PM Application 16394 Microsoft-Windows-Security-SPP   Offline downlevel migration succeeded.                                                                                                            



```
