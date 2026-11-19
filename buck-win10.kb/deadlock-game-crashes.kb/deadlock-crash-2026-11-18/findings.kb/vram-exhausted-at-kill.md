---
status: confirmed
evidence:
  - ~/claude/windows-forensics/dwm-vram-contention.log, line 2026-11-18T19:20:03
  - scheduled task DWM-VRAM-contention-notice LastRunTime 19:20:00
---

# The "450 MB" alert was DWM's VRAM, on a full 6 GB card

The 19:20:03 snapshot reads total=6121MB, deadlock=5051, dwm=461, chrome=428.
The RX 5600 XT has 6 GB of dedicated VRAM, so it was full and Deadlock held 83%
of it. DWM's 461 MB is in line with today's other entries (367-465). The toast
text ("DWM thrashing VRAM ... Top: deadlock 5051MB, dwm 461MB") presents DWM as
the actor, which invites killing it. After the kill, DWM had to rebuild its
surfaces on a card with no free VRAM. This is the likely path into TDR 117
about 60 s later.
