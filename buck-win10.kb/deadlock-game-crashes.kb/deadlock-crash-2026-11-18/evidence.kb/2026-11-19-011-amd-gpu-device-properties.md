---
captured: "2026-11-19"
method: ./2026-11-19-011-amd-gpu-device-properties.sh
---

# AMD GPU device properties

```sh
'powershell.exe' '-NoProfile' '-Command' '$i="PCI\VEN_1002&DEV_731F&SUBSYS_57101682&REV_CA\6&36A91AF7&0&00000019"; Get-PnpDeviceProperty -InstanceId $i | ? { $_.KeyName -match "Problem|Status|LastArrival|LastRemoval|InstallDate|FirstInstall|DriverDate|DriverVersion|ConfigFlags" } | Format-Table KeyName,Data -AutoSize | Out-String -Width 200; Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Enum\$i" | Format-List ConfigFlags'
```

```

KeyName                                          Data
-------                                          ----
DEVPKEY_Device_ConfigFlags                          1
DEVPKEY_Device_DevNodeStatus                 25175040
DEVPKEY_Device_ProblemCode                         22
DEVPKEY_Device_ProblemStatus                        0
DEVPKEY_Device_HasProblem                       False
DEVPKEY_Device_InstallDate      3/21/2026 12:08:14 PM
DEVPKEY_Device_FirstInstallDate  3/3/2026 12:52:19 AM
DEVPKEY_Device_LastArrivalDate  11/18/2026 7:22:46 PM
DEVPKEY_Device_DriverDate         3/2/2026 6:00:00 PM
DEVPKEY_Device_DriverVersion          32.0.21043.5001





ConfigFlags : 1



```
