---
captured: "2026-11-19"
method: ./2026-11-19-015-livekernelevent-restartmanager-dwm-full-text-19-15-19-22.sh
---

# LiveKernelEvent + RestartManager + DWM full text, 19:15-19:22

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=[datetime]"2026-11-18 19:15"; EndTime=[datetime]"2026-11-18 19:22:30"} | Format-List TimeCreated,Id,ProviderName,Message'
```

```


TimeCreated  : 11/18/2026 7:21:46 PM
Id           : 10002
ProviderName : Microsoft-Windows-Winsrv
Message      : The following application was terminated because it was hung: deadlock.exe.

TimeCreated  : 11/18/2026 7:21:46 PM
Id           : 4004
ProviderName : Microsoft-Windows-Winlogon
Message      : The Windows logon process has failed to terminate the currently logged on user's processes.

TimeCreated  : 11/18/2026 7:21:32 PM
Id           : 1001
ProviderName : Windows Error Reporting
Message      : Fault bucket , type 0
               Event Name: LiveKernelEvent
               Response: Not available
               Cab Id: 0
               
               Problem signature:
               P1: 117
               P2: aaaaaaaaaaaaaaaa
               P3: aaaaaaaaaaaaaaaa
               P4: aaaaaaaaaaaaaaaa
               P5: aaaaaaaaaaaaaaaa
               P6: 10_0_26300
               P7: 0_0
               P8: 768_1
               P9: 
               P10: 
               
               Attached files:
               \\?\C:\WINDOWS\LiveKernelReports\WATCHDOG\WATCHDOG-20261118-1921.dmp
               \\?\C:\WINDOWS\SystemTemp\WER-668138125-0.sysdata.xml
               \\?\C:\ProgramData\Microsoft\Windows\WER\Temp\WER.c50acba1-fd98-463d-972b-56b686569d81.tmp.xml
               
               These files may be available here:
               \\?\C:\ProgramData\Microsoft\Windows\WER\ReportQueue\Kernel_117_59af1b9d7b06adf45bbfc7c6532bbcbd5c5a39_0
               0000000_084c61e6-a024-4548-bd96-2ade27f7714d
               
               Analysis symbol: 
               Rechecking for solution: 0
               Report Id: 084c61e6-a024-4548-bd96-2ade27f7714d
               Report Status: 2049
               Hashed bucket: 
               Cab Guid: 0

TimeCreated  : 11/18/2026 7:21:32 PM
Id           : 1001
ProviderName : Windows Error Reporting
Message      : Fault bucket , type 0
               Event Name: LiveKernelEvent
               Response: Not available
               Cab Id: 0
               
               Problem signature:
               P1: 117
               P2: aaaaaaaaaaaaaaaa
               P3: aaaaaaaaaaaaaaaa
               P4: aaaaaaaaaaaaaaaa
               P5: aaaaaaaaaaaaaaaa
               P6: 10_0_26300
               P7: 0_0
               P8: 768_1
               P9: 
               P10: 
               
               Attached files:
               \\?\C:\WINDOWS\LiveKernelReports\WATCHDOG\WATCHDOG-20261118-1921.dmp
               \\?\C:\WINDOWS\SystemTemp\WER-668138125-0.sysdata.xml
               \\?\C:\ProgramData\Microsoft\Windows\WER\Temp\WER.c50acba1-fd98-463d-972b-56b686569d81.tmp.xml
               
               These files may be available here:
               \\?\C:\ProgramData\Microsoft\Windows\WER\ReportQueue\Kernel_117_59af1b9d7b06adf45bbfc7c6532bbcbd5c5a39_0
               0000000_084c61e6-a024-4548-bd96-2ade27f7714d
               
               Analysis symbol: 
               Rechecking for solution: 0
               Report Id: 084c61e6-a024-4548-bd96-2ade27f7714d
               Report Status: 4
               Hashed bucket: 
               Cab Guid: 0

TimeCreated  : 11/18/2026 7:20:31 PM
Id           : 0
ProviderName : Dwminit
Message      : The Desktop Window Manager process has exited. (Process exit code: 0x00000001, Restart count: 1, 
               Primary display device ID: AMD Radeon RX 5600 XT)

TimeCreated  : 11/18/2026 7:18:43 PM
Id           : 10001
ProviderName : Microsoft-Windows-RestartManager
Message      : Ending session 0 started ?2026?-?11?-?19T01:15:05.826831000Z.

TimeCreated  : 11/18/2026 7:15:05 PM
Id           : 10000
ProviderName : Microsoft-Windows-RestartManager
Message      : Starting session 0 - ?2026?-?11?-?19T01:15:05.826831000Z.



```
