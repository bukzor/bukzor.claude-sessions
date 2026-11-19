---
captured: "2026-11-19"
method: ./2026-11-19-016-livekernelreports-directory.sh
---

# LiveKernelReports directory

```sh
'bash' '-c' 'find /mnt/c/Windows/LiveKernelReports -newermt 2026-11-17 -printf "%TY-%Tm-%Td %TH:%TM %s %p\n" 2>&1 | sort'
```

```
find: ‘/mnt/c/Windows/LiveKernelReports’: Permission denied
```
