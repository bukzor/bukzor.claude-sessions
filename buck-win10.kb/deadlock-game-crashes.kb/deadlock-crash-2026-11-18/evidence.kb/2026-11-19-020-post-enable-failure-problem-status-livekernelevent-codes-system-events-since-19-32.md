---
captured: "2026-11-19"
method: ./2026-11-19-020-post-enable-failure-problem-status-livekernelevent-codes-system-events-since-19-32.sh
---

# Post-enable failure: problem status, LiveKernelEvent codes, System events since 19:32

```sh
'powershell.exe' '-NoProfile' '-Command' '$i="PCI\VEN_1002&DEV_731F&SUBSYS_57101682&REV_CA\6&36A91AF7&0&00000019"; Get-PnpDeviceProperty -InstanceId $i -KeyName DEVPKEY_Device_ProblemCode,DEVPKEY_Device_ProblemStatus,DEVPKEY_Device_DriverVersion | Format-Table KeyName,Data -AutoSize; Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=[datetime]"2026-11-18 19:32"; Id=1001} | % { if ($_.Message -match "P1: (\S+)") { "{0:HH:mm:ss} LiveKernelEvent P1={1}" -f $_.TimeCreated,$matches[1] } }; Get-WinEvent -FilterHashtable @{LogName="System","Microsoft-Windows-Kernel-PnP/Configuration"; StartTime=[datetime]"2026-11-18 19:32"} -ErrorAction SilentlyContinue | ? { $_.ProviderName -notmatch "Hyper-V|VfpExt|Kernel-General|Time-Service" } | Format-List TimeCreated,Id,ProviderName,@{n="Msg";e={($_.Message -split "`n")[0..4] -join " | "}}'
```

```

KeyName                                 Data
-------                                 ----
DEVPKEY_Device_ProblemCode                31
DEVPKEY_Device_ProblemStatus      3221225473
DEVPKEY_Device_DriverVersion 32.0.21043.5001


19:33:13 LiveKernelEvent P1=1b0
19:33:13 LiveKernelEvent P1=117
19:33:13 LiveKernelEvent P1=1b0


TimeCreated  : 11/18/2026 7:33:30 PM
Id           : 19
ProviderName : Microsoft-Windows-WindowsUpdateClient
Msg          : Installation Successful: Windows successfully installed the following update: Security Intelligence 
               Update for Microsoft Defender Antivirus - KB2267602 (Version 1.463.364.0) - Current Channel (Broad)

TimeCreated  : 11/18/2026 7:33:23 PM
Id           : 43
ProviderName : Microsoft-Windows-WindowsUpdateClient
Msg          : Installation Started: Windows has started installing the following update: Security Intelligence Update 
               for Microsoft Defender Antivirus - KB2267602 (Version 1.463.364.0) - Current Channel (Broad)

TimeCreated  : 11/18/2026 7:33:23 PM
Id           : 44
ProviderName : Microsoft-Windows-WindowsUpdateClient
Msg          : Windows Update started downloading an update.

TimeCreated  : 11/18/2026 7:33:21 PM
Id           : 10016
ProviderName : Microsoft-Windows-DistributedCOM
Msg          : The application-specific permission settings do not grant Local Activation permission for the COM 
               Server application with CLSID  | {9EA82395-E31B-41CA-8DF7-EC1CEE7194DF} |  and APPID  | 
               {2ED83BAA-B2FD-43B1-99BF-E6149C622692} |  to the user NT AUTHORITY\NETWORK SERVICE SID (S-1-5-20) from 
               address LocalHost (Using LRPC) running in the application container Unavailable SID (Unavailable). This 
               security permission can be modified using the Component Services administrative tool.

TimeCreated  : 11/18/2026 7:32:57 PM
Id           : 7040
ProviderName : Service Control Manager
Msg          : The start type of the Background Intelligent Transfer Service service was changed from demand start to 
               auto start.

TimeCreated  : 11/18/2026 7:32:30 PM
Id           : 2
ProviderName : Microsoft-Windows-IsolatedUserMode
Msg          : Secure Trustlet Id 6 and Pid 7104 stopped with status STATUS_SUCCESS.



```
