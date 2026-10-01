---
at: 2026-09-23T10:46:38-05:00
source: journalctl --user (evidence.kb/005)
confidence: observed
---

# Manual emergency renice, then tmux restarts fresh

`sudo renice -n -20 689 687` at 10:46:38 local -- a manual intervention
(TTY pts/3) between the OOM kill (10:44:45) and the tmux server's
restart. The current `tmux new -s claude` (PID 2593, parent 269 --
systemd, not a supervised unit) has `lstart` 10:47:48, one minute after
the renice and three after the OOM kill. Neither dmesg nor
`journalctl --user`/`journalctl -k` in this window contains a distinct
kill or exit record naming tmux or PIDs 689/687, so this is timing
correlation, not a logged cause for tmux's own death -- see
`findings.kb/tmux-death-correlated-not-proven.md`.
