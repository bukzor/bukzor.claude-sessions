---
captured: "2026-11-19"
method: ./2026-11-19-004-pnp-display-devices.sh
---

# PnP display devices

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-PnpDevice -Class Display | Format-List FriendlyName,Status,Problem,InstanceId'
```

```


FriendlyName : Parsec Virtual Display Adapter
Status       : OK
Problem      : CM_PROB_NONE
InstanceId   : ROOT\DISPLAY\0000

FriendlyName : AMD Radeon RX 5600 XT
Status       : Error
Problem      : CM_PROB_DISABLED
InstanceId   : PCI\VEN_1002&DEV_731F&SUBSYS_57101682&REV_CA\6&36A91AF7&0&00000019



```
