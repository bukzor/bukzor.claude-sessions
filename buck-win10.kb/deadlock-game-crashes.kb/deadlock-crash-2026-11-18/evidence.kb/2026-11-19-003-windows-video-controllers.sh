#!/bin/sh
# Method for 2026-11-19-003-windows-video-controllers.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-CimInstance Win32_VideoController | Format-List Name,Status,ConfigManagerErrorCode,DriverVersion,DriverDate,AdapterRAM,PNPDeviceID'
