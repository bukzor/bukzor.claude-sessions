---
captured: "2026-11-19"
method: ./2026-11-19-021-after-remove-rescan-display-devices-configflags-livekernelevents-since-19-34.sh
---

# After remove + rescan: display devices, ConfigFlags, LiveKernelEvents since 19:34

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-PnpDevice -Class Display | Format-Table FriendlyName,Status,Problem,InstanceId -AutoSize | Out-String -Width 200; Get-CimInstance Win32_VideoController | Format-Table Name,Status,ConfigManagerErrorCode,DriverVersion -AutoSize; $i=(Get-PnpDevice -Class Display | ? FriendlyName -match Radeon).InstanceId; "ConfigFlags: " + (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Enum\$i").ConfigFlags; Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=[datetime]"2026-11-18 19:34"; Id=1001} -ErrorAction SilentlyContinue | % { if ($_.Message -match "P1: (\S+)") { "{0:HH:mm:ss} WER P1={1}" -f $_.TimeCreated,$matches[1] } }'
```

Exited 1.

```

FriendlyName                   Status      Problem InstanceId                                                        
------------                   ------      ------- ----------                                                        
Parsec Virtual Display Adapter OK     CM_PROB_NONE ROOT\DISPLAY\0000                                                 
AMD Radeon RX 5600 XT          OK     CM_PROB_NONE PCI\VEN_1002&DEV_731F&SUBSYS_57101682&REV_CA\6&36A91AF7&0&00000019




Name                           Status ConfigManagerErrorCode DriverVersion  
----                           ------ ---------------------- -------------  
Parsec Virtual Display Adapter OK                          0 0.45.0.0       
AMD Radeon RX 5600 XT          OK                          0 32.0.21043.5001


ConfigFlags: 0
```
