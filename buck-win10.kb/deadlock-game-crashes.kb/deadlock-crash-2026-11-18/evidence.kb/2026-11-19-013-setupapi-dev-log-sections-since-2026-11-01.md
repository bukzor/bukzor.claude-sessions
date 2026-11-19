---
captured: "2026-11-19"
method: ./2026-11-19-013-setupapi-dev-log-sections-since-2026-11-01.sh
---

# setupapi.dev.log sections since 2026-11-01

```sh
'bash' '-c' 'awk '\''/^>>>  \[/{keep=0} /Section start 2026\/11/{keep=1} keep'\'' /mnt/c/Windows/INF/setupapi.dev.log | grep -E '\''>>>|Section start|<<<|1002|731F|isable|Exit status'\'' | tail -60'
```

```
>>>  Section start 2026/11/13 13:06:37.919
<<<  Section end 2026/11/13 13:06:40.257
<<<  [Exit status: SUCCESS]
>>>  Section start 2026/11/13 13:06:39.848
<<<  Section end 2026/11/13 13:06:39.851
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/13 13:06:39.854
<<<  Section end 2026/11/13 13:06:39.856
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/13 13:06:39.859
<<<  Section end 2026/11/13 13:06:39.861
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/13 13:06:40.003
<<<  Section end 2026/11/13 13:06:40.246
<<<  [Exit status: FAILURE(0x00000002)]
>>>  Section start 2026/11/14 09:47:13.691
<<<  Section end 2026/11/14 09:47:15.392
<<<  [Exit status: SUCCESS]
>>>  Section start 2026/11/14 09:47:15.206
<<<  Section end 2026/11/14 09:47:15.208
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/14 09:47:15.211
<<<  Section end 2026/11/14 09:47:15.213
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/14 09:47:15.215
<<<  Section end 2026/11/14 09:47:15.217
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/14 09:47:15.219
<<<  Section end 2026/11/14 09:47:15.380
<<<  [Exit status: FAILURE(0x00000002)]
>>>  Section start 2026/11/16 15:27:27.903
<<<  Section end 2026/11/16 15:27:29.714
<<<  [Exit status: SUCCESS]
>>>  Section start 2026/11/16 15:27:29.508
<<<  Section end 2026/11/16 15:27:29.510
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/16 15:27:29.511
<<<  Section end 2026/11/16 15:27:29.514
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/16 15:27:29.516
<<<  Section end 2026/11/16 15:27:29.518
<<<  [Exit status: FAILURE(0x00000003)]
>>>  Section start 2026/11/16 15:27:29.521
<<<  Section end 2026/11/16 15:27:29.702
<<<  [Exit status: FAILURE(0x00000002)]
>>>  Section start 2026/11/17 19:14:04.076
<<<  Section end 2026/11/17 19:14:04.388
<<<  [Exit status: SUCCESS]
>>>  Section start 2026/11/17 19:14:04.500
<<<  Section end 2026/11/17 19:14:05.063
<<<  [Exit status: SUCCESS]
>>>  Section start 2026/11/18 19:22:53.954
<<<  Section end 2026/11/18 19:22:54.097
<<<  [Exit status: SUCCESS]
>>>  Section start 2026/11/18 19:22:56.508
<<<  Section end 2026/11/18 19:22:56.574
<<<  [Exit status: SUCCESS]
>>>  Section start 2026/11/18 19:22:57.101
<<<  Section end 2026/11/18 19:22:57.307
<<<  [Exit status: SUCCESS]
```
