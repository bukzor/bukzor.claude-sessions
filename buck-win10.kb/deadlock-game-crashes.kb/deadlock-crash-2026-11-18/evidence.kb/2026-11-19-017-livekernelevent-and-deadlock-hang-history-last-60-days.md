---
captured: "2026-11-19"
method: ./2026-11-19-017-livekernelevent-and-deadlock-hang-history-last-60-days.sh
---

# LiveKernelEvent and deadlock hang history, last 60 days

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="Application"; StartTime=(Get-Date).AddDays(-60); Id=1001,1002,10002} | ? { $_.Message -match "LiveKernelEvent|deadlock.exe" } | % { $p1 = if ($_.Message -match "P1: (\S+)") { $matches[1] } else { "" }; "{0:yyyy-MM-dd HH:mm} {1,-6} P1={2}" -f $_.TimeCreated,$_.Id,$p1 }'
```

```
2026-11-18 19:25 1001   P1=117
2026-11-18 19:22 1001   P1=117
2026-11-18 19:21 10002  P1=
2026-11-18 19:21 1001   P1=117
2026-11-18 19:21 1001   P1=117
2026-11-17 17:36 1002   P1=
2026-11-17 17:36 1001   P1=deadlock.exe
2026-11-14 20:50 1002   P1=
2026-11-14 20:50 1001   P1=deadlock.exe
2026-11-09 10:42 1001   P1=deadlock.exe
2026-11-04 15:20 1001   P1=deadlock.exe
2026-11-04 15:20 1001   P1=deadlock.exe
2026-11-02 13:03 1001   P1=deadlock.exe
2026-11-01 18:21 1001   P1=deadlock.exe
2026-10-30 17:05 1002   P1=
2026-10-30 17:05 1001   P1=deadlock.exe
2026-10-30 09:40 1002   P1=
2026-10-30 09:40 1001   P1=deadlock.exe
2026-10-27 20:15 1001   P1=124
2026-10-27 20:15 1001   P1=124
2026-10-17 12:38 1002   P1=
2026-10-17 12:38 1001   P1=deadlock.exe
2026-10-05 16:08 1001   P1=124
2026-10-05 16:08 1001   P1=124
2026-10-02 19:19 1001   P1=deadlock.exe
2026-10-01 17:27 1001   P1=deadlock.exe
2026-09-29 16:20 1001   P1=124
2026-09-29 16:20 1001   P1=124
2026-09-26 11:11 1002   P1=
2026-09-26 11:11 1001   P1=deadlock.exe
2026-09-25 19:28 1002   P1=
2026-09-25 19:28 1001   P1=deadlock.exe
```
