---
captured: "2026-11-19"
method: ./2026-11-19-018-registry-lastwritetime-of-the-amd-gpu-enum-key.sh
---

# Registry LastWriteTime of the AMD GPU Enum key

```sh
'powershell.exe' '-NoProfile' '-Command' $'\nAdd-Type -TypeDefinition @"\nusing System; using System.Runtime.InteropServices; using Microsoft.Win32.SafeHandles;\npublic static class R { [DllImport("advapi32.dll", CharSet=CharSet.Unicode)] public static extern int RegQueryInfoKey(SafeRegistryHandle h, IntPtr c, IntPtr cl, IntPtr r, IntPtr sk, IntPtr msk, IntPtr mc, IntPtr v, IntPtr mvn, IntPtr mvl, IntPtr sd, out long ft); }\n"@\n$p="SYSTEM\\CurrentControlSet\\Enum\\PCI\\VEN_1002&DEV_731F&SUBSYS_57101682&REV_CA\\6&36A91AF7&0&00000019"\n$k=[Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($p)\n$ft=0; [void][R]::RegQueryInfoKey($k.Handle,0,0,0,0,0,0,0,0,0,0,[ref]$ft)\n"Enum key LastWriteTime: " + [DateTime]::FromFileTime($ft).ToString("yyyy-MM-dd HH:mm:ss.fff zzz")\n"ConfigFlags: " + $k.GetValue("ConfigFlags")'
```

```
Enum key LastWriteTime: 2026-11-18 19:33:08.404 -06:00
ConfigFlags: 0
```
