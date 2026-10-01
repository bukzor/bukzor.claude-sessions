---
status: likely
evidence:
  - evidence.kb/2026-09-23-005-tmux-process-age-and-journalctl-user-around-the-oom-kill-window-redo-of-failed-002.md
  - timeline.kb/2026-09-23-003-emergency-renice-and-tmux-restart.md
---

# tmux's death is timing-correlated with the storm, not log-proven

The current tmux server (`tmux new -s claude`, PID 2593) started fresh
at 10:47:48 local -- 3 minutes after the OOM kill (10:44:45) and 1
minute after a manual `sudo renice -n -20 689 687` (10:46:38, TTY
pts/3). Neither dmesg nor `journalctl --user`/`journalctl -k` in the
10:35-10:50 window names tmux or PIDs 689/687 in a kill or exit record
-- dmesg shows exactly one OOM-killed process (PID 14326, `claude`),
and this container does not forward kernel logs to the user journal
(confirmed again here: "No entries" for `journalctl -k` in-window,
consistent with prior sessions' finding on this host).

Two explanations remain open, neither provable from available logs:
tmux was a second, unlogged OOM/ENOMEM casualty (renice targets 689/687
no longer resolve to anything inspectable, so whether they were the old
tmux server can't be checked after the fact); or tmux merely appeared
dead from extreme CPU starvation (load average peaked at 32/71/38) and
was manually restarted. The renice between the kill and the restart is
consistent with either -- an attempt to save a starving process that
failed, or an attempt made moot once tmux was already gone.
