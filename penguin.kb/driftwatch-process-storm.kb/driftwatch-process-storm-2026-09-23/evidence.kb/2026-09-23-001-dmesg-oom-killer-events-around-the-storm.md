---
captured: "2026-09-23"
method: ./2026-09-23-001-dmesg-oom-killer-events-around-the-storm.sh
---

# dmesg: OOM killer events around the storm

```sh
'bash' '-c' 'dmesg -T | grep -B5 -A2 -i "oom\|killed process\|out of memory"'
```

```
[Sat Sep 19 05:01:57 2026] maitred: Received OnHostNetworkChanged request
[Sat Sep 19 14:41:07 2026] virtio_balloon virtio7: Out of puff! Can't get 1 pages
[Sun Sep 20 03:20:55 2026] virtio_balloon virtio7: Out of puff! Can't get 1 pages
[Wed Sep 23 10:44:29 2026] maitred: <unknown process> (29544) exited with status 127
[Wed Sep 23 10:44:33 2026] vshd: vshd started
[Wed Sep 23 10:44:41 2026] claude-mitmprox invoked oom-killer: gfp_mask=0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO), order=0, oom_score_adj=200
[Wed Sep 23 10:44:42 2026] CPU: 6 PID: 29205 Comm: claude-mitmprox Not tainted 6.6.119-09251-gf81e51484dec #1
[Wed Sep 23 10:44:42 2026] Hardware name: ChromiumOS crosvm, BIOS 0 
[Wed Sep 23 10:44:42 2026] Call Trace:
[Wed Sep 23 10:44:42 2026]  <TASK>
[Wed Sep 23 10:44:42 2026]  dump_stack_lvl+0x5e/0x90
[Wed Sep 23 10:44:42 2026]  dump_header+0x43/0x140
[Wed Sep 23 10:44:42 2026]  oom_kill_process+0x157/0x1a0
[Wed Sep 23 10:44:42 2026]  out_of_memory+0x1cf/0x2c0
[Wed Sep 23 10:44:42 2026]  __alloc_pages_may_oom+0xf4/0x1b0
[Wed Sep 23 10:44:42 2026]  __folio_alloc+0x1c3e/0x1d40
[Wed Sep 23 10:44:42 2026]  ? filemap_map_pages+0x5dc/0x8c0
--
[Wed Sep 23 10:44:42 2026] Total swap = 0kB
[Wed Sep 23 10:44:42 2026] 3800991 pages RAM
[Wed Sep 23 10:44:42 2026] 0 pages HighMem/MovableOnly
[Wed Sep 23 10:44:42 2026] 92376 pages reserved
[Wed Sep 23 10:44:42 2026] Tasks state (memory values in pages):
[Wed Sep 23 10:44:42 2026] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
[Wed Sep 23 10:44:42 2026] [    108]   202   108   245813      448   200704        0             0 vm_syslog
[Wed Sep 23 10:44:42 2026] [    109]     0   109     4534      320    81920        0             0 vshd
--
[Wed Sep 23 10:44:42 2026] [    899]  1000   899     9080      992   106496        0           200 ld-linux-x86-64
[Wed Sep 23 10:44:42 2026] [    902]  1000   902     9079      992   102400        0           200 ld-linux-x86-64
[Wed Sep 23 10:44:42 2026] [    907]  1000   907     1825      256    45056        0           200 ld-linux-x86-64
[Wed Sep 23 10:44:42 2026] [    910]  1000   910     1825      192    53248        0           200 ld-linux-x86-64
[Wed Sep 23 10:44:42 2026] [    925]   998   925    95310     1033   110592        0             0 polkitd
[Wed Sep 23 10:44:42 2026] [    930] 61876   930      647      416    49152        0          -100 earlyoom
[Wed Sep 23 10:44:42 2026] [    982]  1000   982    13826     3488   147456        0           200 ld-linux-x86-64
[Wed Sep 23 10:44:42 2026] [    983]  1000   983    13829     3520   147456        0           200 ld-linux-x86-64
--
[Wed Sep 23 10:44:45 2026] [  29421]  1000 29421     3912      992    69632        0           200 claude-mitmprox
[Wed Sep 23 10:44:45 2026] [  29422]  1000 29422     4168     1184    69632        0           200 claude-mitmprox
[Wed Sep 23 10:44:45 2026] [  29545]  1000 29545     4534      288    73728        0           200 ld-linux-x86-64
[Wed Sep 23 10:44:45 2026] [  29547]  1000 29547     2020      960    65536        0           200 bash
[Wed Sep 23 10:44:45 2026] [  29564]  1000 29564     2660       96    53248        0           200 direnv
[Wed Sep 23 10:44:45 2026] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=lxc.payload.penguin,mems_allowed=0,global_oom,task_memcg=/lxc.payload.penguin/user.slice/user-1000.slice/user@1000.service,task=claude,pid=14326,uid=1000
[Wed Sep 23 10:44:45 2026] Out of memory: Killed process 14326 (claude) total-vm:5599588kB, anon-rss:565596kB, file-rss:2812kB, shmem-rss:0kB, UID:1000 pgtables:2384kB oom_score_adj:200
[Wed Sep 23 10:53:17 2026] vshd: Failed to read from stdio: Input/output error (5)
[Wed Sep 23 10:56:44 2026] vshd: vshd started
```
