---
status: confirmed
evidence:
  - ~/claude/windows-forensics/dwm-vram-contention.log (per-day dwm min/max, 2026-10-20..11-18)
  - System 6005 boots 10-27, 11-06, 11-11, 11-18; Dwminit exits 11-18 15:20 and 19:20
---

# DWM's VRAM leaks about 100-200 MB/day; a reboot or DWM restart resets it

- Drops line up with resets: boots on 10-27, 11-06 and 11-11, and a DWM
  restart on 11-18 at 15:20 (2390 -> 367 MB).
- Peak was about 2.4 GB on 11-17/18.
- The 15:20 DWM restart recovered cleanly; Deadlock was not running (it
  launched at 15:21:11). The 19:20 restart, made with Deadlock running and VRAM
  full, hung the GPU.
- 867 of 902 contention events (96%) happened with Deadlock running. They fire
  even when DWM is freshly reset (about 400 MB), so the leak worsens the
  contention but does not cause it alone.
