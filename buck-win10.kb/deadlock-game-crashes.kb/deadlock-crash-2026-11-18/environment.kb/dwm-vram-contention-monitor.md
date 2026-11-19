# Monitor: DWM-VRAM-contention-notice (Windows scheduled task)

- Trigger: Diagnostics-Performance/Operational event 500 (DWM video-memory
  contention). Runs as worki, Interactive, Limited.
- Action: an inline-encoded copy of
  ~/claude/windows-forensics/notify-dwm-contention.ps1, installed by
  install-dwm-500-watch.{sh,ps1}. It shows a toast and appends per-process
  dedicated VRAM to ~/claude/windows-forensics/dwm-vram-contention.log.
- Origin: the 2026-06-06 VRAM-thrash investigation
  (~/claude/windows-forensics/FINDINGS.md). Event 500 fires 6-11 times a day
  on this box.
