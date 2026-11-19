#!/bin/sh
# Method for 2026-11-19-011-amd-gpu-device-properties.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' '$i="PCI\VEN_1002&DEV_731F&SUBSYS_57101682&REV_CA\6&36A91AF7&0&00000019"; Get-PnpDeviceProperty -InstanceId $i | ? { $_.KeyName -match "Problem|Status|LastArrival|LastRemoval|InstallDate|FirstInstall|DriverDate|DriverVersion|ConfigFlags" } | Format-Table KeyName,Data -AutoSize | Out-String -Width 200; Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Enum\$i" | Format-List ConfigFlags'
