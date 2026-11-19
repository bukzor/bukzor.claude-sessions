# Reword the DWM contention toast so it doesn't invite killing dwm.exe

The source is ~/claude/windows-forensics/notify-dwm-contention.ps1. It is
installed inline into the DWM-VRAM-contention-notice task by
install-dwm-500-watch.sh, so a reinstall is needed after editing. The toast
should name the top non-DWM consumer and warn that killing dwm.exe while VRAM
is full can hang the GPU. The monitor has no threshold: it fires on every
Windows event 500.
