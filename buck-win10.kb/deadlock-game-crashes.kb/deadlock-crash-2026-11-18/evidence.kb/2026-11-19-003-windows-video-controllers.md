---
captured: "2026-11-19"
method: ./2026-11-19-003-windows-video-controllers.sh
---

# Windows video controllers

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-CimInstance Win32_VideoController | Format-List Name,Status,ConfigManagerErrorCode,DriverVersion,DriverDate,AdapterRAM,PNPDeviceID'
```

```


Name                   : Parsec Virtual Display Adapter
Status                 : OK
ConfigManagerErrorCode : 0
DriverVersion          : 0.45.0.0
DriverDate             : 1/24/2024 6:00:00 PM
AdapterRAM             : 
PNPDeviceID            : ROOT\DISPLAY\0000

Name                   : AMD Radeon RX 5600 XT
Status                 : Error
ConfigManagerErrorCode : 22
DriverVersion          : 32.0.21043.5001
DriverDate             : 3/2/2026 6:00:00 PM
AdapterRAM             : 4293918720
PNPDeviceID            : PCI\VEN_1002&DEV_731F&SUBSYS_57101682&REV_CA\6&36A91AF7&0&00000019



```
