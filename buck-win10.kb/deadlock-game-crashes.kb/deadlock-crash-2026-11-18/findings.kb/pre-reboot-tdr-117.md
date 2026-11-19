---
status: confirmed
evidence:
  - ../evidence.kb/2026-11-19-015-livekernelevent-restartmanager-dwm-full-text-19-15-19-22.md
  - ../evidence.kb/2026-11-19-009-winsrvext-user32-shutdown-block-events-full-text.md
---

# The first failure was a GPU timeout (TDR) that did not recover

The sequence was: DWM exits (primary display AMD), then LiveKernelEvent 117, then deadlock.exe hung, then AMD's atieclxx.exe blocked shutdown, then a hard reset. Minidumps for the 117 event are in C:\Windows\LiveKernelReports, which is unreadable from WSL (permission denied).
