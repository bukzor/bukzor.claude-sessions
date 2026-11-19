#!/bin/sh
# Method for 2026-11-19-004-pnp-display-devices.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'powershell.exe' '-NoProfile' '-Command' 'Get-PnpDevice -Class Display | Format-List FriendlyName,Status,Problem,InstanceId'
