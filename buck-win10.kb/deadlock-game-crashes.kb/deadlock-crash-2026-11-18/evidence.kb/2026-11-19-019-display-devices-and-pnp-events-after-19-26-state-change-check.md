---
captured: "2026-11-19"
method: ./2026-11-19-019-display-devices-and-pnp-events-after-19-26-state-change-check.sh
---

# Display devices and PnP events after 19:26 (state change check)

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-PnpDevice -Class Display | Format-Table FriendlyName,Status,Problem -AutoSize; Get-WinEvent -FilterHashtable @{LogName="System","Microsoft-Windows-Kernel-PnP/Configuration","Application"; StartTime=[datetime]"2026-11-18 19:26"} -ErrorAction SilentlyContinue | ? { $_.Message -match "1002|Radeon|Display|amd|dwm" } | Format-List TimeCreated,LogName,Id,ProviderName,@{n="Msg";e={($_.Message -split "`n")[0..3] -join " | "}}'
```

```

FriendlyName                   Status            Problem
------------                   ------            -------
Parsec Virtual Display Adapter OK           CM_PROB_NONE
AMD Radeon RX 5600 XT          Error  CM_PROB_FAILED_ADD




TimeCreated  : 11/18/2026 7:33:13 PM
LogName      : Application
Id           : 1001
ProviderName : Windows Error Reporting
Msg          : Fault bucket , type 0 | Event Name: LiveKernelEvent | Response: Not available | Cab Id: 0

TimeCreated  : 11/18/2026 7:33:13 PM
LogName      : Application
Id           : 1001
ProviderName : Windows Error Reporting
Msg          : Fault bucket , type 0 | Event Name: LiveKernelEvent | Response: Not available | Cab Id: 0

TimeCreated  : 11/18/2026 7:33:13 PM
LogName      : Application
Id           : 1001
ProviderName : Windows Error Reporting
Msg          : Fault bucket , type 0 | Event Name: LiveKernelEvent | Response: Not available | Cab Id: 0

TimeCreated  : 11/18/2026 7:27:55 PM
LogName      : System
Id           : 1808
ProviderName : Microsoft-Windows-TPM-WMI
Msg          : This device has updated Secure Boot CA/keys. This device signature information is included here. | 
               DeviceAttributes: BaseBoardManufacturer:ASRock;FirmwareManufacturer:American Megatrends 
               Inc.;FirmwareVersion:P1.40;OEMModelNumber:To Be Filled By O.E.M.;OEMModelBaseBoard:B550AM 
               Gaming;OEMModelSystemFamily:To Be Filled By O.E.M.;OEMManufacturerName:To Be Filled By 
               O.E.M.;OEMModelSKU:To Be Filled By O.E.M.;OSArchitecture:amd64; | BucketId: 
               b3fda3ee0aba668f103728e5fcc2a52f014d1bab78281ec58a22cdde520718e2 | BucketConfidenceLevel: High 
               Confidence



```
